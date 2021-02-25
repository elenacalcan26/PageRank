function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Matricea A exte descompusa in QR folosind algoritmul Gram Schmidt
  % Q este matrice ortogonala, iar R este matrice superior triunghiulara
  % Inversa lui A este aflata rezolvand un sistem superior triunghiular
  [n m] = size(A);
  Q = zeros(n, m);
  R = zeros(n);
  % factorizarea matricei A
  for j = 1:m
    for i = 1:j-1
      R(i, j) = Q(:, i)' * A(:,j);
    endfor
    
    s = zeros(n, 1);
    for i = 1 : j - 1
      s = s + R(i, j) * Q(:, i);
    endfor
    aux = A(:, j) - s;
    R(j, j) = norm(aux, 2);
    Q(:, j) = aux / R(j, j);
  endfor
  B = inv(R) * Q';
endfunction