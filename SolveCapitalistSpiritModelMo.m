(***********************************************************************This file was generated automatically by the Mathematica front end.It contains Initialization cells from a Notebook file, which typicallywill have the same name as this file except ending in ".nb" instead of".m".This file is intended to be loaded into the Mathematica kernel usingthe package loading commands Get or Needs.  Doing so is equivalent tousing the Evaluate Initialization Cells menu command in the front end.DO NOT EDIT THIS FILE.  This entire file is regenerated automatically each time the parent Notebook file is saved in the Mathematica front end.Any changes you make to this file will be overwritten.***********************************************************************)u[c_] := ((c-gamma)^(1-rho))/(1-rho);uprime[c_] := (c-gamma)^-rho;uprimeprime[c_] := -rho (c-gamma)^(-rho-1);v[s_] := ((s)^(1-alpha))/(1-alpha);vprime[s_] := (s)^-alpha;vprimeprime[s_] := -alpha (s)^(-alpha-1);utility = ((ct-gamma)^(1-rho))/(1-rho) + ((((wt-ct)(1-tau)))^(1-alpha))/(1-alpha)gamma = 1;rho=6;alpha=3;ConsEqn = Solve[{wt + gamma - ct - ct^2==0},ct];ConsEqnUpper = ConsEqn[[2,1,2]];Cstar = Function[wt,Evaluate[ConsEqnUpper]];Clear[ConsOpt];ConsOpt[wt_] := Min[Cstar[wt],wt];ConsOptPrime[wt_] := (ConsOpt[wt+.001]-ConsOpt[wt-.001])/.002;ConsOptPrimePrime[wt_] := (ConsOptPrime[wt+.001]-ConsOptPrime[wt-.001])/.002;Clear[SaveOpt];SaveOpt[x_] := (x - ConsOpt[x])/x;ValueFunc[x_] := u[ConsOpt[x]] + v[x-ConsOpt[x]];ValueFuncPrime[x_] := uprime[ConsOpt[x]]ConsOptPrime[x] +   vprime[x-ConsOpt[x]](1-ConsOptPrime[x]);ValueFuncPrimePrime[x_] := (ValueFuncPrime[x+.001]-ValueFuncPrime[x-.001])/.002;  