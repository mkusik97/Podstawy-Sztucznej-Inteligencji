close all; clear all; clc;

PR = [0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; % PR - liczba wektorów wejœcia
       0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1];
S = 1;     % N = Liczba neuronow (wyjœcia)
net = newlin(PR,S,0,0.01);                                      
net.name = 'Sieæ rozpoznaje wielkie i ma³e litery';

net1 = newff(PR,S,{'tansig'},'trainbr'); 

% tablica znaków wejœciowych
         % A a B b C c D d E e F f H h I i K k L l
Wejscie = [0 0 1 1 0 0 1 0 1 0 1 0 1 1 0 0 1 1 1 0; % 1.
           1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 0 0;
           1 0 1 0 1 0 1 0 1 0 1 1 0 0 1 0 0 0 0 0; 
           1 0 1 0 1 0 1 1 1 0 1 1 0 0 1 0 0 0 0 0;
           0 0 0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0;
           
           1 0 1 1 1 0 1 0 1 0 1 0 1 1 0 0 1 1 1 0; % 2.
           0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1; 
           0 1 0 0 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 1;
           0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0;
           1 0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0; 
           
           1 0 1 1 1 0 1 0 1 1 1 0 1 1 0 0 1 1 1 0; % 3.
           0 0 1 0 0 1 0 0 1 0 1 1 1 1 0 0 0 0 0 0;
           0 0 1 0 0 1 0 0 1 0 1 0 1 1 1 0 1 0 0 1;
           0 0 1 0 0 1 0 1 0 1 1 0 1 0 0 0 0 1 0 0;
           1 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0;
           
           1 0 1 1 1 1 1 0 1 1 1 1 1 1 0 0 1 1 1 0; % 4.
           1 1 0 1 0 0 0 1 0 1 0 1 0 0 0 1 1 1 0 0;  
           1 1 0 1 0 0 0 1 0 1 0 1 0 0 1 1 0 1 0 1;
           1 1 0 0 0 0 0 1 0 1 0 0 0 1 0 0 1 0 0 0;
           1 1 1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0;
           
           1 1 1 1 1 1 1 1 1 1 1 0 1 1 0 0 1 1 1 0; % 5.
           0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0; 
           0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1;
           0 0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0;
           1 1 1 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0 0 0;
           
           1 0 1 1 0 0 1 0 1 0 1 0 1 1 0 0 1 1 1 0; % 6.
           0 1 1 1 1 1 1 1 1 1 0 1 0 0 1 1 0 0 0 1;                     
           0 1 1 1 1 1 1 1 1 1 0 0 0 0 1 1 0 0 0 1;
           0 1 1 0 1 1 1 1 1 1 0 0 0 1 1 1 0 0 0 1;                     
           1 1 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 1 1 0; ];

% tablica znaków wyjœciowych
         % A a B b C c D d E e F f H h I i K k L l
Wyjscie = [1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0];   
            % wartoœæ 1 - wielka litera
            % wartoœæ 0 - mala litera

% Parametry sieci do testowania
net.trainParam.epochs = 1000;     % liczba epok
net.trainParam.goal = 0.001;      % b³¹d œredniokwadratowy
net.trainParam.mu = 0.001;        % wspó³czynnik uczenia
net = train(net, Wejscie, Wyjscie);  % uczenie sieci
% symulacja = sim(net,Wejscie);  % symulacja

net1.trainParam.epochs = 100;
net1.trainParam.goal = 0.001;
net1.trainParam.mu = 0.001;
net1 = train(net1, Wejscie, Wyjscie);
% symulacja1 = sim(net1,Wejscie);  % symulacja

    test_A = [ 0; 1; 1; 1; 0;
               1; 0; 0; 0; 1;
               1; 0; 0; 0; 1;
               1; 1; 1; 1; 1;
               1; 0; 0; 0; 1;
               1; 0; 0; 0; 1 ];
           
     test_i = [ 0; 0; 0; 0; 0;
                0; 0; 1; 0; 0;     
                0; 0; 0; 0; 0;
                0; 1; 1; 0; 0;
                0; 0; 1; 0; 0;
                0; 1; 1; 1; 0 ];
    
     test_F = [ 1; 1; 1; 1; 1;      
                1; 0; 0; 0; 0;
                1; 1; 1; 1; 0;
                1; 0; 0; 0; 0;
                1; 0; 0; 0; 0;
                1; 0; 0; 0; 0 ];
     
	test_d = [ 0; 0; 0; 1; 0;      
               0; 0; 0; 1; 0;
               0; 0; 0; 1; 0;
               0; 1; 1; 1; 0;
               1; 0; 0; 1; 0;
               0; 1; 1; 1; 0 ];
     
	test_H = [ 1; 0; 0; 0; 1;
               1; 0; 0; 0; 1;
               1; 1; 1; 1; 1;
               1; 0; 0; 0; 1;
               1; 0; 0; 0; 1 ];
  
           
	test_K = [ 1; 0; 0; 1; 0;
               1; 0; 1; 0; 0;
               1; 1; 0; 0; 0;
               1; 0; 1; 0; 0;
               1; 0; 0; 1; 0 ];
    
	test_l = [ 1; 0; 0; 0; 0;
               1; 0; 0; 0; 0;
               1; 0; 0; 0; 0;
               1; 0; 0; 0; 0;
               1; 1; 1; 0; 0 ];

       
symulacja = sim(net, test_A);        % symulacja z danymi testowymi
if round(symulacja) == 1
    disp('Podana litera jest wielka'); disp(round(symulacja));
else
    disp('Podana litera jest mala'); disp(round(symulacja));
end

symulacja1 = sim(net1, test_A);
if round(symulacja1) == 1
    disp('Podana litera jest wielka'); disp(round(symulacja1));
else
    disp('Podana litera jest mala'); disp(round(symulacja1));
end