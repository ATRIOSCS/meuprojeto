object frm_relatorio: Tfrm_relatorio
  Left = 0
  Top = 0
  Caption = 'Gerador de PDF de Resultado de Vendas'
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
  object Button1: TButton
    Left = 560
    Top = 168
    Width = 193
    Height = 41
    Caption = 'Gerar PDF'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 32
    Top = 8
    Width = 721
    Height = 138
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 102
      Width = 131
      Height = 17
      Caption = 'Selecione o Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 20
      Width = 83
      Height = 16
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 18
      Top = 59
      Width = 76
      Height = 16
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DTP_DATAINICIO: TDateTimePicker
      Left = 232
      Top = 15
      Width = 186
      Height = 23
      Date = 45401.638766724540000000
      Time = 45401.638766724540000000
      TabOrder = 0
    end
    object DTP_DATAFINAL: TDateTimePicker
      Left = 232
      Top = 56
      Width = 186
      Height = 23
      Date = 45401.638766724540000000
      Time = 45401.638766724540000000
      TabOrder = 1
    end
    object CMB_VENDEDOR: TComboBox
      Left = 232
      Top = 95
      Width = 289
      Height = 23
      TabOrder = 2
      Text = 'Todos'
      Items.Strings = (
        'Todos'
        'Vendedor 01'
        'Vendedor 02'
        'Vendedor 03'
        'Vendedor 04'
        'Vendedor 05'
        'Vendedor 06')
    end
  end
  object btn_imprime: TButton
    Left = 560
    Top = 240
    Width = 193
    Height = 41
    Caption = 'Gerar relatorio Com Preview'
    TabOrder = 2
    OnClick = btn_imprimeClick
  end
end
