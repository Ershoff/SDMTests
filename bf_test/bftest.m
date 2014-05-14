%% Description: Testing Bellman-Ford Algorythm.
clc; clear;

%% Initial parameters
len = 10;
high = 10;
save_flag = 0;
load_flag = 0;
path_to_file = 'c:\Users\Egorius\Desktop\SDModel\SDModel_vers\SDModel_30apr\test\bf_test\intgraph3x3';

[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);

p = 1;  %Node for counting

L = 30;
mu = 1;

t = net(:,3);
[a, ah] = BFa(p, t, L, mu, net, mc);

A = a
AH = ah

for i = 100:100:3000
    i
    [a, ah] = BFa(p,t,L,mu,net,mc);
    t = t / i;
    order = max(t)
    ah(:,30)
end
    
    %% RESULT
    %1. Tested for graph up to 3x3 size by closed quantity.
    %2. for good work of algorythm and ah therefore it is nessesary to make
    %t small enough. Particularry t ~ 10^-100 it is still ok, but t greater
    %when 10^2 error in computation becomes.
    
