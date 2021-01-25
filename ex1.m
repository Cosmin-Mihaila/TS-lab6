syms t;
syms s;

A = [0 0 0; 1 0 -1; 0 1 2];
B = [0 -1; 1 0; 0 1];
[n, m] = size(B);
C = [1 0 1];
u_t = [1; -2];
u_s = [1/s; -2/s];

lambda1 = -1;
lambda2 = -1;
lambda3 = -1;
lambda = [lambda1; lambda2; lambda3];

%P 1
R = ctrb(A, B)
if (length(A) - rank(R)) ~= 0
    disp('Perechea (A,B) nu este controlabila');
    return
end

while true
    %P 2
    g = rand(m,1);
    F0 = rand(m, n);
    
    %P 3
    A0 = A + B * F0
    b0 = B * g
    
    %P 4
    R0 = ctrb(A0, b0)
    if (length(A0) - rank(R0)) == 0
        break
    end
end

%P 5
R0_inv = R0^(-1)
q_T = R0_inv(end, :)
x_A0 = 1;
for i = 1:length(lambda)
    x_A0 = x_A0* (A0 - eye(n)*lambda(i))
end
f_T = -q_T * x_A0

%P 6
F = F0 + g * f_T

G = eye(m)







