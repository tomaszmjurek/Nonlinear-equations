unit PolowienieInterval;

interface

uses
IntervalArithmetic32and64;

type DLLFunctionI = function(x : interval) : interval; //typ wczytywanych przez dll funkcji

function binarysearchI (fI : DLLFunctionI;
                       var a,b, fatx  : Interval;
                       mit       : Integer;
                       tol  : Interval;
                       var it,st : Integer) : Interval;

implementation



//METODA PO£OWIENIA
function binarysearchI (fI : DLLFunctionI;
                       var a,b, fatx   : Interval;
                       mit       : Integer;
                       tol  : Interval;
                       var it,st : Integer) : Interval;
var fa,fb, x : Interval;
{-------------------------DOCUMENTATION-----------------------------------------
Usage:
	The function binarysearchI finds an approximate value of the root of the
	equation f(x)=0 lying in the interval [a,b] by the bisection algorithm.

Algorithm:
		1. Decide initial values for x1 and x2 and stopping criterion, E.
		2. Compute f1 = f(x1) and f2 = f(x2).
		3. If f1 * f2>0, x1 and x2 do not bracket any root and go to step 7;
		Otherwise continue.
		4. Compute x0 = (x1+x2)/2 and compute f0 = f(x0)
		5. If f1*f0 < 0 then
		set x2 = x0
		else
		set x1 = x0
		set f1 = f0
		6. If absolute value of (x2 – x1)/x2 is less than error E, then
		root = (x1 + x2)/2
		write the value of root
		go to step 7
		else
		go to step 4
		7. Stop.

Function call:
	binarysearch(f,a,b,mit,eps,fatx,it,st)

Data:
	f   - a function which for the given value x calculates f(x),
	a,b - the ends of the interval which contains the root (changed on exit),
	mit - maximum number of iterations,
	tol - tolerance for the solution.

Result:
 binarysearchI(fI,a, b, fatx, mit, tol, it, st) - approximate values of the root,
 fatx                                   - the value of the function
                                             f(x) at the approximate root,
 it                                     - number of iterations.

Other parameters:
	 st - a variable which within the function binarysearch is assigned the
         value of:
           1, if mit<1,
           2, f(a)*f(b)>=0,
           3, if the given tolerance is not achieved in mit iteration
              steps,
           0, otherwise.

Types of parameters:
	fI : DLLFunctionI
	a,b,tol,fatx : Interval
	mit,it,st : Integer

Unlocal identifier:
	DLLFunctionI = function(x : Interval) : Interval

Examples for f(x) = x*x-2:

1) Single interval, Correct
  a = 1, b = 2
  binarysearch() = 1.41421356237309509E+0000  1.41421356237309509E+0000
  fatx =   1.16226472890446075E-0016  1.16226472890446075E-0016
  st = 0
  it = 54

2) Double interval, Correct
  binarysearch() =  1.32750000000000000E+0000   1.42250000000000000E+0000
  fatx =   -2.37743750000000001E-0001   2.35062500000000018E-0002
  st = 0
  it = 3

{---------------------------------------------------------------------------}
begin
    if mit<1
      then st:=1
      else begin
             fa:=fI(a);
             fb:=fI(b);
             if greaterOrEvenZero(fa*fb)
               then st:=2
               else begin
                      st:=3;
                      it:=0;
                      repeat
                        it:=it+1;
                        x:=a+(b-a)/2;
                        fa:=fI(x);
                        if (containZero(fa)) or ((b-a)/2<tol)
                          then st:=0
                          else begin
                                 fa:=fI(a);
                                 fb:=fI(x);
                                 if greaterThanZero(fa*fb)
                                   then a:=x
                                   else b:=x
                               end
                      until (it=mit) or (st<>3)
                    end
           end;
    if (st=0) or (st=3)
      then begin
             binarysearchI:=x;
             fatx:=fI(x)
           end
end;

end.
