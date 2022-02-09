clear;
close;

N = 2^16;
time = zeros(1,N);
A = ones(3,N);
A(:,1) = 0;
A(2,:) = 1:N;
A(3,:) = 0;

tic
for i=2:(sqrt(N))
   if A(1,i) == 1
      for j=i^2:i:N
         A(1,j)= 0; 
      end
   end
end

for i = 2:N
   A(3,i) = sum(A(1,2:i)==1); 
   time(i) = toc;
end

subplot(211)
plot(A(2,:),A(3,:), 'r');
xlabel("N");
ylabel("Liczby pierwsze");

subplot(212)
plot(A(2,:),time, 'r');
xlabel("N");
ylabel("Czas [s]");
