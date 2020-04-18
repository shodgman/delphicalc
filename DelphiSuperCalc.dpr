program DelphiSuperCalc;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCalculator in 'uCalculator.pas',
  uFormNewCalc in 'uFormNewCalc.pas' {FormMyCalc};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMyCalc, FormMyCalc);
  Application.Run;
end.
