function [A] = hypergraph_to_incidencematrix(n,E)
 m = numel(E);
 A = zeros(n,m);
    for idx = 1:numel(E)
        edge = cell2mat(E(idx));
        for idx_2 = 1:numel(edge)
            A(edge(idx_2), idx) =1
        end       
     
    end
end
