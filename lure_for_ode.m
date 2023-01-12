function dydt = lure_for_ode(t, y, a)

dydt = zeros(3, 1);

dydt(1) = y(2);
dydt(2) = y(3);
dydt(3) = -y(3)-(a*y(2))-y(1)+(y(1)^2);

