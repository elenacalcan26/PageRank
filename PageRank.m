function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  % deschid fisierul
  fin = fopen(nume, 'r');
  N = fscanf(fin, "%d", 1)
  % prin citirea a tot fiserului ajungem la cele 2 valori dorite
  for i = 2:N + 1
    node = fscanf(fin, "%d", 1);
    neigh = fscanf(fin, "%d", 1);
    c = fscanf(fin, "%d", neigh);
  endfor
  % citesc val1 si val2
  val1 = fscanf(fin, "%f", 1);
  val2 = fscanf(fin, "%f", 1);
  %inchid fisierul
  fclose(fin);
  %creez fisierul de iesire
  output_file = strcat(nume, ".out");
  fout = fopen(output_file, 'w');
  fprintf(fout, "%d\n\n", N);
  %aflu rezultatul intors de Iterative si il scriu in fisier
  R1 = Iterative(nume, d, eps);
  fprintf(fout, "%0.6f\n", R1);
  fprintf(fout, "\n");
  %aflu rezultatul intors de Algebraic si il scriu in fisier
  R2 = Algebraic(nume, d, eps);
  fprintf(fout, "%0.6f\n", R2);
  fprintf(fout, "\n");
  %sortez descrescator vectorul R2
  [PR1, idx] = sort(R2, 'descend');
  % afisare clasament
  for i = 1:N
    y = Apartenenta(PR1(i), val1, val2); %calculez apartenenta
    fprintf(fout, "%d %d %0.6f\n", i, idx(i), y);
  endfor
  fclose(fout);  
endfunction