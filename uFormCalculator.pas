unit uFormCalculator;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  uCalculator, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D,
  FMX.TabControl, FMX.MultiView;

type
  TFormCalc = class(TForm)
    LayoutDisplay: TLayout;
    LabelDisplay: TLabel;
    GridLayoutButtons: TGridLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonPlus: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ButtonMinus: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ButtonMultiply: TButton;
    ButtonDecimal: TButton;
    Button0: TButton;
    ButtonEquals: TButton;
    ButtonDivide: TButton;
    ScaledLayout1: TScaledLayout;
    Layout3D1: TLayout3D;
    MultiView1: TMultiView;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    CalcButton: TButton;
    GolfButton: TButton;

    procedure ButtonNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonDecimanlClick(Sender: TObject);
    procedure ButtonPlusClick(Sender: TObject);
    procedure ButtonMinusClick(Sender: TObject);
    procedure ButtonMultiplyClick(Sender: TObject);
    procedure ButtonDivideClick(Sender: TObject);
    procedure ButtonEqualsClick(Sender: TObject);
    procedure CalcButtonClick(Sender: TObject);
    procedure GolfButtonClick(Sender: TObject);
  private
    { Private declarations }
    CalcStatus : TCalcStatus;
  public
    { Public declarations }
    Procedure Refresh;
  end;


var
  FormCalc: TFormCalc;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

procedure TFormCalc.FormCreate(Sender: TObject);
begin
  CalcStatus := TCalcStatus.Create;
end;

procedure TFormCalc.FormDestroy(Sender: TObject);
begin
  CalcStatus.Free;
end;

procedure TFormCalc.ButtonDecimanlClick(Sender: TObject);
begin
  CalcStatus.AddDecimalSeparator;
  Refresh;
end;

procedure TFormCalc.ButtonEqualsClick(Sender: TObject);
begin
  CalcStatus.CalcTotal;
  Refresh;
end;

procedure TFormCalc.ButtonMultiplyClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opMultiply);
  Refresh;
end;

procedure TFormCalc.ButtonPlusClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opAdd);
  Refresh;
end;


procedure TFormCalc.ButtonMinusClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opSubtract);
  Refresh;
end;

procedure TFormCalc.ButtonDivideClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opDivide);
  Refresh;
end;

procedure TFormCalc.ButtonNumberClick(Sender: TObject);
begin
  CalcStatus.AddDigit ((Sender as TButton).Text);
  Refresh;
end;

procedure TFormCalc.Refresh;
begin
  LabelDisplay.Text := CalcStatus.DisplayValue;
end;

{ Multiview Navigation }

procedure TFormCalc.CalcButtonClick(Sender: TObject);
begin
    TabControl1.ActiveTab := TabControl1.Tabs[1];
end;

procedure TFormCalc.GolfButtonClick(Sender: TObject);
begin
    TabControl1.ActiveTab := TabControl1.Tabs[2];
end;

end.
