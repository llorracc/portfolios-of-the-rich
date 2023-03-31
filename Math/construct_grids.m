(*This program reads in any necessary packages, sets up the routines that initialize the variables,and takes care of housekeeping preliminaries *)Print["Setting up the grids."];(* % Create the grid points for x, s, and h      % by constructing a list of NumOfSteps points spaced evenly in    % utility between 0 and Log[max+1] and converting to levels   % The NumOfSteps, the max's and min's are set in params.m *)lxGrid=Table[LoopOverxGrid,{LoopOverxGrid,Log[xmax+1]/NumOfxSteps,Log[xmax+1],Log[xmax+1]/NumOfxSteps}];lsGrid=Table[LoopOversGrid,{LoopOversGrid,Log[smax+1]/NumOfsSteps,Log[smax+1],Log[smax+1]/NumOfsSteps}];lsGrid=Table[LoopOversGrid,{LoopOversGrid,Log[Log[smax+1]+1]/NumOfsSteps,Log[Log[smax+1]+1],Log[Log[smax+1]+1]/NumOfsSteps}];(* Convert the evenly spaced log numbers to level form *)xGrid = Exp[lxGrid] - 1;sGrid = Exp[Exp[lsGrid]-1]-1;(*# In the version of the model with no liquidity constraints, the limit of the value    function and the expected value function as x->xmin is negative infinity.  Hence interpolation will not    work well for points between xmin and the first interpolation point.  Elsewhere the level of consumption     is nailed down to be zero when xt = xmin, but in order to figure out how much to save at the first interpolation    point it is necessary to be able to get a good calculation of the value of the function below the first interpolation    point.  We define here the location of that first interpolation point.*)FirstGridPointx = .01;FirstGridPoints = .01;xGrid = Prepend[xGrid,xmin+FirstGridPointx];	If[etZeroProb>0,xGrid = Prepend[xGrid,xmin+5*FirstGridPointx];(*xGrid = Prepend[xGrid,xmin+20*FirstGridPointx];xGrid = Prepend[xGrid,xmin+50*FirstGridPointx];xGrid = Prepend[xGrid,xmin+300*FirstGridPointx];*)];sGrid = Prepend[sGrid,smin+FirstGridPoints];sGrid = Prepend[sGrid,smin+10*FirstGridPoints];(*If[etZeroProb>0,(sGrid = Prepend[sGrid,smin+20*FirstGridPoints];]*)(*s0Grid = Prepend[sGrid,smin];*)xGrid = Sort[xGrid //N];sGrid = Sort[sGrid //N];xGridBaseline = xGrid;sGridBaseline = sGrid;(*s0Grid= Sort[s0Grid];*)x0Grid = Prepend[xGrid,xmin];(*sGrid = Prepend[sGrid,smin];*)RiskyShareGrid = Flatten[{-.01,Table[Share,{Share,0,1,1/(NumOfRSteps-1)}],1.01}] //N;KShareGrid     = Union[Flatten[{0.,KShareMin-.01,KShareMin+.001,Table[LoopOverKShares,{LoopOverKShares,KShareMin,1,1/(NumOfKSteps-1)}],1,1.01}] //N];If[SolveForRiskyShare == False,RiskyShareGrid = {0.}];NumOfPortfolioOptions = Length[RiskyShareGrid];RiskyShareMin = 0; RiskyShareMax = 1;Print["xGrid:          ",xGrid];Print["sGrid:          ",sGrid];Print["PermIncGrid:    ",PermIncGrid];Print["RiskyShareGrid: ",RiskyShareGrid];Print["KShareGrid:     ",KShareGrid];EmpStateGrid     = Table[i,{i,NumOfEmpStates}];PermIncStateGrid = Table[i,{i,NumOfPermIncVals}];QStateGrid       = Table[i,{i,NumOfQStates}];sAddGrid = {};