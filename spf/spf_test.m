clc
clear
%%short_path_find test's

len = 5;
high = 5;

save_flag = 0;
load_flag = 0;
path_to_file = 'test2x2.mat';


[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);
[net_pairs, arc_last_num] = enumerating_function(mc);

%% testing with different time vector.

delta = 0;

t = ones(size(net,1),1);
[sp, t_m] = short_path_find(mc, net, t, 6, 1);
result = horzcat(net_pairs,t,sp)

path431 = t(8) + t(5);
path421 = t(7) + t(3);

%%testing plot

 
 coor = zeros(len*high,2);
 x = 0;
 y = 0;
 for i = 1:size(coor)
    if(mod(i,len) == 1)
        y = y+1;
        x = 1;
    end
    
     coor(i, 1) = x;
     coor(i, 2) = y;
     x = x +1;
        
 end
 coor
 figure 
 gplot(mc, coor,'r');
 gplot(mc, coor);
 net(:,1:2)


%check for build node_prev_in_path show good resultat, but only for a small
%matrix, for big one i've not done check yet.
