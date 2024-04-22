object frm_pdf: Tfrm_pdf
  Left = 0
  Top = 0
  Caption = 'frm_pdf'
  ClientHeight = 442
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 15
  object RELATORIO1: TRLReport
    Left = -8
    Top = 0
    Width = 794
    Height = 1123
    AllowedBands = [btHeader, btTitle, btColumnHeader, btDetail, btColumnFooter, btSummary, btFooter]
    DataSource = dts_vendas
    DefaultFilter = RLPDFFilter1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand2: TRLBand
      Left = 38
      Top = 78
      Width = 718
      Height = 18
      AfterPrint = RLBand2AfterPrint
      BeforePrint = RLBand2BeforePrint
      object RLDBText1: TRLDBText
        Left = 12
        Top = 4
        Width = 31
        Height = 16
        DataField = 'F_ID'
        DataSource = dts_vendas
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 49
        Top = 4
        Width = 98
        Height = 16
        DataField = 'F_DATAVENDA'
        DataSource = dts_vendas
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 127
        Top = 2
        Width = 92
        Height = 16
        DataField = 'F_VENDEDOR'
        DataSource = dts_vendas
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 327
        Top = 0
        Width = 99
        Height = 16
        Alignment = taRightJustify
        DataField = 'F_VALORDESC'
        DataSource = dts_vendas
        DisplayMask = ',0.00'
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 425
        Top = 2
        Width = 87
        Height = 16
        Alignment = taRightJustify
        DataField = 'F_VALORTOT'
        DataSource = dts_vendas
        DisplayMask = ',0.00'
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 242
        Top = 0
        Width = 108
        Height = 16
        Alignment = taRightJustify
        DataField = 'F_VALORVENDA'
        DataSource = dts_vendas
        DisplayMask = ',0.00'
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 505
        Top = 0
        Width = 96
        Height = 16
        Alignment = taRightJustify
        DataField = 'F_VALORCOMI'
        DataSource = dts_vendas
        DisplayMask = ',0.00'
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 607
        Top = 0
        Width = 94
        Height = 16
        Alignment = taRightJustify
        DataField = 'F_VALORBONI'
        DataSource = dts_vendas
        DisplayMask = ',0.00'
        Text = ''
      end
    end
    object RLLabel1: TRLLabel
      Left = 142
      Top = 8
      Width = 479
      Height = 24
      Caption = 'Relatorio de Vendas por Comiss'#227'o de Vendedores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 40
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel2: TRLLabel
        Left = 18
        Top = 22
        Width = 16
        Height = 16
        Alignment = taCenter
        Caption = 'ID'
      end
      object RLLabel3: TRLLabel
        Left = 66
        Top = 22
        Width = 32
        Height = 16
        Alignment = taCenter
        Caption = 'Data'
      end
      object RLLabel4: TRLLabel
        Left = 127
        Top = 22
        Width = 60
        Height = 16
        Alignment = taCenter
        Caption = 'Vendedor'
      end
      object RLLabel5: TRLLabel
        Left = 293
        Top = 22
        Width = 34
        Height = 16
        Alignment = taCenter
        Caption = 'Valor'
      end
      object RLLabel6: TRLLabel
        Left = 366
        Top = 22
        Width = 60
        Height = 16
        Alignment = taCenter
        Caption = 'Desconto'
      end
      object RLLabel7: TRLLabel
        Left = 455
        Top = 22
        Width = 46
        Height = 16
        Alignment = taCenter
        Caption = 'Liquido'
      end
      object RLLabel8: TRLLabel
        Left = 533
        Top = 22
        Width = 62
        Height = 16
        Alignment = taCenter
        Caption = 'Comiss'#227'o'
      end
      object RLLabel9: TRLLabel
        Left = 627
        Top = 23
        Width = 72
        Height = 16
        Alignment = taCenter
        Caption = 'Bonificacao'
      end
    end
    object RLTOT: TRLBand
      Left = 38
      Top = 96
      Width = 718
      Height = 48
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Visible = False
      AfterPrint = RLTOTAfterPrint
      BeforePrint = RLTOTBeforePrint
      object lbl_valorvenda: TRLLabel
        Left = 266
        Top = 20
        Width = 83
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object lbl_valordesc: TRLLabel
        Left = 348
        Top = 20
        Width = 78
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object lbl_valortot: TRLLabel
        Left = 445
        Top = 20
        Width = 65
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object lbl_valorcomi: TRLLabel
        Left = 521
        Top = 20
        Width = 78
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object lbl_valorboni: TRLLabel
        Left = 670
        Top = 20
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = '0,00'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 144
      Width = 718
      Height = 48
      BandType = btSummary
      BeforePrint = RLBand3BeforePrint
      object lbl_valorvendatot: TRLLabel
        Left = 251
        Top = 20
        Width = 98
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object lbl_valordesctot: TRLLabel
        Left = 333
        Top = 20
        Width = 93
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object lbl_valortottot: TRLLabel
        Left = 431
        Top = 19
        Width = 80
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object lbl_valorcomitot: TRLLabel
        Left = 523
        Top = 20
        Width = 78
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'lbl_valorcomi'
      end
      object lbl_valorbonitot: TRLLabel
        Left = 669
        Top = 20
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = '0,00'
      end
    end
    object lbl_filtro: TRLLabel
      Left = 731
      Top = 37
      Width = 8
      Height = 17
      Alignment = taRightJustify
      Caption = ' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object RLSystemInfo1: TRLSystemInfo
      Left = 730
      Top = 13
      Width = 11
      Height = 16
      Alignment = taRightJustify
      Info = itPageNumber
      Text = ''
    end
    object RLLabel11: TRLLabel
      Left = 693
      Top = 13
      Width = 31
      Height = 16
      Caption = 'Pag:'
    end
  end
  object qry_busca: TFDQuery
    AutoCalcFields = False
    Connection = frm_dm.CONEXAO
    SQL.Strings = (
      'select * from tbl_vendas where f_id < -1')
    Left = 72
    Top = 104
    object qry_buscaF_ID: TIntegerField
      FieldName = 'F_ID'
      Origin = 'F_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qry_buscaF_DATAVENDA: TDateField
      FieldName = 'F_DATAVENDA'
      Origin = 'F_DATAVENDA'
    end
    object qry_buscaF_VENDEDOR: TStringField
      FieldName = 'F_VENDEDOR'
      Origin = 'F_VENDEDOR'
    end
    object qry_buscaF_VALORVENDA: TBCDField
      FieldName = 'F_VALORVENDA'
      Origin = 'F_VALORVENDA'
      Precision = 18
      Size = 2
    end
    object qry_buscaF_VALORDESC: TBCDField
      FieldName = 'F_VALORDESC'
      Origin = 'F_VALORDESC'
      Precision = 18
      Size = 2
    end
    object qry_buscaF_VALORTOT: TBCDField
      FieldName = 'F_VALORTOT'
      Origin = 'F_VALORTOT'
      Precision = 18
      Size = 2
    end
    object qry_buscaF_VALORPERC: TBCDField
      FieldName = 'F_VALORPERC'
      Origin = 'F_VALORPERC'
      Precision = 18
      Size = 2
    end
    object qry_buscaF_VALORCOMI: TBCDField
      FieldName = 'F_VALORCOMI'
      Origin = 'F_VALORCOMI'
      Precision = 18
      Size = 2
    end
    object qry_buscaF_PERBONI: TBCDField
      FieldName = 'F_PERBONI'
      Origin = 'F_PERBONI'
      Precision = 18
      Size = 2
    end
    object qry_buscaF_VALORBONI: TBCDField
      FieldName = 'F_VALORBONI'
      Origin = 'F_VALORBONI'
      Precision = 18
      Size = 2
    end
    object qry_buscaF_COMILIQU: TBCDField
      FieldName = 'F_COMILIQU'
      Origin = 'F_COMILIQU'
      Precision = 18
      Size = 2
    end
  end
  object dts_vendas: TDataSource
    DataSet = qry_busca
    Left = 112
    Top = 112
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 48
    Top = 208
  end
end
