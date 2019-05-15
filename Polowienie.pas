unit Polowienie;

interface

function binarysearch (var a,b   : Extended;
                       mit       : Integer;
                       tol       : Extended;
                       var fatx  : Extended;
                       var it,st : Integer) : Extended;
{---------------------------------------------------------------------------
Usage:
	The function binarysearch finds an approximate value of the root of the
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
	binarysearch(a,b,f,mit,eps,fatx,it,st) - approximate value of the root,
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
	f : DLLFunction
	a,b,tol,fatx : Extended
	mit,it,st : Integer

Unlocal identifier:
	DLLFunction = function(x : Extended) : Extended

Code: <below>
---------------------------------------------------------------------------}

implementation

type
  DLLFunction = function(x : Extended) : Extended; //typ wczytywanych przez dll funkcji

var
f : DLLFunction; //oznacza wczytan¹ funkcje

//METODA PO£OWIENIA
function binarysearch (var a,b   : Extended;
                       mit       : Integer;
                       tol       : Extended;
                       var fatx  : Extended;
                       var it,st : Integer) : Extended;
var fa,fb,x : Extended;
begin
    if mit<1
      then st:=1
      else begin
             fa:=f(a);
             fb:=f(b);
             if fa*fb>=0
               then st:=2
               else begin
                      st:=3;
                      it:=0;
                      repeat
                        it:=it+1;
                        x:=a+(b-a)/2;
                        fa:=f(x);
                        if (fa=0) or ((b-a)/2<tol)
                          then st:=0
                          else begin
                                 fa:=f(a);
                                 fb:=f(x);
                                 if fa*fb>0
                                   then a:=x
                                   else b:=x
                               end
                      until (it=mit) or (st<>3)
                    end
           end;
    if (st=0) or (st=3)
      then begin
             binarysearch:=x;
             fatx:=f(x)
           end
end;

end.
