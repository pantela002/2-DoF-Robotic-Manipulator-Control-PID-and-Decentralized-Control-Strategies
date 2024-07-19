function dydt_Q_4 = int_2DoF(t, Q_4)
    % Function that defines model of 2DOF robot manipulator

    global l Fint Tau

    % Extract current joint positions and velocities
    q = Q_4(1:2);
    dq = Q_4(3:4);

    % Calculate Jacobian and dynamic matrices
    J = matrix_kin(q,l);
    [H, C, G] = matrix_dyn(q, dq);


    % Dynamics equations
    dydtQ_2 = H \ (Tau + J' * Fint - C * dq - G);

    % Return the derivatives
    dydt_Q_4(1:2) = dq;
    dydt_Q_4(3:4) = dydtQ_2;
    dydt_Q_4 = dydt_Q_4';
end