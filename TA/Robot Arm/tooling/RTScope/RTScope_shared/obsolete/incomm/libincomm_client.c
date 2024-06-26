
// shared library for network communication
// Rene' van de Molengraft, June, 21th, 2005

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "incomm.h"

#define BACKLOG		10
#define MY_PORT		2039
#define DEST_PORT	2039

static int sockfd2;





int incomm_client_open(const char* ip, int port_id)
{
    struct sockaddr_in dest_addr;
    struct sockaddr_in their_addr;
    int sin_size;
    int len;

//  get socket file descriptor
    if ( (sockfd2=socket(AF_INET, SOCK_STREAM, 0)) ==-1 ) {
//	perror("incomm_client_open: call to socket failed");
//	mexPrintf("incomm_client_open: call to socket failed.\n");
        return INCOMM_ERR;
    }

//  bind
    dest_addr.sin_family=AF_INET;
    dest_addr.sin_port=htons(port_id);
    
    //dest_addr.sin_port=htons(0);
    inet_aton(ip, &(dest_addr.sin_addr));

    //dest_addr.sin_addr.s_addr=INADDR_ANY;
    memset(&(dest_addr.sin_zero),'\0',8);
    
    if ( connect(sockfd2, (struct sockaddr*) &dest_addr, sizeof(struct sockaddr)) == -1 ) {
//	perror("incomm_client_open: call to connect fails");
//	mexPrintf("incomm_client_open: call to connect fails.\n");
	close(sockfd2);
	return INCOMM_ERR;
    }

//    mexPrintf("Client connection opened.\n");

    return INCOMM_SUCCESS;
}





int incomm_client_read(void* pdata, int len_in_bytes)
{
    int len,totlen,ipass;
    
    totlen=0;
    ipass=0;
    
    while (totlen<len_in_bytes) {    
    	if ( (len=recv(sockfd2,pdata+totlen,len_in_bytes,0)) == -1 ) {
//		perror("incomm_client_read: call to recv failed");
//		mexPrintf("incomm_client_read: call to recv failed.\n");
		close(sockfd2);
		return INCOMM_ERR;
    	}
	if (len==0) {
//		mexPrintf("incomm_client_read: server disconnected.\n");
		close(sockfd2);
		return INCOMM_ERR;
	}	
    	totlen=totlen+len;
	ipass++;
    }

//    mexPrintf("incomm_client_read: data read in %d passes.\n",ipass);

    return INCOMM_SUCCESS;
}





int incomm_client_write(void* pdata, int len_in_bytes)
{    
    if ( send(sockfd2,pdata,len_in_bytes,0)==-1 ) {
//    	perror("incomm_client_write: call to send fails");
//    	mexPrintf("incomm_client_write: call to send fails.\n");
	close(sockfd2);
	return INCOMM_ERR;
    }

//    mexPrintf("Client write ready.\n");

    return INCOMM_SUCCESS;
}




int incomm_client_close(void)
{
    close(sockfd2);

//    mexPrintf("Client connection closed.\n");    
    
    return INCOMM_SUCCESS;
}
