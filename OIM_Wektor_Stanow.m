close;
clear;

% [X, Y, vX, vY]
A = [0, 1; 0, 0];
B = [1, 1; 0, 0];
C = [1, 0; 0, 0];
D = [0, 0; 0, 0];

% velocity = 0.02;
%  A_v = 0.02;
%  B_v = 0.005;
%  C_v = 0.008;
%  D_v = 0.03;

Const = 0.003;

steps = 125;
sigma = 0.01;


A_steps = zeros(steps,2);
B_steps = zeros(steps,2);
C_steps = zeros(steps,2);
D_steps = zeros(steps,2);


plot(A(1,1),A(1,2), 'o', B(1,1), B(1,2), 'o', ...
     C(1,1), C(1,2), 'o',D(1,1), D(1,2), 'o');
axis([-.2,1.2,-.2,1.2]);

pause(1);
for i = 1:1:steps
    %establishing new state for each point
    A_steps(i,1) = A(1,1);
    A_steps(i,2) = A(1,2);
%     A(1,1) = A(1,1) + A(2,1) + (randn(1,1)*sigma);
%     A(1,2) = A(1,2) + A(2,2) + (randn(1,1)*sigma);
    A(1,1) = A(1,1) + A(2,1);
    A(1,2) = A(1,2) + A(2,2);

    B_steps(i,1) = B(1,1);
    B_steps(i,2) = B(1,2);
%     B(1,1) = B(1,1) + B(2,1) + (randn(1,1)*sigma);
%     B(1,2) = B(1,2) + B(2,2) + (randn(1,1)*sigma);
    B(1,1) = B(1,1) + B(2,1);
    B(1,2) = B(1,2) + B(2,2);

    C_steps(i,1) = C(1,1);
    C_steps(i,2) = C(1,2);
%     C(1,1) = C(1,1) + C(2,1) + (randn(1,1)*sigma);
%     C(1,2) = C(1,2) + C(2,2) + (randn(1,1)*sigma);
    C(1,1) = C(1,1) + C(2,1);
    C(1,2) = C(1,2) + C(2,2);
    
    D_steps(i,1) = D(1,1);
    D_steps(i,2) = D(1,2);
%     D(1,1) = D(1,1) + D(2,1) + (randn(1,1)*sigma);
%     D(1,2) = D(1,2) + D(2,2) + (randn(1,1)*sigma);
    D(1,1) = D(1,1) + D(2,1);
    D(1,2) = D(1,2) + D(2,2);
    
    plot(A(1,1),A(1,2), 'o', B(1,1), B(1,2), 'o', ...
         C(1,1), C(1,2), 'o',D(1,1), D(1,2), 'o');
    axis([-.2,1.2,-.2,1.2]);
%     hold on

    %calculating new velocity vectors
    A(2,1) = -(A(1,1) - B(1,1));
    A(2,2) = -(A(1,2) - B(1,2));
    A_vel = [A(2,1), A(2,2)];
    A_vel = A_vel./norm(A_vel);
    
    A_v = Const * ((A(1,1) - (B(1,1)))^2 + (A(1,2) - B(1, 2))^2)^(-1);

    A(2,1) = A_vel(1,1) * A_v;
    A(2,2) = A_vel(1,2) * A_v;

    B(2,1) = -(B(1,1) - C(1,1));
    B(2,2) = -(B(1,2) - C(1,2));
    B_vel = [B(2,1), B(2,2)];
    B_vel = B_vel./norm(B_vel);

    B_v = Const * ((B(1,1) - (C(1,1)))^2 + (B(1,2) - C(1, 2))^2)^(-1);

    B(2,1) = B_vel(1,1) * B_v;
    B(2,2) = B_vel(1,2) * B_v;

    C(2,1) = -(C(1,1) - D(1,1));
    C(2,2) = -(C(1,2) - D(1,2));
    C_vel = [C(2,1), C(2,2)];
    C_vel = C_vel./norm(C_vel);

    C_v = Const * ((C(1,1) - (D(1,1)))^2 + (C(1,2) - D(1, 2))^2)^(-1);

    C(2,1) = C_vel(1,1) * C_v;
    C(2,2) = C_vel(1,2) * C_v;

    D(2,1) = -(D(1,1) - A(1,1));
    D(2,2) = -(D(1,2) - A(1,2));
    D_vel = [D(2,1), D(2,2)];
    D_vel = D_vel./norm(D_vel);

    D_v = Const * ((D(1,1) - (A(1,1)))^2 + (D(1,2) - A(1, 2))^2)^(-1);

    D(2,1) = D_vel(1,1) * D_v;
    D(2,2) = D_vel(1,2) * D_v;

    pause(0.0005);
end


%draw route of each point
plot(A_steps(:,1), A_steps(:,2),B_steps(:,1), B_steps(:,2), ...
        C_steps(:,1), C_steps(:,2), D_steps(:,1), D_steps(:,2));
axis([-.2,1.2,-.2,1.2]);

