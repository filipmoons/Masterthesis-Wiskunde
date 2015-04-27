function [X, Y] = node_edge_similarity_matrices(AS, AT, BS, BT, TOL)
    X = ones(size(BS,1),size(AS,1));
    Y = ones(size(BS,2),size(AS,2));
    mu_X(1:size(BS,1),1:size(AS,1)) = TOL;
    mu_Y(1:size(BS,2),1:size(AS,2)) = TOL;
    X_previouseven = X;
    Y_previouseven = Y;
    k=1;
  while true;
      Y = (transpose(BS)*X*AS+transpose(BT)*X*AT)
      		/norm(transpose(BS)*X*AS+transpose(BT)*X*AT, 'fro');
      X = (BS*Y*transpose(AS)+BT*Y*transpose(AT))
      		/norm(BS*Y*transpose(AS)+BT*Y*transpose(AT), 'fro');
      
      difference_X = abs(X-X_previous);
      difference_Y = abs(Y-Y_previous);
      X_previous = X;
      Y_previous = Y;
        if difference_X < mu_X
            if difference_Y < mu_Y
                break;
            end
        end
  end
  return;
end