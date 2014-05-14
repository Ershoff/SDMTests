% Dijkstra's algorithm 
% Input: 
% 1. connection matrix
% 2. Net_data - information about time on each arc. (origin, destination, time, flow)
% 3. node_d - number of destination node
% 4. node_o - number of origin node
% Output: 
% 1. Number of each arc in the shortest path in right order
% 2. Time sum

%%
function [Vect, Sum] = short_path_find(MC, Net_data, time_vect, node_o, node_d)
% origin = node_o
% destination = node_d
%constants
path_time_vect_num = 4;
path_len_max = 1000;
net_time_pos = 4;
%%
node_number = length(MC);

%Vextor to fix distance, from origin, to destination
distance_vector = path_len_max*ones(node_number, 1);
distance_vector(node_o) = 0;

absence_vector = ones(node_number, 1);




c1 = 0; %counter 

buff_node_vect = zeros(0,1);
%%
%matric connectivity for equal paths
node_prev_in_path = zeros(node_number, node_number);
%%
node_pointer = node_o;
nodes_neigh = zeros(0,1);

while(sum(absence_vector) ~= 0) 
%%  
% searching neighbourhoods    
    for i = 1:node_number
        if((MC(node_pointer, i) == 1) && (node_pointer ~= i) && (absence_vector(i) == 1))
            c1 = c1 + 1;
            nodes_neigh(c1) = i;    %need to preallocate memmory, but don't know how, cause can't predict the size of vector
        end  
    end
    c1 = 0;
%sort heighborhoods by travel time: the less time, the less number
    nodes_neigh_time = zeros(length(nodes_neigh), 1);
    for i = 1:length(nodes_neigh)
        nodes_neigh_time(i) = ...
            time_vect(find_arc_by_nodes(Net_data, node_pointer, nodes_neigh(i)));            
    end
%%    
%sorting edges by time

    [nodes_neigh_time,ix] = sort(nodes_neigh_time');
    
%reordering nodes by time   
    nodes_neigh = nodes_neigh(ix);
    nodes_neigh = nodes_neigh';
    
    
%memorize nodes in right order
    buff_node_vect = vertcat(buff_node_vect,nodes_neigh)  ;
%%   
% visiting neghborhoods in sorted by time order

    
    for i = 1:length(nodes_neigh)
       edge_num = find_arc_by_nodes(Net_data, node_pointer, nodes_neigh(i));
       new_distance = distance_vector(node_pointer) + time_vect(edge_num);
       cond1 = (distance_vector(nodes_neigh(i)) >= new_distance);       
       cond2 = (distance_vector(nodes_neigh(i)) > new_distance);
       cond3 = (distance_vector(nodes_neigh(i)) == new_distance);
       
       if(cond1)
           if(cond2)
               distance_vector(nodes_neigh(i)) = new_distance;
               node_prev_in_path(:, nodes_neigh(i)) = 0*node_prev_in_path(node_pointer, :);
               node_prev_in_path(node_pointer, nodes_neigh(i)) = 1;
           end
           if(cond3)
               node_prev_in_path(node_pointer, nodes_neigh(i)) = 1;
           end
       end
    end   
    

    
    
    absence_vector;  
%%
% Mark visit in node, change node_pointer to the next one.
    absence_vector(node_pointer) = 0;
    node_pointer = buff_node_vect(1);
    
% changing buffer
    buff_node_vect = buff_node_vect(2:length(buff_node_vect));
% cleaning
    nodes_neigh = zeros(0,1);
    nodes_neigh_time = zeros(0,1);
    

end
    
%%
%Forming final path 
    
    path_mass = zeros(node_number, node_number);
    path_mass(1, 1) = node_d;
    node_prev_in_path;
    path_mass = path_recovery1(node_prev_in_path, path_mass, 1, node_o);
    path_mass = path_to_incidense(path_mass,Net_data);
    

%Output
    Sum = distance_vector(node_d);
    Vect = path_mass;

end



%todo: 
% 1. for initialization distance vector find spetial symbol for infinity
% 2. Important: length of path is equal to quant of nodes and count of
% nodes equals to qount of nodes.



