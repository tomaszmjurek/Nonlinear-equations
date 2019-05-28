unit SieczneInterval;

interface

uses
  IntervalArithmetic32and64;

type
  DLLFunctionI = function(x : interval) : interval;


function linearintpolI (fI : DLLFunctionI;
                       var a,b,fatx  : interval) : interval;
{-------------------------DOCUMENTATION-----------------------------------------
Usage:
	The function linearintpolI finds an approximate value of the root of the
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
	linearintpolI(fI,a,b,fatx)

Data:
  a,b - the ends of the interval which contains the root (changed on exit),
  f   - a Turbo Pascal function which for the given value x calculates f(x).

Results:
    linearintpol(a,b,f,fatx) - approximate value of the root,
    fatx                     - the value of the function f(x) at the
                               approximate root.

Types of parameters:
	fI : DLLFunctionI
	a,b,fatx : interval

Unlocal identifier:
	DLLFunctionI = function(x : interval) : interval

Examples for f(x) = x*x-2:

1) Single interval, Correct
 a = 1, b = 2
 linearintpolI() = 1.41421356237309502E+0000  1.41421356237309508E+0000
 fatx = -8.66277535815918043E-0017  8.67361737988403547E-0017

2) Double interval, Correct
  a = 0,99 ; 1,01, b = 1,99 ; 2,01
  linearintpolI() = 1.32043285383721468E+0000  1.56113229073069145E+0000
  fatx = -2.56457078507308840E-0001  4.37134029162056144E-0001


Code: <below>
---------------------------------------------------------------------------}

implementation


//METODA SIECZNYCH
function linearintpolI (fI : DLLFunctionI;
                       var a,b,fatx  : interval) : interval;
var fa,fb,h,x : interval;
    cond      : Boolean;
begin
  cond:=true;
  h:=0.179372*(b-a);
  a:=a+h;
  b:=b-h;
  fa:=fI(a);
  fb:=fI(b);
  if iabs(fa)<iabs(fb)  //poprawione
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
    if  containZero(x) //poprawione
      then begin
             linearintpolI:=b;
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
                             fatx:=fI(x);
                             if fatx=0
                               then cond:=false
                           end;
             if not cond
               then linearintpolI:=x
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
