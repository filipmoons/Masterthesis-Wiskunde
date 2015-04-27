function [Z] = similarity_matrix(A,B, TOL)
  Z_0 = ones(size(B,1),size(A,1));
  mu(1:size(B,1),1:size(A,1)) = TOL;
  Z = Z_0;
  Z_previouseven = Z_0;
  k=1;
  while true;
      Y = norm((B*Z*transpose(A)+transpose(B)*Z*A),'fro');
      X = B*Z*transpose(A)+transpose(B)*Z*A;
      Z = X/Y;
      if mod(k,2) == 0
        difference = abs(Z-Z_previouseven);
        disp(difference);
        Z_previouseven = Z;
        if (difference < mu)
            break;
        end
      end
      k = k + 1;
  end
  return;
end
