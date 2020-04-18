unit uFormNewCalc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Math.Vectors, FMX.Controls3D,
  FMX.Layers3D, FMX.Layouts, FMX.TabControl, FMX.MultiView, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  uCalculator;

type
  TFormMyCalc = class(TForm)
    MultiView1: TMultiView;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    LayoutDisplay: TLayout;
    LabelDisplay: TLabel;
    ScaledLayout1: TScaledLayout;
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
    Layout3D1: TLayout3D;
    TabItem2: TTabItem;
    CalcButton: TButton;
    GolfButton: TButton;
    ListView1: TListView;
    SelectCalc: TButton;
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
    procedure SelectCalcClick(Sender: TObject);
  private
    { Private declarations }
    CalcStatus : TCalcStatus;

  public
    { Public declarations }
    Procedure Refresh;

  end;

var
  FormMyCalc: TFormMyCalc;

implementation

{$R *.fmx}

procedure TFormMyCalc.FormCreate(Sender: TObject);
begin
  CalcStatus := TCalcStatus.Create;
end;

procedure TFormMyCalc.FormDestroy(Sender: TObject);
begin
  CalcStatus.Free;
end;

procedure TFormMyCalc.SelectCalcClick(Sender: TObject);
begin
    TabControl1.ActiveTab := TabControl1.Tabs[1];
end;

procedure TFormMyCalc.ButtonDecimanlClick(Sender: TObject);
begin
  CalcStatus.AddDecimalSeparator;
  Refresh;
end;

procedure TFormMyCalc.ButtonEqualsClick(Sender: TObject);
begin
  CalcStatus.CalcTotal;
  Refresh;
end;

procedure TFormMyCalc.ButtonMultiplyClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opMultiply);
  Refresh;
end;

procedure TFormMyCalc.ButtonPlusClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opAdd);
  Refresh;
end;


procedure TFormMyCalc.ButtonMinusClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opSubtract);
  Refresh;
end;

procedure TFormMyCalc.ButtonDivideClick(Sender: TObject);
begin
  CalcStatus.NewOperation (opDivide);
  Refresh;
end;

procedure TFormMyCalc.ButtonNumberClick(Sender: TObject);
begin
  CalcStatus.AddDigit ((Sender as TButton).Text);
  Refresh;
end;

procedure TFormMyCalc.Refresh;
begin
  LabelDisplay.Text := CalcStatus.DisplayValue;
end;


{ Multiview Buttons }
procedure TFormMyCalc.CalcButtonClick(Sender: TObject);
begin
  TabControl1.ActiveTab := Tabcontrol1.Tabs[1];
end;

procedure TFormMyCalc.GolfButtonClick(Sender: TObject);
begin
  TabControl1.ActiveTab := Tabcontrol1.Tabs[2];
end;

end.
