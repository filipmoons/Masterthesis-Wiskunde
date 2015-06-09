function [A] = hypergraph_to_extended2section(n,E)
 A = zeros(n,n);
  for k = 1:numel(E)
      if size(E{k},2) == 1
          A(cell2mat(E(k)), cell2mat(E(k))) = A(cell2mat(E(k)), cell2mat(E(k))) + 1;
      else
          p = perms(E{k});
          already_done = []; 
          for i = 1:size(p,1)
              if isempty(intersect([p(i,1)], already_done)) 
                  for j = 2:size(p,2)
                      A(p(i,1),p(i,j)) = A(p(i,1),p(i,j)) + 1;
                  end
                  already_done = [already_done, p(i,1)];
              end
          end
            disp(A);
      end
  end
  return;
end
