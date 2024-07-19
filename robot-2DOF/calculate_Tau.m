function [Tau, Tau_FF, Tau_FB] = calculate_Tau(q, q_ref, dq, dq_ref, Kp, Kd, H,C,G, i)
    for j = 1:2
        % Feedforward control - gravity compensation
        Tau_FF(j, 1) = G(j,1);
        %Tau_FF(j, 1) = G(j, 1) + H(j, :) * dq_ref + C(j, :) * dq_ref;
        
        % Feedback PD control 
        error_q = q_ref(j) - q(j);
        error_dq = dq_ref(j) - dq(j);
        Tau_FB(j, 1) = Kp(j,1) * error_q + Kd(j,1) * error_dq;

        % Total control torque
        Tau(j, 1) = Tau_FF(j, 1) + Tau_FB(j, 1);
    end
end