# PageRank

##### Calcan Elena-Claudia&nbsp; 
311CA

1. Algoritmul Iterative
------------------------------------------------------------------------------

Functia reprezinta o implementare a algoritmului Iterative. Functia primeste
ca argumente: numele fisierului din care se citeste graful, coeficientul d si
eroarea care apare in calculul vectorului PR. Functia intoarce vectorul PR.

Informatiile din fisierul dat ca argument le-am extras intr-o matrice f, cu
ajutorul functiei dlmread(). Am aflat numarul de resurse web, N, el aflandu-se
pe prima pozitie a fisierului, adica pe pozitia f(1, 1) a matricei care contine
informatiile din fisier. Am intializat matricea de adiacenta, A, si vectorul de
vecini, K, cu 0. Cu 2 for-uri parcurgem informatiile din fisier si construim
matricea de de vecini si matricea de adiacenta.

Dupa ce am terminat de construit matricea de adiacenta si vectorul de vecini,
il aduc pe K la o forma diagonala si calculez matricea de graduri, M, dupa
formula:
			M = (inv(K) * A)'

Calculul vectorului PR este facut pana cand norma vectorului PR de la pasul
curent si vectorul PR de la pasul anterior este mai mica decat eps.
Vectorul PR s-a calculat dupa formula:
			R = d * M * + (1 - d) / N * ones(N, 1)



2. Algoritmul Algebraic
------------------------------------------------------------------------------

Functia reprezinta o implementare a algoritmului Algebraic. Functia primeste
ca argumente: numele fisierului din care se citeste graful, coeficientul d si
eroarea care apare in calculul vectorului PR. Functia intoarce vectorul PR.

Implementarea functiei este asemanatoare ca implementarea functiei Iterative.
Singura diferenta dintre cele doua functii fiind calcularea vectorului PR.

Vectorul PR este calculat dupa formula:
			R = PR_Inv(I - d * M) * (1 - d) / N * ones(N, 1), unde functia 
PR_Inv() este o functie care calculeaza inversa unei matrici, folosind metoda
Gram-Schmidt. Implementarea algoritmului Gram-Schmidt este cea de la 
laborator.



3. Gradul de apartenenta
------------------------------------------------------------------------------

Functia PageRank primeste ca argumente numele unui fisier si parametrii d si
eps. Functia afiseaza intr-un nou fisier: numarul de pagini web analizate, N,
vectorul PR calculat cu algoritmul Iterative, vectorul PR calculat cu
algoritmul Algebraic si un clasament al celor mai importante pagini, pe prima 
coloana aflandu-se locul obtinut, pe a doua coloana numarul paginii care a 
obtinut acest loc, iar pe ultima coloana se afla gradul de apartenenta a 
acestei pagini la multimea paginilor importante.

La inceputul functiei deschi fisierul primit ca parametru si citesc numarul de 
resurse web. Pentru a afla cele 2 valori val1 si val2, am parcurs fisierul cu
un for si citind in gol. 

Dupa ce am aflat valorile necesare, am inchis fiserul pe care l-am primit ca
parametru si am creat fisierul de iesire. Il deschid, afisez N, afisez vectorul
PR aflat cu algoritmul Iterative, afisez vectorul calculat cu algoritmul
Algebraic. Sortez descrescator vectorul PR1 aflat cu algoritmul Algebraic, 
folosinf functia sort() si sortez si un vector de indecsi, idx, care prezinta
aranjarea elementelor din vector.
Afisarea clasamentului este facut cu un for. Apartenenta este calculata intr-o
functie cu acelasi nume. Functia primeste ca parametru un numar x ce semnifica
un element din vectorul PR sortat, val1 si val2 si care calculeaza valoarea
functiei membru in punctul x.
Dupa ce terminam tot de afisat in fisier, il inchidem.
