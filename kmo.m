function [kmo] = kmo(X)

X = corrcoef(X);
iX = inv(X);
S2 = diag(diag((iX.^-1)));
AIS = S2*iX*S2; %anti-image covariance matrix
IS = X+AIS-2*S2; %image covariance matrix
Dai = diag(diag(sqrt(AIS)));
IR = inv(Dai)*IS*inv(Dai); %image correlation matrix
AIR = inv(Dai)*AIS*inv(Dai); %anti-image correlation matrix
a = sum((AIR - diag(diag(AIR))).^2);
AA = sum(a);
b = sum((X - eye(size(X))).^2);
BB = sum(b);
MSA = b./(b+a); %measures of sampling adequacy
AIR = AIR-eye(size(AIR))+diag(MSA);
%Examine the anti-image of the correlation matrix. That is the negative of the partial correlations,
%partialling out all other variables.
N = BB;
D = AA+BB;
kmo = N/D;

return,
