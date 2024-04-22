program Project1;

uses
  Vcl.Forms,
  unitpesquisa in 'unitpesquisa.pas' {Frm_pesqcli},
  DM in 'DM.pas' {frm_dm: TDataModule},
  SqlExec in 'SqlExec.pas' {Frm_SqlExecuter},
  unitimporta in 'unitimporta.pas' {frm_importa},
  unitrelatorio in 'unitrelatorio.pas' {frm_relatorio},
  unitpdf1 in 'unitpdf1.pas' {frm_pdf};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_pesqcli, Frm_pesqcli);
  Application.CreateForm(Tfrm_dm, frm_dm);
  Application.CreateForm(TFrm_SqlExecuter, Frm_SqlExecuter);
  Application.CreateForm(Tfrm_importa, frm_importa);
  Application.CreateForm(Tfrm_relatorio, frm_relatorio);
  Application.CreateForm(Tfrm_pdf, frm_pdf);
  Application.Run;
end.
