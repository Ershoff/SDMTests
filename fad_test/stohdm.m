%% Description: This function compute model values: phi and its gradient.
% Input:
% 1. net - information about network [node_o, node_d, time, flow]
% 2. mc - connectivity matrix
% 3. t - arc time vector
% 4. L - length of the max path
% 5. mu - constant of the model
% Output:
% 1. fun - value of the functional 
% 2. grad - gradient of the functional


%% Description: Testing Bellman-Ford Algorythm.
clc; clear;

%% Initial parameters
len = 3;
high = 3;
save_flag = 0;
load_flag = 0;
path_to_file = 'c:\Users\Egorius\Desktop\SDModel\SDModel_vers\SDModel_30apr\test\bf_test\intgraph3x3';

[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);
pairs = making_pairs_func(len*high);
%  Square graph

net

% net(1,3) = 1;
% net(2,3) = 5;
% net(3,3) = 1;
% net(4,3) = 5;
% net(5,3) = 4;
% net(6,3) = 2;
% net(7,3) = 4;
% net(8,3) = 4;

%% model
d = zeros(size(pairs,1),1);
d(8) = 0.3;
p = 1;  %Node for counting
L = 15;


t = 2*net(:,3);

for mu = 0.1:0.01:1
    mu

    [fun, grad_bad] = phi(t/mu, d, L, mu, net, mc, pairs);
    fun
    gbad = grad_bad

    grad_simple = phi_grad(t/mu, d, L, mu, net, mc, pairs)

    grad_diff = abs(abs(grad_simple) - abs(grad_bad));
    max_diff = max(grad_diff)
end