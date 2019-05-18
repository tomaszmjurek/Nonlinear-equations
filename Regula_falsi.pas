unit Regula_falsi;

interface

type
  DLLFunction = function(x : Extended) : Extended; //typ wczytywanych przez dll funkcji

function regulafalsi (f :  DLLFunction;
                      var a,b  : Extended;
                      var fatx : Extended;
                      var st   : Integer) : Extended;
{---------------------------------------------------------------------------
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
	binarysearch(f,a,b,mit,eps,fatx,it,st)

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
	f : DLLFunction
	a,b,fatx : Extended
	st : Integer

Unlocal identifier:
	DLLFunction = function(x : Extended) : Extended

Code: <below>
---------------------------------------------------------------------------}

implementation

var
  f : DLLFunction; //oznacza wczytan¹ funkcje

//METODA REGULA FALSI
function regulafalsi (f :  DLLFunction;   //przekazana funkcja wczytana w main
                      var a,b  : Extended;
                      var fatx : Extended;
                      var st   : Integer) : Extended;
var sfa,sv    : Integer;
    fa,fb,v,x : Extended;
begin
  if a>=b
    then st:=1
    else begin
           fa:=f(a);
           if fa<0
             then sfa:=-1
             else if fa=0
                    then sfa:=0
                    else sfa:=1;
           fb:=f(b);
           if sfa*fb>0
             then st:=2
             else begin
                    st:=0;
                    x:=b-fb*(b-a)/(fb-fa);
                    while (a<x) and (x<b) do
                      begin
                        v:=f(x);
                        if v<0
                          then sv:=-1
                          else if v=0
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
                    regulafalsi:=x;
                    fatx:=f(x)
                  end
         end
end;

end.
