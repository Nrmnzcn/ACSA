%__________________________________________________________________________
%       Artificial Circulation System Algorithm (ACSA) source code 
%
%                        programming: Nermin Özcan
%
%                  Özcan, N., Utku, S., Berber, T. (2025)
% Artificial Circulation System Algorithm: A Novel Bio-Inspired Algorithm 
%        Computer Modeling in Engineering & Sciences, 142(1), 635–663. 
%                  https://doi.org/10.32604/cmes.2024.055860
%  
%                      E-mail: dr.nerminozcan@gmail.com
%                              nermin.ozcan@iste.edu.tr
%__________________________________________________________________________

clear all
clc
format long

SearchAgents_no=100; % Number of search agents
Function_name='F1';
Max_iteration=50; % Maximum number of iterations

[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

%  Tunable parameters of ACSA
S = 0.01;
NH_rate = 0.1;

[Best_score,Best_pos,Convergence_curve]=ACSA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj, NH_rate, S);

% function topology
figure('Position',[500 400 700 290])
subplot(1,2,1);
func_plot(Function_name);
title('Function Topology')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

% Convergence curve
subplot(1,2,2);
semilogy(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');
axis tight
grid on
box on
legend('ACSA')
disp('___________________ACSA_______________________');
display(['The best solution obtained by ACSA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by ACSA is : ', num2str(Best_score)]);