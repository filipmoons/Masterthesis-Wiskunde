function [y, mu] = power_metho(A, y, TOL)
k = 1;
mu = 0;
while true
    z = A*y;
    mu_previous = mu;
    mu = norm(z,2);
    y_previous = y;
    y = z/mu;
    k = k + 1;
    if and(k>2,abs(mu - mu_previous)<TOL)
        break;
    end
end
if (y(1) == -y_previous(1))
    mu = -mu;
end
return;
end