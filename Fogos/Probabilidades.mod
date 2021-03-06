 int a = ...;
 int n = a*a;
 int c[1..n][1..n] = ...;
 
  
 int b = ...;
 int delta = ...;
 float p_aux[1..a][1..a] = ...;
 int tmax = ...;
 
 float p[1..n];
 execute {
	 for(var i = 1, k = 1; i<=a; i++) {
	 	for(var j = 1; j<=a; j++, k++){
	 		p[k] = p_aux[i][j];	
	 	}	
	 }	  
 }
 
 
 dvar boolean x[1..n];
 dvar int t[1..n][1..n];
 dvar boolean y[1..n][1..n];
 
 minimize sum(s in 1..n, i in 1..n) p[s]*y[s][i];
 
 subject to{
 	forall(s in 1..n) t[s][s] == 0;
 	forall(s in 1..n, i in 1..n, j in 1..n) t[s][j] <= t[s][i] + c[i][j] + delta*x[i];
 	forall(s in 1..n, i in 1..n) y[s][i] >= (tmax - t[s][i])/tmax;
 	sum(i in 1..n) x[i] <= b;
 }