function [A] = hypergraph_to_linegraph(n,E)
    m = numel(E);
    A = zeros(m,m);
  for i=1:m
      for j=1:m
          if or(i==j,isempty(intersect(E{i},E{j})))
              A(i,j) = 0;
          else
              A(i,j) = 1;
          end
      end
  end
end