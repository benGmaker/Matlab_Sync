% define basis vectors
e = cartesianbasis2d('e1', 'e2');
e1 = e(1);
e2 = e(2);

% diffusion tensor
C = 9*e1*e1 + 8*e2*e2;

% nodal positions
xe = [ 0*e1 + 0*e2
       3*e1 + 0*e2
       3*e1 + 1*e2
       0*e1 + 1*e2 ];

% Gauss points
xi = [ -1/sqrt(3)*e1 - 1/sqrt(3)*e2
        1/sqrt(3)*e1 - 1/sqrt(3)*e2
        1/sqrt(3)*e1 + 1/sqrt(3)*e2
       -1/sqrt(3)*e1 + 1/sqrt(3)*e2 ];
w  = [ 1
       1 
       1 
       1 ];

% construct element matrix
Ke = zeros(4, 4);
for k = 1:4
    
    k
    
    xi1 = dot(xi(k), e1);
    xi2 = dot(xi(k), e2);

    gradxiNe = [ -1/4*(1-xi2)*e1 - 1/4*(1-xi1)*e2
                  1/4*(1-xi2)*e1 - 1/4*(1+xi1)*e2
                  1/4*(1+xi2)*e1 + 1/4*(1+xi1)*e2
                 -1/4*(1+xi2)*e1 + 1/4*(1-xi1)*e2 ];
             
    J = gradxiNe' * xe
    
    gradNe = dot(inv(J), gradxiNe)
    
    Ke = Ke + w(k) * dot(gradNe, C, gradNe') * det(J); 

end

Ke
