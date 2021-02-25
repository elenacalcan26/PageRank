function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    %extrag informatiile din fisier intr-o matrice
  f = dlmread(nume);
  %aflu N
  N = f(1, 1);
  
  A = zeros(N); %matricea de adiacenta
  K = zeros(1, N);
  
  for i = 2:N + 1
    K(f(i, 1)) = f(i, 2); %aflu numarul de vecini
    for j = 3:N
      if f(i, j) != 0 && f(i, j) != f(i, 1)
        A(f(i, 1), f(i, j)) = 1; % construiesc matricea de adiacenta
      endif
      if f(i, j) == f(i, 1)
        K(f(i, 1))--; % scad numarul de vecini daca pagina are link catre aceeasi pagina
      endif
    endfor
  endfor
  K = diag(K);
  M = (inv(K) * A)'; % matricea de graduri
  I = eye(N); %matricea identitate
 %calculez R
 R = PR_Inv(I - d * M) * (1 - d) / N * ones(N, 1); 
endfunction