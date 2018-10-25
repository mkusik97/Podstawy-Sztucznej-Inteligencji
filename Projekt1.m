close all; clear all; clc; 

net = newp([0 1; -2 2], 1, 'hardlim');

wejscie = [0 0 1 1; 0 1 0 1];

wyjscie = [0 1 1 1];
plotpv(wejscie, wyjscie);

net.name = 'Bramka OR';
net = init(net);
Y = sim(net, wejscie)

net.trainParam.epochs = 10;
net.trainParam.goal = 0.01;
net.trainParam.mu = 0.001;
net.trainParam.passes = 10;
net.trainParam.show = 15;

net = train(net, wejscie, wyjscie);
plotpc(net.iw{1,1}, net.b{1})
Y1 = sim(net, wejscie)

test = [0 0 1 1; 0 1 0 1]
efekt = sim(net, test)

disp(net);