%　揚力をダウンロード，CLからchordを計算
LiftElpl = (load('LiftElpl.txt')).' / 15 * 9.8;
sz = size(LiftElpl);
xForLift = (linspace(0, b/2, sz(1,1))).';

j=1;
for i = N / 2 + 2 : N + 1
    while x(i, 1) > xForLift(j, 1)
        j = j + 1;
    end
    Liftmap(i, 1) = LiftElpl(j-1, 1) * (xForLift(j, 1) - x(i, 1)) + LiftElpl(j, 1) * (x(i, 1) - xForLift(j-1, 1));
    Liftmap(i ,1) = Liftmap(i, 1) / (xForLift(j, 1) - xForLift(j-1, 1));
    j = 1;
end

Liftmap(N / 2 + 1, 1) = LiftElpl(1, 1);

for i = 1: N / 2
    Liftmap(N / 2 + 1 - i, 1) = Liftmap(N / 2 + 1 + i, 1);
end

for i = 1: N+1
  c(i, 1) = Liftmap(i, 1) * 2 / row / speed / speed / Cl(i, 1) * 1000*1000;  
endfor

c(1,1) = c(N+1,1);

figure(4)
plot(x,c);
title("chord");

outPutData = zeros(N+1, 4);
outPutData(:, 1) = x;
outPutData(:, 2) = c;
outPutData(:, 3) = (delta_alpha).';
outPutData(:, 4) = (Lift).';
csvwrite('OutPut.csv', outPutData);