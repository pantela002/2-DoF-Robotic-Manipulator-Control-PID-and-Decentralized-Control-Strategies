Ps.t(i) = i*dt;                 % time [s]    
Ps.q(:,i) = q.*(180/pi);        % joint positions [degrees]
Ps.dq(:,i) = dq.*(180/pi);      % joint velocities [degrees/s]
Ps.X(:,i) = X;                  % Cartesian positions [m]
Ps.X_ref(:,i) = X_ref;          % Cartesian velocities [m/s]
Ps.q_ref(:,i) = q_ref(:,i).*(180/pi);   % reference joint positions [degrees]
Ps.dq_ref(:,i) = dq_ref(:,i).*(180/pi); % reference joint velocities [degrees/s]
Ps.Tau(:,i) = Tau;     % torque [Nm]
Ps.Fint(:,i) = Fint; % interaction force [Nm]
Ps.Tau_FF(:,i)=Tau_FF;
Ps.Tau_FB(:,i)=Tau_FB;
