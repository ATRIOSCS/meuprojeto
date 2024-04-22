unit unitpdf1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, RLReport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLFilters, RLPDFFilter  ;

type
  Tfrm_pdf = class(TForm)
    RELATORIO1: TRLReport;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel1: TRLLabel;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel9: TRLLabel;
    qry_busca: TFDQuery;
    qry_buscaF_ID: TIntegerField;
    qry_buscaF_DATAVENDA: TDateField;
    qry_buscaF_VENDEDOR: TStringField;
    qry_buscaF_VALORVENDA: TBCDField;
    qry_buscaF_VALORDESC: TBCDField;
    qry_buscaF_VALORTOT: TBCDField;
    dts_vendas: TDataSource;
    RLTOT: TRLBand;
    lbl_valorvenda: TRLLabel;
    RLBand3: TRLBand;
    lbl_valorvendatot: TRLLabel;
    qry_buscaF_VALORPERC: TBCDField;
    qry_buscaF_VALORCOMI: TBCDField;
    qry_buscaF_PERBONI: TBCDField;
    qry_buscaF_VALORBONI: TBCDField;
    qry_buscaF_COMILIQU: TBCDField;
    lbl_filtro: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel11: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    lbl_valordesc: TRLLabel;
    lbl_valortot: TRLLabel;
    lbl_valorcomi: TRLLabel;
    lbl_valordesctot: TRLLabel;
    lbl_valortottot: TRLLabel;
    lbl_valorcomitot: TRLLabel;
    lbl_valorbonitot: TRLLabel;
    lbl_valorboni: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2AfterPrint(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLTOTBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLTOTAfterPrint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
     w_vendant : string;
     w_valorvenda : extended;

     w_valordesc : extended;
     w_valortot : extended;
     w_valorcomi : extended;
     w_valorboni : extended;


  end;

var
  frm_pdf: Tfrm_pdf;


implementation

{$R *.dfm}
USES DM,unitrelatorio;


procedure Tfrm_pdf.RLBand2AfterPrint(Sender: TObject);

begin
  w_vendant := '';
  w_vendant := qry_buscaf_vendedor.asstring;
  w_valorvenda := w_valorvenda + qry_buscaf_valorvenda.value;

  w_valordesc := w_valordesc + qry_buscaf_valordesc.value;;
  w_valortot  := w_valortot  + qry_buscaf_valortot.value;
  w_valorcomi := w_valorcomi + qry_buscaf_valorcomi.value;
  w_valorboni := w_valorboni + qry_buscaf_valorboni.value;

 if qry_busca.Eof  then begin
     rltot.visible := false;
 end;
end;

procedure Tfrm_pdf.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
if qry_buscaf_vendedor.asstring <> w_vendant  then begin
   lbl_valorvenda.caption := floattostr(w_valorvenda);

   lbl_valordesc.caption := floattostr(w_valordesc);
   lbl_valortot.caption := floattostr(w_valortot);
   lbl_valorcomi.caption := floattostr(w_valorcomi);
   lbl_valorboni.caption := floattostr(w_valorboni);


   lbl_valorboni.caption := formatcurr(',0.00', strtocurr(lbl_valorboni.caption));
   lbl_valordesc.caption := formatcurr(',0.00', strtocurr(lbl_valordesc.caption));
   lbl_valortot.caption  := formatcurr(',0.00', strtocurr(lbl_valortot.caption));
   lbl_valorcomi.caption  := formatcurr(',0.00', strtocurr(lbl_valorcomi.caption));


   w_valorvenda:= 0;
   rltot.visible := true;
   relatorio1.NewPageNeeded := true;
end;



end;

procedure Tfrm_pdf.RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin

   lbl_valorvendatot.caption := floattostr(w_valorvenda);

   lbl_valordesctot.caption := floattostr(w_valordesc);
   lbl_valortottot.caption  := floattostr(w_valortot);
   lbl_valorcomitot.caption := floattostr(w_valorcomi);
   lbl_valorbonitot.caption := floattostr(w_valorboni);

   lbl_valordesctot.caption  := formatcurr(',0.00', strtocurr(lbl_valordesctot.caption));
   lbl_valortottot.caption  := formatcurr(',0.00', strtocurr(lbl_valortottot.caption));
   lbl_valorcomitot.caption  := formatcurr(',0.00', strtocurr(lbl_valorcomitot.caption));
   lbl_valorbonitot.caption  := formatcurr(',0.00', strtocurr(lbl_valorbonitot.caption));

end;

procedure Tfrm_pdf.RLTOTAfterPrint(Sender: TObject);
begin
 rltot.visible := false;
end;

procedure Tfrm_pdf.RLTOTBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
if qry_buscaf_vendedor.asstring = w_vendant  then begin
   rltot.visible := false;

end;
end;

end.
