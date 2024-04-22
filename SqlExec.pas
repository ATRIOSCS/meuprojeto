unit SqlExec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, DB,  Grids,
  ComCtrls, Buttons, DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;




type
  TFrm_SqlExecuter = class(TForm)
    Mem_Comandos: TMemo;
    Label1: TLabel;
    Btn_Executar: TBitBtn;
    Btn_Limpar: TBitBtn;
    StatusBar1: TStatusBar;
    Dbg_Resultado: TDBGrid;
    Label2: TLabel;
    Dts_Executa: TDataSource;
    Dbn_Resultado: TDBNavigator;
    Btn_Abrir: TBitBtn;
    Opd_Sql: TOpenDialog;
    BitBtn1: TBitBtn;
    Btn_Salvar: TBitBtn;
    Svd_SQL: TSaveDialog;
    Mem_Status: TMemo;
    qry_exec: TFDQuery;
    procedure Chb_Live2Click(Sender: TObject);
    procedure Btn_ExecutarClick(Sender: TObject);
    procedure Btn_LimparClick(Sender: TObject);
    procedure Btn_AbrirClick(Sender: TObject);
    procedure Btn_SalvarClick(Sender: TObject);
    procedure Btn_SalvaResultadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SqlExecuter: TFrm_SqlExecuter;

implementation

{$R *.DFM}

uses dm;

procedure TFrm_SqlExecuter.Chb_Live2Click(Sender: TObject);
begin
	//Qry_Exec := Chb_Live.Checked;
end;

procedure TFrm_SqlExecuter.Btn_ExecutarClick(Sender: TObject);
var
	s_caption: String;
begin
	s_caption := Caption;
  Caption := Caption + '   (Executando comando SQL...)';
	with Qry_Exec do begin
  	Close;
  	Sql.Clear;
    Sql := Mem_Comandos.Lines;
    try
    	begin
		    Open;
        Mem_Status.Clear;
      end;
    except
    	on E: Exception do begin
      	Mem_Status.Lines.Text := E.Message
      end;
    end;
  end;
  Caption := s_caption;
end;

procedure TFrm_SqlExecuter.Btn_LimparClick(Sender: TObject);
begin
	Mem_Comandos.Lines.Clear;
end;

procedure TFrm_SqlExecuter.Btn_AbrirClick(Sender: TObject);
begin
	if Opd_Sql.Execute then begin
  	Mem_Comandos.Lines.Clear;
    Mem_Comandos.Lines.LoadFromFile(Opd_Sql.Filename);
    Svd_Sql.Filename := Opd_Sql.Filename;
  end;
end;

procedure TFrm_SqlExecuter.Btn_SalvarClick(Sender: TObject);
begin
	if Svd_Sql.Execute then begin
  	Mem_Comandos.Lines.SavetoFile(Svd_Sql.Filename);
  end;
end;

procedure TFrm_SqlExecuter.Btn_SalvaResultadoClick(Sender: TObject);
var
	nome: String;
begin

end;

end.
