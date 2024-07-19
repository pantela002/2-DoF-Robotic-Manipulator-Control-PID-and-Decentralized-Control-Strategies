function [q_ref, dq_ref, ddq_ref] = planiranje_trajektorije(dt, T, startValue1,startValue2, stopValueB1,stopValueB2, stopValueC1,stopValueC2)

% pocetni i krajnji polozaji tokom kretanja
qi = [startValue1; startValue2];    % tacka A
qB = [stopValueB1; stopValueB2];    % tacka B
qC = [stopValueC1; stopValueC2];    % tacka C

% vremenski parametri
Tf = 0.5*T;  

% A-B: interpolacija polinomom treceg stepena
time = linspace(0, Tf, Tf/dt);

% koeficijenti polinoma
a0 = qi;
a1 = [0; 0];
a2 = 3 * (qB - qi) / (T/2)^2;
a3 = -2 * (qB - qi) / (T/2)^3;

q_ref_ab = zeros(2, length(time));
dq_ref_ab = zeros(2, length(time));
ddq_ref_ab = zeros(2, length(time));

for j = 1:2
    q_ref_ab(j, :) = a3(j) * time.^3 + a2(j) * time.^2 + a1(j) * time + a0(j);
    dq_ref_ab(j, :) = 3 * a3(j) * time.^2 + 2 * a2(j) * time + a1(j);
    ddq_ref_ab(j, :) = 6 * a3(j) * time + 2 * a2(j);
end

% B-C: point to point
q_ref_bc = repmat(qC, 1, length(time));
dq_ref_bc = zeros(2, length(time));
ddq_ref_bc = zeros(2, length(time));

% Kombinacija referentnih vrednosti za ukupno kretanje od A do B do C
q_ref = [q_ref_ab q_ref_bc];
dq_ref = [dq_ref_ab dq_ref_bc];
ddq_ref = [ddq_ref_ab ddq_ref_bc];



