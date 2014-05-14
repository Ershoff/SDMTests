clc;
clear;
path_to_file = 'test2x2.mat';
len = 10;
high = 10;

[net, mc] = generate_manhatan(len, high, 0, 0, path_to_file);
graph(mc,net, net(:,4), len, high)