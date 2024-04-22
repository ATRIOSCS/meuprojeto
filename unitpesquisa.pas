unit unitpesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Phys.IBBase, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script;

type
  TFrm_pesqcli = class(TForm)
    CONEXAO: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    lbl_conexao: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Button1: TButton;
    btn_verexiste: TButton;
    btn_criar: TButton;
    Button4: TButton;
    Label1: TLabel;
    edt_comando: TEdit;
    btn_comando: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    btn_relatorios: TSpeedButton;
    procedure btn_criarClick(Sender: TObject);
    procedure btn_verexisteClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure B_IncluirClick(Sender: TObject);
    procedure btn_comandoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_comandoChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_relatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pesqcli: TFrm_pesqcli;

implementation

{$R *.dfm}

uses dm, SqlExec,  unitimporta, unitrelatorio;


procedure TFrm_pesqcli.Button2Click(Sender: TObject);
begin
memo1.Clear;
end;

procedure TFrm_pesqcli.btn_criarClick(Sender: TObject);
begin
 frm_dm.CONEXAO.Close;
 with fdquery1 do begin
     Close;
     SQL.Clear;
     SQL.add('Select rdb$relation_name from rdb$relations where ((rdb$system_flag=0) or (rdb$system_flag is null)) and '+
                 ' (rdb$view_source is null) '+
                 ' order by rdb$relation_name ');
     OPEN;
     If RECORDCOUNT > 0 then BEGIN
       showmessage('Tabela já existe !');
     End;

    // range de comando para criacao de tabela em tempo de execucao jbn
            with fdquery1 do begin
                    SQL.Clear;
                     sql.Add('create table TBL_VENDAS(');
                     sql.Add('F_ID     integer not null primary key, ');
                     sql.Add('F_datavenda  date , ');
                     sql.Add('F_vendedor   varchar(20) , ');
                     sql.Add('F_VALORVENDA  NUMERIC(18,2), ');
                     sql.Add('F_VALORDESC   NUMERIC(18,2), ');
                     sql.Add('F_VALORTOT    NUMERIC(18,2), ');
                     sql.Add('F_VALORPERC   NUMERIC(18,2), ');
                     sql.Add('F_VALORCOMI   NUMERIC(18,2), ');
                     sql.Add('F_PERBONI     NUMERIC(18,2), ');
                     sql.Add('F_VALORBONI   NUMERIC(18,2), ');
                     sql.Add('F_COMILIQU    NUMERIC(18,2))');
                     edt_comando.Text := sql.Text;
                     execute;
                     Close;
                     SQL.Clear;
                     SQL.add('Select rdb$relation_name from rdb$relations where ((rdb$system_flag=0) or (rdb$system_flag is null)) and '+
                       ' (rdb$view_source is null) '+
                       ' order by rdb$relation_name ');
                     OPEN;
                     CommitUpdates;
            end;


            with fdquery1 do begin
                    SQL.Clear;
                     sql.Add('CREATE UNIQUE INDEX XTBL_VENDAS ON TBL_VENDAS (F_VALORVENDA '+
                          ' )');
                     edt_comando.Text := sql.Text;
                     execute;
                     Close;
                     SQL.Clear;
                     SQL.add('Select rdb$relation_name from rdb$relations where ((rdb$system_flag=0) or (rdb$system_flag is null)) and '+
                       ' (rdb$view_source is null) '+
                       ' order by rdb$relation_name ');
                     OPEN;
                     CommitUpdates;
            end;
            // FIM da range de comando para criacao de tabela em tempo de execucao jbn

            ShowMessage('Tabelas Criadas com sucesso!');
            exit;

  end;

end;

procedure TFrm_pesqcli.btn_verexisteClick(Sender: TObject);
begin
  with fdquery1 do begin
     SQL.Clear;
     SQL.add('Select rdb$relation_name from rdb$relations where ((rdb$system_flag=0) or (rdb$system_flag is null)) and '+
                 ' (rdb$view_source is null) '+
                 ' order by rdb$relation_name ');
     edt_comando.Text := sql.text;
     OPEN;
     If RECORDCOUNT = 0 then BEGIN
       showmessage('Tabelas nao existem ! Devem Ser Criadas');
     end;
   end;
end;

procedure TFrm_pesqcli.Button4Click(Sender: TObject);
begin

try
  frm_dm.TBL_VENDAS.active := false;
  frm_dm.TBL_VENDAS.Close;
finally

end;


frm_dm.CONEXAO.Close;
    with fdquery1 do begin
     Close;
     SQL.Clear;
     SQL.add('Select rdb$relation_name from rdb$relations where ((rdb$system_flag=0) or (rdb$system_flag is null)) and '+
                 ' (rdb$view_source is null) '+
                 ' order by rdb$relation_name ');
     OPEN;


     If RECORDCOUNT = 0 then BEGIN
        showmessage('Não exista mais tabelas no banco de dados !');
        exit;
     End;

    TRY
           with fdquery1 do begin
            //Close;
            SQL.Clear;
            sql.Add('drop  table TBL_VENDEDORES');
            edt_comando.Text := sql.Text;
            execute;
            END
    EXCEPT

    END;
    TRY
           with fdquery1 do begin
            //Close;
            SQL.Clear;
            sql.Add('drop  table TBL_CLIENTES');
            edt_comando.Text := sql.Text;
            execute;
            END
    EXCEPT

    END;




    TRY
           with fdquery1 do begin
            //Close;
            SQL.Clear;
            sql.Add('drop  table TBL_TELEFONECLI');
            edt_comando.Text := sql.Text;
            execute;
            END
    EXCEPT

    END;


    TRY
           with fdquery1 do begin
            //Close;
            SQL.Clear;
            sql.Add('drop  table TBL_VENDAS');
            edt_comando.Text := sql.Text;
            execute;
            END
    EXCEPT

    END;



    Close;
    SQL.Clear;
    SQL.add('Select rdb$relation_name from rdb$relations where ((rdb$system_flag=0) or (rdb$system_flag is null)) and '+
            ' (rdb$view_source is null) '+
            ' order by rdb$relation_name ');
     OPEN;
     CommitUpdates;

  END;
end;

procedure TFrm_pesqcli.B_IncluirClick(Sender: TObject);
begin
//
end;

procedure TFrm_pesqcli.edt_comandoChange(Sender: TObject);
begin
MEMO1.lines.add('--');
MEMO1.lines.add(edt_comando.text);
end;

procedure TFrm_pesqcli.FormShow(Sender: TObject);
begin
btn_verexiste.Click;
end;

procedure TFrm_pesqcli.SpeedButton2Click(Sender: TObject);
begin
Application.CreateForm(TFrm_importa, Frm_importa);
Frm_importa.ShowModal;
Frm_importa.Free;
end;

procedure TFrm_pesqcli.btn_comandoClick(Sender: TObject);
begin
Application.CreateForm(TFrm_sqlExecuter, Frm_sqlExecuter);
Frm_sqlExecuter.ShowModal;
Frm_sqlExecuter.Free;

end;

procedure TFrm_pesqcli.btn_relatoriosClick(Sender: TObject);
begin
Application.CreateForm(TFrm_relatorio, Frm_relatorio);
Frm_relatorio.ShowModal;
Frm_relatorio.Free;
end;

end.
