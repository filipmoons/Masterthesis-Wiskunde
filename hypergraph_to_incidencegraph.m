function [A] = hypergraph_to_incidencegraph(n,E)
 m = numel(E);
 A = zeros(n+m,n+m);
    for idx = 1:numel(E)
        edge = cell2mat(E(idx));
        for idx_2 = 1:numel(edge)
            A(edge(idx_2), n + idx) = 1;
            A(n + idx,edge(idx_2)) = 1;

        end       
     
    end
end
