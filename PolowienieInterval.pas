unit PolowienieInterval;

interface

uses
IntervalArithmetic32and64;

function binarysearchI (var a,b, fatx  : Interval;
                       mit       : Integer;
                       tol  : Interval;
                       var it,st : Integer) : Interval;

implementation

type DLLFunction = function(x : Interval) : Interval; //typ wczytywanych przez dll funkcji

var
f : DLLFunction; //oznacza wczytan� funkcje

//METODA PO�OWIENIA
function binarysearchI (var a,b, fatx   : Interval;
                       mit       : Integer;
                       tol  : Interval;
                       var it,st : Integer) : Interval;
var fa,fb, x : Interval;
{---------------------------------------------------------------------------}
{                                                                           }
{  The function binarysearch finds an approximate value of the root of the  }
{  equation f(x)=0 lying in the interval [a,b] by the bisection algorithm.  }
{  Data:                                                                    }
{    a,b - the ends of the interval which contains the root (changed on     }
{          exit),                                                           }
{    f   - a Turbo Pascal function which for the given value x calculates   }
{          f(x),                                                            }
{    mit - maximum number of iterations,                                    }
{    tol - tolerance for the solution.                                      }
{  Results:                                                                 }
{    binarysearch(a,b,f,mit,eps,fatx,it,st) - approximate value of the      }
{                                             root,                         }
{    fatx                                   - the value of the function     }
{                                             f(x) at the approximate root, }
{    it                                     - number of iterations.         }
{  Other parameters:                                                        }
{    st - a variable which within the function binarysearch is assigned the }
{         value of:                                                         }
{           1, if mit<1,                                                    }
{           2, f(a)*f(b)>=0,                                                }
{           3, if the given tolerance is not achieved in mit iteration      }
{              steps,                                                       }
{           0, otherwise.                                                   }
{         Note: If st=1 or st=2, then                                       }
{               binarysearch(a,b,f,mit,tol,fatx,it,st) is not calculated,   }
{               and if st=3, then binarysearch(a,b,f,mit,tol,fatx,it,st)    }
{               yields the last approximation found.                        }
{  Unlocal identifier:                                                      }
{    fx - a procedural-type identifier defined as follows                   }
{           type fx = function (x : Extended) : Extended;                   }
{  Note: Any function passed as a parameter should be declared with a far   }
{        directive or compiled in the $F+ state.                            }
{                                                                           }
{---------------------------------------------------------------------------}
begin
    if mit<1
      then st:=1
      else begin
             fa:=f(a);
             fb:=f(b);
             if greaterOrEvenZero(fa*fb)  //new function
               then st:=2
               else begin
                      st:=3;
                      it:=0;
                      repeat
                        it:=it+1;
                        x:=a+(b-a)/2;
                        fa:=f(x);
                        if (containZero(fa)) or ((b-a)/2<tol)
                          then st:=0
                          else begin
                                 fa:=f(a);
                                 fb:=f(x);
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
             fatx:=f(x)
           end
end;

end.
