function [Z] = colored_node_adjacency_matrix_partitioning(colored_vertices,A)
 number_of_colors = size(colored_vertices,2);

 for i = 1:number_of_colors
     for j = 1:number_of_colors
         c_i = colored_vertices(i);
         c_j = colored_vertices(j);
         B = zeros(c_i,c_j);
         start_vertex_i = 0;
         start_vertex_j = 0;
         for k = 1:i-1
             start_vertex_i = start_vertex_i + colored_vertices(k);
         end
         for k = 1:j-1
             start_vertex_j = start_vertex_j + colored_vertices(k);
         end
         for r = 1:c_i
             for k = 1:c_j
                 B(r,k) = A(start_vertex_i + r, start_vertex_j + k);
             end
         end
         Z{i,j} = B;
     end
 end
 return; 
end
