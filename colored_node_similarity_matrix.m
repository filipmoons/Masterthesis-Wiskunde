function [Z] = colored_node_similarity_matrix(colored_verticesA, A, colored_verticesB, B, TOL)
 partitionedA = colored_node_adjacency_matrix_partitioning(colored_verticesA, A);
 partitionedB = colored_node_adjacency_matrix_partitioning(colored_verticesB, B);
 number_of_colors = size(colored_verticesA, 2);
 k = 1;
 for i=1:number_of_colors
     Z{i} = ones(colored_verticesB(i), colored_verticesA(i));
 end
 Z_previouseven = Z;
 while true;
     norm = 0;
     for i=1:number_of_colors
         Z_temp = 0;
         for l = 1:number_of_colors
             Z_temp = Z_temp + partitionedB{i,l}*Z{l}*transpose(partitionedA{i,l})+ transpose(partitionedB{l,i})*Z{l}*partitionedA{l,i};
         end
         Z{i} = Z_temp;
         norm = norm + trace(transpose(Z{i})*(Z{i}));
     end

     norm = norm(Z, 'fro');
     
     for i=1:number_of_colors
         Z{i} = Z{i}/norm;
     end
     if mod(k,2) == 0
        have_to_stop = 1;
        for i = 1:number_of_colors
            difference_i = abs(Z{i}-Z_previouseven{i});
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
end
