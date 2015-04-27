function [X,Y] = node_edge_similarity_matrices_with_adjacency_matrix(A, B, TOL)
  AS = source_edge_matrix(A);
  AT = terminal_edge_matrix(A);
  BS = source_edge_matrix(B);
  BT = terminal_edge_matrix(B);
  [X,Y] = node_edge_similarity_matrix(AS, AT, BS, BT, TOL);
end
