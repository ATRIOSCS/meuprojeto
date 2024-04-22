object Frm_pesqcli: TFrm_pesqcli
  Left = 0
  Top = 0
  Caption = 'Painel de Opcoes '
  ClientHeight = 749
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_conexao: TLabel
    Left = 645
    Top = 29
    Width = 67
    Height = 13
    Caption = 'desconectado'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 786
    Height = 753
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Principal'
      object TPanel
        Left = 0
        Top = 684
        Width = 778
        Height = 41
        Align = alBottom
        TabOrder = 0
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 772
        Height = 414
        Align = alTop
        TabOrder = 1
        object SpeedButton2: TSpeedButton
          Left = 15
          Top = 56
          Width = 242
          Height = 65
          Hint = 'Utilize este bot'#227'o para incluir/elaterar ou excluir Clientes'
          Caption = 'Importa'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object btn_relatorios: TSpeedButton
          Left = 15
          Top = 184
          Width = 242
          Height = 68
          Hint = 'Utilize este bot'#227'o para incluir/elaterar ou excluir Clientes'
          Caption = 'Gerar PDF'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_relatoriosClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Tabelas'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 664
        Top = 127
        Width = 91
        Height = 13
        Caption = 'Script de execu'#231#227'o'
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 24
        Width = 1700
        Height = 97
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Button1: TButton
        Left = 16
        Top = 575
        Width = 120
        Height = 25
        Caption = 'Conectar'
        TabOrder = 1
        Visible = False
      end
      object btn_verexiste: TButton
        Left = 16
        Top = 136
        Width = 120
        Height = 25
        Caption = 'Ver Tabelas'
        TabOrder = 2
        OnClick = btn_verexisteClick
      end
      object btn_criar: TButton
        Left = 16
        Top = 167
        Width = 120
        Height = 25
        Caption = 'Cria Tabelas'
        TabOrder = 3
        OnClick = btn_criarClick
      end
      object Button4: TButton
        Left = 16
        Top = 198
        Width = 120
        Height = 26
        Caption = 'Exclui Tabelas'
        TabOrder = 4
        OnClick = Button4Click
      end
      object edt_comando: TEdit
        Left = 16
        Top = 546
        Width = 2000
        Height = 21
        TabOrder = 5
        OnChange = edt_comandoChange
      end
      object btn_comando: TButton
        Left = 16
        Top = 302
        Width = 120
        Height = 26
        Caption = 'Painel Comandos '
        TabOrder = 6
        OnClick = btn_comandoClick
      end
      object Memo1: TMemo
        Left = 474
        Top = 146
        Width = 474
        Height = 358
        Lines.Strings = (
          '     ')
        TabOrder = 7
      end
      object Button2: TButton
        Left = 873
        Top = 502
        Width = 75
        Height = 25
        Caption = 'Limpar Script'
        TabOrder = 8
        OnClick = Button2Click
      end
    end
  end
  object CONEXAO: TFDConnection
    ConnectionName = 'CLIENTES'
    Params.Strings = (
      'Database=C:\testecrud\CLIENTES.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 328
    Top = 56
  end
  object FDQuery1: TFDQuery
    AutoCalcFields = False
    CachedUpdates = True
    Connection = CONEXAO
    Left = 504
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 224
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 688
    Top = 32
  end
end
