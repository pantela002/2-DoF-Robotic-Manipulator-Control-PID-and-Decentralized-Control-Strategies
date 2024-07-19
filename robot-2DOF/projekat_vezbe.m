clear all; close all; clc

global m I l l1 l2 g Fint Tau 

%% simulation parameters
t = 0;          % simulation time initialization
dt = 0.001;     % simulation step
T = 5;          % total simulation time
lengthT = T/dt; % number of simulation steps
i = 1;          % simulation stepp 
g = 9.81;       % gravity acceleration
Fint = [-2; 0];  % interaction force - external force

%% kinematics and dynamics parameters
l1 = 0.3;       % [m] length of the 1st link
l2 = 0.3;       % [m] length of the 2nd link
m1 = 2;         % [kg] mass of the 1st link
m2 = 2;         % [kg] mass of the 2nd link
I1 = 0.03;      % [kgm2] moment of inertia of the 1st link
I2 = 0.03;      % [kgm2] moment of inertia of the 2nd link
l = l1; m = m1; I = I1;

%% initial conditions
q = [pi/4; pi/4]; % initial position
dq = [0; 0];                % initial velocity
ddq = [0; 0];               % initial acceleration

%% trajectory planning
% calculate reference joint positions and velocities - trapezoidal profile
q_init = q;                         % start position
qB_stop = [30*pi/180; 120*pi/180];   % stop position
qC_stop = [pi/3 ; pi/3]

[q_ref, dq_ref, ddq_ref] = planiranje_trajektorije(dt, T, q_init(1),q_init(2), qB_stop(1),qB_stop(2),qC_stop(1),qC_stop(2));


%% controller
PID_parameters;

%% main loop
while (t<T)
    t = i*dt;
   
   % Delovanje spoljašnje sile
   if t > 0.35*T && t < 0.4*T
        Fint=[-2;0];
   else
        Fint=[0;0];
   end

   J = matrix_kin(q,l); % calculates J
   J_ref = matrix_kin(q_ref(:,i),l);

   [X, dX] = forward_kinematics(q, dq, J); % q -> X
   [X_ref, dX_ref] = forward_kinematics(q_ref(:,i), dq_ref(:,i), J_ref); % q_ref -> X_ref
   
   [H_kappa, C_kappa, G_kappa] = matrix_dyn(q_ref(:, i), dq_ref(:, i)); % calculates H, C, G


    q_ref_curr = q_ref(:, i);
    dq_ref_curr = dq_ref(:, i);
    ddq_ref_curr = ddq_ref(:, i);
   [Tau, Tau_FF, Tau_FB] = calculate_Tau(q, q_ref_curr, dq, dq_ref_curr, [Kp;Kp], [Kd;Kd],H_kappa,C_kappa,G_kappa, i); % Tau = Tau_FF + Tau_FB
   Tau = Tau - J'*Fint;

   Q_4 = [q; dq];
   options = odeset('RelTol',1e-2,'AbsTol',1e-3,'MaxOrder',3);
   [tout,Q_4_out] = ode45(@int_2DoF,[t t+dt], Q_4, options);
   Q_4 = Q_4_out(end,:)';
   % size(Q_4_out);
   q = Q_4(1:2);
   dq = Q_4(3:4);
    
   % visualisation
   if mod(i,20)==0
      figure(1)
      plot([0 l1*sin(q(1)) l1*sin(q(1))+l2*sin(q(1)+q(2))], [0 l1*cos(q(1)) l1*cos(q(1))+l2*cos(q(1)+q(2))],...
           '--rs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10)
      axis equal;
      axis([0 0.6 -0.1 0.5]);%definisanje osa bez obzira na broj koordinata  
      title('2DoF robot')
      ylabel('z position[m]')
      xlabel('x position[m]')
      grid
      pause(0.01)
   end
   
   write_in_memory;
   i = i+1;
end

display_results