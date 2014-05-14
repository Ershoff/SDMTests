%%
%Description:
%Function shows all path with equal time using short path matrix
%connectivity.
%Input:
%spMC - Matrix Connectivity which show short path
%path_mat(i,j) - matrix with big size, big enough to keep all paths. 
%i - number of path, j - node in path
%path_num - number of path; for maintain recursion, counting path.
%Output
%path_mat - resulting path
%%

function [path_mat] = path_recovery1 (spMC, path_mat, path_num, node_o)
%In first step it has no sence, it is important for futher iteration in
%recursion.
%%
    p = length(nonzero_pos(path_mat(path_num, :))); %%length of path with number path_num
    node_no_iter = path_mat(path_num, p); %% during node of the path.
    br = 1;
    node = 1;
    
    if(node_no_iter == 1)
            br = 0;
    end

%%
    while (br == 1)
        a = nonzero_pos(spMC(:,node_no_iter)); % place where path becomes dual.
        p = length(nonzero_pos(path_mat(path_num, :)));
%%     
% simple part, when just one path follows, means what dim(a) = 1;

        if(length(a) == 1 && path_mat(path_num, p) ~= node_o)
            path_mat(path_num, p+1) = a;
            node_no_iter = a;
        end
%%        
%little bit more diffucuilt, when several path follow

        if(length(a) > 1)
            path_mat(path_num,p+1) = a(1);
            path_mat = path_recovery(spMC, path_mat, path_num);
            path_mat_recur = path_mat;
            node_no_iter = a(1);
            for j = 2 : length(a)
                old_path_num = path_num;
                path_num = path_num + j - 1;
                path_mat_recur(path_num, 1:p) = path_mat(old_path_num, 1:p);
                path_mat_recur(path_num, p+1) =  a(j);
                path_mat = path_recovery(spMC, path_mat_recur, path_num);
                p_recur = length(nonzero_pos(path_mat_recur(path_num, :)));
                node = max([path_mat(old_path_num,p + 1), path_mat(path_num, p_recur)]);
            end
            
        end
        
%%       
        if(path_mat(path_num, p) == node_o)
            br = 0;
        end
        
        if(node == 1 && node_no_iter == 1)
            br = 0;
        end
        
        
    end
end

%Я сделал, чтобы считалось от дальнего до начального, но узлы могут быть
%любые. Проверим так, потом допилим.
    
    
