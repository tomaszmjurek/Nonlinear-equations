program Project1;

uses
  Vcl.Forms,
  Main in '..\Embarcadero\Studio\Projects\Main.pas' {Form1},
  SieczneInterval in 'SieczneInterval.pas',
  IntervalArithmetic32and64 in 'IntervalArithmetic32and64.pas',
  PolowienieInterval in 'PolowienieInterval.pas',
  Sieczne in 'Sieczne.pas',
  Polowienie in 'Polowienie.pas',
  Regula_falsi in 'Regula_falsi.pas',
  Regula_falsiInterval in 'Regula_falsiInterval.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
