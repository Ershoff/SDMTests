clc; clear;

%% Initial parameters
%Net generation parameters
len = 2;
high = 2;
save_flag = 0;
load_flag = 0;
path_to_file = 'test2x2.mat';

%Method parameters



%% Generate manhattan net
%net - information about time on each arc. (origin, destination, time, flow)
[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);

pairs = making_pairs_func(len*high);

%% method part

L = 10;
e = 0.1;
mu = 1;
d = zeros(size(pairs,1),1);
d(3) = 0.01;
[t, F] = PGM(L, mu, d, e, net, mc, pairs)


%% Output part
%graph(mc, net, net(:,4), len, high)




