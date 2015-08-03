function [Z] = colored_edge_matrix_partitioning(colored_edges,A)
 number_of_colors = size(colored_edges,2);
 number_of_nodes = size(A,1);
 for i = 1:number_of_colors
     c_i = colored_edges(i);
     B = zeros(number_of_nodes,c_i);
     start_vertex_i = 0;
     for k = 1:i-1
         start_vertex_i = start_vertex_i + colored_edges(k);
     end
    
     for r = 1:number_of_nodes
         for k = 1:c_i
             B(r,k) = A(r, start_vertex_i + k);
         end
     end
     Z{i} = B;
 end
 return;
end
