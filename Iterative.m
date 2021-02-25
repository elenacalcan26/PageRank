function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  
  %extrag informatiile din fisier intr-o matrice
  f = dlmread(nume);
  %aflu N
  N = f(1, 1);
  
  A = zeros(N); %matricea de adiacenta
  K = zeros(1, N); %vectorul de vecini
  
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
  R = ones(N, 1) / N;
  while (1)
    R_prev = R;
    R = d * M * R + (1 - d) / N * ones(N, 1);
    % verific convergenta.
    if norm(R - R_prev ) < eps
      R = R_prev;
      break;
    endif
  endwhile
endfunction