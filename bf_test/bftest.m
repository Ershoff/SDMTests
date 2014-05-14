%% Description: Testing Bellman-Ford Algorythm.
clc; clear;

%% Initial parameters
len = 3;
high = 3;
save_flag = 0;
load_flag = 1;
path_to_file = 'c:\Users\Egorius\Desktop\SDModel\SDModel_vers\SDModel_30apr\test\bf_test\intgraph3x3';

[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);

%  Square graph


net(1,3) = 1;
net(2,3) = 5;
net(3,3) = 1;
net(4,3) = 5;
net(5,3) = 4;
net(6,3) = 2;
net(7,3) = 4;
net(8,3) = 4;

p = 1;  %Node for counting

L = 3;
mu = 1;

t = net(:,3);
for l = 1:L
    if (mod(l,100)) == 0
        l
    end
    [a, ah] = BFa(p, t, l, mu, net, mc);
end
    ah(:,2)
    ah(:,3)
    
    
    %% RESULT
    % TEST DONE, ALFO IS USEFUL FOR KEEPING ALL STEPS
