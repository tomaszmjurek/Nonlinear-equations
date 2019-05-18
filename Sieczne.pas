unit Sieczne;

interface

type
  DLLFunction = function(x : Extended) : Extended; //typ wczytywanych przez dll funkcji


function linearintpol (f : DLLFunction;
                       var a,b  : Extended;
                       var fatx : Extended) : Extended;

{---------------------------------------------------------------------------
Usage:
	The function linearintpol finds an approximate value of the root of the
  equation f(x)=0 lying in the interval [a,b] or near this interval by
  linear interpolation.

Algorithm:
  1. Get values of x0, x1 and e
    *Here x0 and x1 are the two initial guesses
    e is the stopping criteria, absolute error or the desired degree of accuracy*
  2. Compute f(x0) and f(x1)
  3. Compute x2 = [x0*f(x1) – x1*f(x0)] / [f(x1) – f(x0)]
  4. Test for accuracy of x2
    If [ (x2 – x1)/x2 ] > e, *Here [ ] is used as modulus sign*
    then assign x0 = x1 and x1 = x2
    goto step 4
    Else,
    goto step 6
  5. Display the required root as x2.

Function call:
	linearintpol(f,a,b,fatx)

Data:
  a,b - the ends of the interval which contains the root (changed on exit),
  f   - a Turbo Pascal function which for the given value x calculates f(x).

Results:
    linearintpol(a,b,f,fatx) - approximate value of the root,
    fatx                     - the value of the function f(x) at the
                               approximate root.

Types of parameters:
	f : DLLFunction
	a,b,fatx : Extended

Unlocal identifier:
	DLLFunction = function(x : Extended) : Extended

Code: <below>
---------------------------------------------------------------------------}

implementation


//METODA SIECZNYCH
function linearintpol (f : DLLFunction;
                       var a,b  : Extended;
                       var fatx : Extended) : Extended;
var fa,fb,h,x : Extended;
    cond      : Boolean;
begin
  cond:=true;
  h:=0.179372*(b-a);
  a:=a+h;
  b:=b-h;
  fa:=f(a);
  fb:=f(b);
  if abs(fa)<abs(fb)
    then begin
           h:=a;
           a:=b;
           b:=h;
           h:=fa;
           fa:=fb;
           fb:=h
         end;
  repeat
    x:=fa-fb;
    if x=0
      then begin
             linearintpol:=b;
             fatx:=fb;
             cond:=false
           end
      else begin
             h:=b-a;
             x:=b+fb*h/x;
             if x=a
               then begin
                      fatx:=fa;
                      cond:=false
                    end
               else if x=b
                      then begin
                             fatx:=fb;
                             cond:=false
                           end
                      else begin
                             fatx:=f(x);
                             if fatx=0
                               then cond:=false
                           end;
             if not cond
               then linearintpol:=x
               else begin
                      fa:=fb;
                      fb:=fatx;
                      a:=b;
                      b:=x
                    end
           end
  until not cond;
end;

end.
