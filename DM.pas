unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase;

type
  Tfrm_dm = class(TDataModule)
    CONEXAO: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    TBL_VENDAS: TFDTable;
    dts_vendas: TDataSource;
    TBL_VENDASF_ID: TIntegerField;
    TBL_VENDASF_DATAVENDA: TDateField;
    TBL_VENDASF_VENDEDOR: TStringField;
    TBL_VENDASF_VALORVENDA: TBCDField;
    TBL_VENDASF_VALORDESC: TBCDField;
    TBL_VENDASF_VALORTOT: TBCDField;
    TBL_VENDASF_VALORPERC: TBCDField;
    TBL_VENDASF_VALORCOMI: TBCDField;
    TBL_VENDASF_PERBONI: TBCDField;
    TBL_VENDASF_VALORBONI: TBCDField;
    TBL_VENDASF_COMILIQU: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dm: Tfrm_dm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
