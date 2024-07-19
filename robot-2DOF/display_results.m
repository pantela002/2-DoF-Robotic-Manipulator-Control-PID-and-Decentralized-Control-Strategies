close all

%% internal coordinates q
figure('Position',[50 400 700 250]);
for m1 = 1:2
    subplot(1,2,m1)
    switch m1
        case 1
            plot(dt:dt:T,Ps.q_ref(1,:),'r',dt:dt:T,Ps.q(1,:),'b')
            grid
            title('Pozicija zgloba q(1)')
            ylabel('Pozicija[deg]')
            xlabel('Vreme[s]')
            legend('Referentna pozicija q(1)','Pozicija q(1)','Location','NorthEast')
        case 2
            plot(dt:dt:T,Ps.q_ref(2,:),'r',dt:dt:T,Ps.q(2,:),'b')
            grid           
            title('Pozicija zgloba q(2)')
            ylabel('Pozicija[deg]')
            xlabel('Vreme[s]')
            legend('Referentna pozicija q(2)','Pozicija q(2)','Location','NorthEast')
    end
end

figure('Position',[50 400 700 250]);
for m1 = 1:2
    subplot(1,2,m1)
    switch m1
        case 1
            plot(dt:dt:T,Ps.dq_ref(1,:),'r',dt:dt:T,Ps.dq(1,:),'b')
            grid
            title('Brzina prvog zgloba dq(1)')
            ylabel('Brzina[deg/s]')
            xlabel('Vreme[s]')
            legend('Referentna brzina dq(1)','Brzina dq(1)','Location','NorthEast')
        case 2
            plot(dt:dt:T,Ps.dq_ref(2,:),'r',dt:dt:T,Ps.dq(2,:),'b')
            grid           
            title('Brzina drugog zgloba dq(2)')
            ylabel('Brzina[deg/s]')
            xlabel('Vreme[s]')
            legend('Referentna brzina dq(2)','Brzina q(2)','Location','NorthEast')
    end
end

%% external coordinates
figure('Position',[50 50 700 250]);
for m1 = 1:2
    subplot(1,2,m1)
    switch m1
        case 1
            plot(dt:dt:T,Ps.X_ref(1,:),'r',dt:dt:T,Ps.X(1,:),'b')
            grid
            title('Pozicija u dekartovom koordinatnom sistemu x')
            ylabel('Pozicija[m]')
            xlabel('Vreme[s]')
            legend('Referentna pozicija x ref','Stvarna pozicija x','Location','NorthEast')
        case 2
            plot(dt:dt:T,Ps.X_ref(2,:),'r',dt:dt:T,Ps.X(2,:),'b')
            grid           
            title('Pozicija u dekartovom koordinatnom sistemu z')
            ylabel('Pozicija[m]')
            xlabel('Vreme[s]')
            legend('Referentna pozicija z ref','Stvarna pozicija z','Location','NorthEast')
    end
end

%% joint torques
figure('Position',[800 400 700 250]);
for m1 = 1:2
     subplot(1,2,m1)

     switch m1
         case 1
             plot(dt:dt:T,Ps.Tau(1,:),'b')
             grid
             title('Moment prvog zgloba')
             ylabel('Moment[Nm]')
             xlabel('Vreme[s]')
             legend('tau 1')
         case 2
             plot(dt:dt:T,Ps.Tau(2,:),'b')
             grid
             title('Moment drugog zgloba')
             ylabel('Moment[Nm]')
             xlabel('Vreme[s]')
             legend('tau 2')
    end
end 


%% joint torques
figure('Position',[800 400 700 250]);
for m1 = 1:2
     subplot(1,2,m1)

     switch m1
         case 1
             plot(dt:dt:T,Ps.Tau_FF(1,:),'b')
             grid
             title('Feedforward vrednost upravljanja prvog zgloba')
             ylabel('Moment[Nm]')
             xlabel('Vreme[s]')
             legend('tau1 FF')
         case 2
             plot(dt:dt:T,Ps.Tau_FF(2,:),'b')
             grid
             title('Feedforward vrednost upravljanja drugog zgloba')
             ylabel('Moment[Nm]')
             xlabel('Vreme[s]')
             legend('tau2 FF')
     end
     
end 
%% joint torques
figure('Position',[800 400 700 250]);
for m1 = 1:2
     subplot(1,2,m1)

     switch m1
         case 1
             plot(dt:dt:T,Ps.Tau_FB(1,:),'b')
             grid
             title('Feedback vrednost upravljanja PRVOG zgloba')
             ylabel('Moment[Nm]')
             xlabel('Vreme[s]')
             legend('tau1 FB')
         case 2
             plot(dt:dt:T,Ps.Tau_FB(2,:),'b')
             grid
             title('Feedback vrednost upravljanja drugog zgloba')
             ylabel('Moment[Nm]')
             xlabel('Vreme[s]')
             legend('tau2 FB')
    end
end 


