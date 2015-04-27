function [AS] = source_edge_matrix(A)
  number_of_edges = sum(A(:));
  AS = zeros(size(A,1), number_of_edges); %initialize the souce-edge matrix A_S
  current_edge = 1;
  for i=1:size(A,1)
      for j=1:size(A,2)
          if A(i,j) > 0
              for e=1:A(i,j)
                  AS(i,current_edge) = 1;
                  current_edge = current_edge + 1;
              end
          end
      end
  end  
end
