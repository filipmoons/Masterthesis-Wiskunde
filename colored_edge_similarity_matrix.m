function [S] = colored_edge_similarity_matrix(colored_edgesA, AS,AT, colored_edgesB, BS,BT, TOL)
 partitionedAS = colored_edge_matrix_partitioning(colored_edgesA,AS);
 partitionedAT = colored_edge_matrix_partitioning(colored_edgesA,AT);
 partitionedBS = colored_edge_matrix_partitioning(colored_edgesB,BS);
 partitionedBT = colored_edge_matrix_partitioning(colored_edgesB,BT);
 number_of_colors = size(colored_edgesA, 2);
 k = 1;
 for i=1:number_of_colors
     Z{i,i} = ones(colored_edgesB(i), colored_edgesA(i));
 end
 Z_previouseven = Z;
 while true;
     norm2 = 0;
     for i=1:number_of_colors
         Z_temp = 0;
         for l = 1:number_of_colors
             Z_temp = Z_temp + partitionedBS{l}*Z{l,l}*transpose(partitionedAS{l})
                       + partitionedBT{l}*Z{l,l}*transpose(partitionedAT{l,i});
         end
         Z{i,i} = Z_temp;
         norm2 = norm2 + trace(transpose(Z{i,i})*(Z{i,i}));
         Z{i,i} = Z{i,i}/norm(Z_temp,'fro');
     end

    
     
     if mod(k,2) == 0
        have_to_stop = 1;
        for i = 1:number_of_colors
            difference_i = abs(Z{i,i}-Z_previouseven{i,i});
            if not(all(difference_i) < TOL)
                have_to_stop = 0;
            end
        end
        if(have_to_stop == 1)
            break;
        else
            Z_previouseven = Z;
        end
      end
      k = k + 1;
 end
  disp(Z);
  for i = 1:number_of_colors
  for j = 1:number_of_colors
      if not(i == j)
         Z{i,j} = zeros(size(Z{i,i},1),size(Z{j,j},2));      
      end
  end
  end

 S = cell2mat(Z);
 return;
end
