function J = matrix_kin(q, l)

q1=q(1);
q2=q(2);


J11 = l*cos(q1)+l*cos(q1+q2);
J12 = l*cos(q1+q1);
J21 = -l*sin(q1)-l*sin(q1+q2);
J22 = -l*sin(q1+q2);

J = [J11 J12;...
     J21  J22];