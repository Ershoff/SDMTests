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
len = 100;
high = 100;
save_flag = 0;
load_flag = 0;
path_to_file = 'c:\Users\Egorius\Desktop\SDModel\SDModel_vers\SDModel_30apr\test\bf_test\intgraph3x3';

tic
[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);
toc

node_o = 5;
node_d = 6;

tic
arc = find_arc_by_nodes_fast(net, node_o, node_d)
toc
%  Square graph

