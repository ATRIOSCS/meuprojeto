unit unitimporta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,dm,ExtCtrls,grids,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls;





type
  Tfrm_importa = class(TForm)
    Button1: TButton;
    campo1: TEdit;
    campo2: TEdit;
    campo3: TEdit;
    campo4: TEdit;
    campo5: TEdit;
    campo6: TEdit;
    DBGrid1: TDBGrid;
    qry_busca: TFDQuery;
    btn_atribui: TButton;
    btn_ranking: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    primeiro: TLabel;
    segundo: TLabel;
    terceiro: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure btn_rankingClick(Sender: TObject);
    procedure btn_atribuiClick(Sender: TObject);


  private
    { Private declarations }




  public
    { Public declarations }

    w_comissao1 : integer;
    w_comissao2 : integer;
    w_comissao3 : integer;

    w_campocomi5  : string;
    w_campocomi10 : string;
    w_campocomiboni : string;

    w_campoboni   : string;
    w_bonificacao : integer;

  end;

var
  frm_importa: Tfrm_importa;




implementation

{$R *.dfm}

uses

 unitpdf1;







procedure Tfrm_importa.Button1Click(Sender: TObject);
var
Linhas, Colunas:TStringList;
 i,j:integer;
w_valor :DOUBLE;
 w_data : string;
begin
// limpando tabela
qry_busca.SQL.Clear;
qry_busca.sql.add('DELETE FROM TBL_VENDAS WHERE F_ID > -1 ');
qry_busca.EXECUTE;

 frm_dm.TBL_VENDAS.Open();
 Linhas := TStringList.Create;
 Colunas := TStringList.Create;

 try
   Linhas.LoadFromFile('c:\testecrud\vendasdelphi.csv'); //Carregando arquivo
   for i := 0 to Pred(Linhas.Count) do
   begin
     {Transformando os dados das colunas em Linhas}
     Colunas.text := StringReplace(Linhas.Strings[i],',',#13,[rfReplaceAll]);
     for j := 0 to Pred(Colunas.Count) do
     begin
       { Aqui você faz alguma coisa como colocar num Edit
         No Meu caso aqui para exemplificar vou apenas mostrar num ShowMessage}
       //ShowMessage('Valor "'+Colunas.Strings[j] + '" da Linha '+IntTostr(i+1) +
       //  ' Coluna '+IntToStr(j+1));



     if i > 4  then begin

        if j = 0  then begin
           campo1.Text := Colunas.Strings[j];
        end;

        if j = 1  then begin
           campo2.Text := Colunas.Strings[j];
//           campo2.Text := copy((campo2.text),1,2)+'/'+copy((campo2.text),4,2)+'/'+copy((campo2.text),7,4);
           w_data := copy((campo2.text),1,2)+'/'+copy((campo2.text),4,2)+'/'+copy((campo2.text),7,4);

        end;

        if j = 2  then begin
           campo3.Text := Colunas.Strings[j];
        end;

        if j = 3  then begin
          campo4.Text :=  Colunas.Strings[j];
          campo4.text := StringReplace(campo4.text, '.', ',', []);

        end;

        if j = 4  then begin
           campo5.Text := Colunas.Strings[j];
           campo5.text := StringReplace(campo5.text, '.', ',', []);
        end;

        if j = 5  then begin
           campo6.Text := Colunas.Strings[j];
           campo6.text := StringReplace(campo6.text, '.', ',', []);
        end;

        if j  =5  then BEGIN

        W_VALOR := STRTOFLOAT(CAMPO6.Text);
        W_VALOR := TRUNC(W_VALOR);
        frm_dm.TBL_VENDAS.Append;
        frm_dm.TBL_VENDASF_ID.asinteger         :=  STRTOINT(CAMPO1.TEXT);
        frm_dm.TBL_VENDASF_DATAVENDA.ASdatetime     := strtodate(w_data);
        frm_dm.TBL_VENDASF_VENDEDOR.AsString    := campo3.Text; // codigo do vendedor

        frm_dm.TBL_VENDASF_VALORVENDA.asfloat :=  strTOFLOAT(CAMPO4.TEXT);
        frm_dm.TBL_VENDASF_VALORDESC.asfloat := strTOFLOAT(CAMPO5.TEXT);
        frm_dm.TBL_VENDASF_VALORTOT.asfloat := strTOFLOAT(CAMPO6.TEXT);
        frm_dm.TBL_VENDAS.post;
        END;

     end;
     end;
  end;
 finally
   Linhas.Free;
   Colunas.Free;


   btn_ranking.click;
   btn_atribui.click;

   FRM_DM.TBL_VENDAS.close();
   FRM_DM.TBL_VENDAS.Open();


   showmessage('importacao finalizada ...');










end;






end;

procedure Tfrm_importa.btn_atribuiClick(Sender: TObject);
begin

qry_busca.SQL.Clear;
qry_busca.sql.add('update TBL_VENDAS SET F_VALORPERC = '+ FLOATTOSTR(W_COMISSAO1) +' WHERE F_VENDEDOR = ' +  QuotedStr(W_CAMPOCOMI5)+ '');
qry_busca.EXECUTE;

qry_busca.SQL.Clear;
qry_busca.sql.add('update TBL_VENDAS SET F_VALORPERC = '+ FLOATTOSTR(W_COMISSAO2) +' WHERE F_VENDEDOR = ' +  QuotedStr(W_CAMPOCOMI10)+ '');
qry_busca.EXECUTE;

// aplicando bonificacao
qry_busca.SQL.Clear;
qry_busca.sql.add('update TBL_VENDAS SET F_PERBONI = '+ FLOATTOSTR(W_bonificacao) +' WHERE F_VENDEDOR = ' +  QuotedStr(w_campoboni)+ '');
qry_busca.EXECUTE;

// calculando bonificacao com os percentuais atribuidos

qry_busca.SQL.Clear;
qry_busca.sql.add('update TBL_VENDAS SET F_VALORPERC = '+ FLOATTOSTR(W_COMISSAO3) +' WHERE F_VENDEDOR = ' +  QuotedStr(W_CAMPOBONI)+ '');
qry_busca.EXECUTE;


// CALCULANDO VALORES DAS COMISSOES - PODERIA FAZER UM UPDATE SO, MAS DETALHERI PARA FACILITAR MANUTENCAO NO FUTURO

qry_busca.SQL.Clear;
qry_busca.sql.add('update TBL_VENDAS SET F_VALORCOMI = F_VALORVENDA * F_VALORPERC / 100');
qry_busca.EXECUTE;

// APLICANDO BONIFICACAO
qry_busca.SQL.Clear;
qry_busca.sql.add('update TBL_VENDAS SET F_VALORBONI = F_VALORCOMI * F_PERBONI / 100');
qry_busca.EXECUTE;

// CALCULANDO A COMISSAO FINAL
// APLICANDO BONIFICACAO
qry_busca.SQL.Clear;
qry_busca.sql.add('update TBL_VENDAS SET F_COMILIQU = F_VALORCOMI + F_VALORBONI');
qry_busca.EXECUTE;

FRM_DM.TBL_VENDAS.Open();


end;

procedure Tfrm_importa.btn_rankingClick(Sender: TObject);
begin

w_comissao1 := 5;
w_comissao2 := 10;
w_comissao3 := 10;
w_bonificacao := 20;

qry_busca.SQL.Clear;
qry_busca.sql.add('SELECT SUM(F_VALORTOT) AS total, (F_VENDEDOR)  AS VENDEDOR_RANKING  FROM tbl_vendas  GROUP BY f_vendedor order by TOTAL ');
qry_busca.Open();

qry_busca.First;
primeiro.Caption := qry_busca.fieldbyname('vendedor_ranking').AsString;
primeiro.Caption := primeiro.Caption + ' - ' + qry_busca.fieldbyname('total').asstring;
primeiro.Caption := primeiro.Caption + ' - ' + inttostr(w_comissao1)+' ( % )';
w_campocomi5 := qry_busca.fieldbyname('vendedor_ranking').AsString;

qry_busca.next;
segundo.Caption := qry_busca.fieldbyname('vendedor_ranking').AsString;
segundo.Caption := segundo.Caption + ' - ' + qry_busca.fieldbyname('total').asstring;
segundo.Caption := segundo.Caption + ' - ' + inttostr(w_comissao2)+' ( % )';

w_campocomi10   := qry_busca.fieldbyname('vendedor_ranking').AsString;
W_bonificacao   := 20;

qry_busca.next;
terceiro.Caption := qry_busca.fieldbyname('vendedor_ranking').AsString;
terceiro.Caption := terceiro.Caption + ' - ' + qry_busca.fieldbyname('total').asstring;
terceiro.Caption := terceiro.Caption + ' - ' + inttostr(w_comissao3) + ' ( % )'  +' - ( sobre bonificao de ): ' + inttostr(w_bonificacao) + '( % )';

// vendedor 03
w_campoboni      := qry_busca.fieldbyname('vendedor_ranking').AsString;
// so nos interessa 3 primeiros - por isso que nao coloqueir em loop

end;

end.
