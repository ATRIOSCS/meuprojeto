object frm_importa: Tfrm_importa
  Left = 0
  Top = 0
  Caption = 'Importar Tabela CSV'
  ClientHeight = 442
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 321
    Top = 255
    Width = 122
    Height = 17
    Caption = 'Grid de Confer'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 128
    Top = 8
    Width = 513
    Height = 65
    Caption = 'Importa Dados'
    TabOrder = 0
    OnClick = Button1Click
  end
  object campo1: TEdit
    Left = 321
    Top = 194
    Width = 15
    Height = 23
    TabOrder = 1
    Text = 'campo1'
  end
  object campo2: TEdit
    Left = 342
    Top = 194
    Width = 15
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object campo3: TEdit
    Left = 363
    Top = 190
    Width = 15
    Height = 23
    TabOrder = 3
    Text = 'Edit1'
  end
  object campo4: TEdit
    Left = 384
    Top = 190
    Width = 15
    Height = 23
    TabOrder = 4
    Text = 'Edit1'
  end
  object campo5: TEdit
    Left = 405
    Top = 190
    Width = 12
    Height = 23
    TabOrder = 5
    Text = 'Edit1'
  end
  object campo6: TEdit
    Left = 423
    Top = 190
    Width = 10
    Height = 23
    TabOrder = 6
    Text = 'Edit1'
  end
  object DBGrid1: TDBGrid
    Left = 26
    Top = 277
    Width = 727
    Height = 148
    DataSource = frm_dm.dts_vendas
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btn_atribui: TButton
    Left = 720
    Top = 206
    Width = 17
    Height = 23
    Caption = 'Atribuir Comissao (Passo 3)'
    TabOrder = 8
    OnClick = btn_atribuiClick
  end
  object btn_ranking: TButton
    Left = 720
    Top = 184
    Width = 17
    Height = 16
    Caption = 'Ver Ranking (Passo 2)'
    TabOrder = 9
    OnClick = btn_rankingClick
  end
  object Panel1: TPanel
    Left = 26
    Top = 88
    Width = 727
    Height = 161
    TabOrder = 10
    object Label1: TLabel
      Left = 287
      Top = 17
      Width = 145
      Height = 17
      Caption = 'Ranking de Vendedores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object primeiro: TLabel
      Left = 14
      Top = 72
      Width = 50
      Height = 15
      Caption = '(1) Lugar:'
    end
    object segundo: TLabel
      Left = 14
      Top = 102
      Width = 50
      Height = 15
      Caption = '(2) Lugar:'
    end
    object terceiro: TLabel
      Left = 14
      Top = 130
      Width = 50
      Height = 15
      Caption = '(3) Lugar:'
    end
  end
  object qry_busca: TFDQuery
    AutoCalcFields = False
    Connection = frm_dm.CONEXAO
    Left = 712
    Top = 16
  end
end
