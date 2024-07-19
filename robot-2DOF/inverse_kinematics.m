function [q1, q2] = inverse_kinematics(X, Z)
    global l
    
    % Initial guess (optional, but helpful for numerical solvers)
    q_guess = [0; 0];  % Initial guess for q1 and q2
    
    % Define function for fsolve
    fun = @(q) forward_kinematics(q, [0; 0], eye(2)) - [X; Z];
    
    % Solve inverse kinematics using fsolve
    q_sol = fsolve(fun, q_guess);
    
    % Extract joint angles q1 and q2
    q1 = q_sol(1);
    q2 = q_sol(2);
end
