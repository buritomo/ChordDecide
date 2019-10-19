% ????????
clear all
close all

makeData;

affectiveLift;

loadTheory;

dif_Lift = (Lift).' - Liftmap;
sum_dif = abs(sum(dif_Lift(2:N, 1)));

while sum_dif > 0.01
  clear all
  makeData;
  DataList = (load('OutPut.csv'));
  c = DataList(:, 2);
  affectiveLift;
  loadTheory;
  dif_Lift = (Lift).' - Liftmap;
  sum_dif = abs(sum(dif_Lift(2:N, 1)));
endwhile
