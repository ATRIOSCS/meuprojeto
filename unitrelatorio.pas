unit unitrelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfrm_relatorio = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DTP_DATAINICIO: TDateTimePicker;
    DTP_DATAFINAL: TDateTimePicker;
    CMB_VENDEDOR: TComboBox;
    btn_imprime: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btn_imprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relatorio: Tfrm_relatorio;

implementation

uses unitpdf1,DM;

{$R *.dfm}

procedure Tfrm_relatorio.btn_imprimeClick(Sender: TObject);
var
w_data : string;
w_fim  : string;
begin
Application.CreateForm(TFrm_pdf, Frm_pdf);

frm_pdf.qry_busca.SQL.Clear;
w_data := formatdatetime('mm/dd/yyyy',DTP_DATAINICIO.date);
w_fim  := formatdatetime('mm/dd/yyyy',DTP_DATAFINAL.date);
frm_pdf.qry_busca.sql.add('SELECT * FROM TBL_VENDAS WHERE F_DATAVENDA  >= ' + QuotedStr(w_data)+ ' and   F_DATAVENDA  <= ' + QuotedStr(w_fim)+ '');


if cmb_vendedor.text = 'Todos' then begin
   frm_pdf.lbl_filtro.caption := '[ Relatorio de todos Vendedores por periodo ]';
end;


if cmb_vendedor.text <> 'Todos' then begin
   frm_pdf.qry_busca.sql.add('and F_VENDEDOR = '+ QuotedStr(cmb_vendedor.Text)   + ' ORDER BY F_VENDEDOR	');
   frm_pdf.lbl_filtro.caption := '[ Relatorio de Comissão do vendedor '+cmb_vendedor.text + ' ]';
end else begin
   frm_pdf.qry_busca.sql.add(' ORDER BY F_VENDEDOR,F_DATAVENDA');
end;

frm_pdf.QRY_BUSCA.OPEN;

FRM_PDF.RELATORIO1.Preview;

Frm_pdf.Free;





end;

procedure Tfrm_relatorio.Button1Click(Sender: TObject);
var
w_data : string;
w_fim  : string;
begin

Application.CreateForm(TFrm_pdf, Frm_pdf);

frm_pdf.qry_busca.SQL.Clear;
w_data := formatdatetime('mm/dd/yyyy',DTP_DATAINICIO.date);
w_fim  := formatdatetime('mm/dd/yyyy',DTP_DATAFINAL.date);
frm_pdf.qry_busca.sql.add('SELECT * FROM TBL_VENDAS WHERE F_DATAVENDA  >= ' + QuotedStr(w_data)+ ' and   F_DATAVENDA  <= ' + QuotedStr(w_fim)+ '');


if cmb_vendedor.text = 'Todos' then begin
   frm_pdf.lbl_filtro.caption := '[ Relatorio de todos Vendedores por periodo ]';
end;


if cmb_vendedor.text <> 'Todos' then begin
   frm_pdf.qry_busca.sql.add('and F_VENDEDOR = '+ QuotedStr(cmb_vendedor.Text)   + ' ORDER BY F_VENDEDOR	');
   frm_pdf.lbl_filtro.caption := '[ Relatorio de Comissão do vendedor '+cmb_vendedor.text + ' ]';
end else begin
   frm_pdf.qry_busca.sql.add(' ORDER BY F_VENDEDOR,F_DATAVENDA');
end;

frm_pdf.QRY_BUSCA.OPEN;


FRM_PDF.RELATORIO1.SaveToFile('C:\TESTECRUD\RELATORIOCOMISSAO.PDF');
Frm_pdf.Free;

showmessage('Relatorio PDF gerado !!! - RELATORIOCOMISSAO.PDF');



end;

end.
