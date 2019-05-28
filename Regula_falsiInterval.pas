unit Regula_falsiInterval;

interface

uses IntervalArithmetic32and64;

type
  DLLFunctionI = function(x : interval) : interval;

function regulafalsiI (fI :  DLLFunctionI;
                      var a,b,fatx  : interval;
                      var st : Integer) : interval;
{-------------------------DOCUMENTATION-----------------------------------------
Usage:
  The function regulafalsi finds an approximate value of the root of the
  equation f(x)=0 lying in the interval [a,b] by regula falsi.

Algorithm:
  1. Read values of x0, x1 and e
    *Here x0 and x1 are the two initial guesses
    e is the degree of accuracy or the absolute error i.e. the stopping criteria*
  2. Computer function values f(x0) and f(x1)
  3. Check whether the product of f(x0) and f(x1) is negative or not.
    If it is positive take another initial guesses.
    If it is negative then goto step 5.
  4. Determine:
    x = [x0*f(x1) – x1*f(x0)] / (f(x1) – f(x0))
  5. Check whether the product of f(x1) and f(x) is negative or not.
    If it is negative, then assign x0 = x;
    If it is positive, assign x1 = x;
  6. Check whether the value of f(x) is greater than 0.00001 or not.
    If yes, goto step 5.
    If no, goto step 8.
    *Here the value 0.00001 is the desired degree of accuracy, and hence the stopping criteria.*
7. Display the root as x.

Function call:
	regulafalsiI(fI,a,b,mit,eps,fatx,it,st)

Data:
    a,b - the ends of the interval which contains the root (changed on
         exit),
    f   - a Turbo Pascal function which for the given value x calculates
          f(x).
Results:
  regulafalsi(a,b,f,fatx,st) - approximate value of the root,
  fatx                       - the value of the function f(x) at the
                               approximate root.
Other parameters:
  st - a variable which within the function regulafalsi is assigned the
       value of:
         1, if a>=b,
         2, if f(a)*f(b)>0,
         0, otherwise.

Types of parameters:
	f : DLLFunctionI
	a,b,fatx, st : interval

Unlocal identifier:
	DLLFunctionI = function(x : interval) : interval

Examples for f(x) = x*x-2:

1) Single interval, Correct
  a = 1, b = 2
  regulafalsi() = 1.41421356237308635E+0000  1.41421356237310099E+0000
  fatx = -2.46137745602004188E-0014  1.67960263752764405E-0014
  st = 0

2) Double interval, Correct
  regulafalsi() = 1.26553744746036192E+0000   1.51282909268095324E+0000
  fatx =  -3.98414969075511681E-0001   2.88651863661876217E-0001
  st = 0


Code: <below>
---------------------------------------------------------------------------}

implementation

var
  fI : DLLFunctionI; //oznacza wczytan¹ funkcje

//METODA REGULA FALSI
function regulafalsiI (fI :  DLLFunctionI;
                      var a,b,fatx  : interval;
                      var st : Integer) : interval;
var sfa,sv    : Integer;
    fa,fb,v,x : interval;
begin
  if a>=b
    then st:=1
    else begin
           fa:=fI(a);
           if fa<0
             then sfa:=-1
             else if (fa.b=0) and (fa.a=0)
                    then sfa:=0
                    else sfa:=1;
           fb:=fI(b);
           if greaterThanZero(sfa*fb)
             then st:=2
             else begin
                    st:=0;
                    x:=b-fb*(b-a)/(fb-fa);
                    while (a<x) and (x<b) do
                      begin
                        v:=fI(x);
                        if v<0
                          then sv:=-1
                          else if (v.a=0) and (v.b=0)
                                 then sv:=0
                                 else sv:=1;
                        if sfa=sv
                          then begin
                                 a:=x;
                                 fa:=v
                               end
                          else begin
                                 b:=x;
                                 fb:=v
                               end;
                        x:=b-fb*(b-a)/(fb-fa)
                      end;
                    regulafalsiI:=x;
                    fatx:=fI(x)
                  end
         end
end;

end.
