function [A] = hypergraph_to_2section(n,E)
 A = zeros(n,n);
  for i=1:n
      for j=1:n
          for idx = 1:numel(E)
              if i==j
                  A(i,j) = 0;
                  break;
              elseif not(or(isempty(intersect(E{idx}, [i])),isempty(intersect(E{idx}, [j]))))
                  A(i,j) = 1
                  break;
              else
                  A(i,j) = 0;
              end
          end
      end
  end
end
