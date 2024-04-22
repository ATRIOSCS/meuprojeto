object frm_dm: Tfrm_dm
  OldCreateOrder = True
  Height = 365
  Width = 743
  object CONEXAO: TFDConnection
    ConnectionName = 'CLIENTES'
    Params.Strings = (
      'Database=C:\testecrud\CLIENTES.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\testecrud\fbembed.dll'
    Embedded = True
    Left = 96
    Top = 16
  end
  object TBL_VENDAS: TFDTable
    Filtered = True
    IndexName = 'XTBL_VENDAS'
    Connection = CONEXAO
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.UpdateTableName = 'TBL_VENDAS'
    TableName = 'TBL_VENDAS'
    Left = 24
    Top = 88
    object TBL_VENDASF_ID: TIntegerField
      FieldName = 'F_ID'
      Origin = 'F_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBL_VENDASF_DATAVENDA: TDateField
      FieldName = 'F_DATAVENDA'
      Origin = 'F_DATAVENDA'
    end
    object TBL_VENDASF_VENDEDOR: TStringField
      FieldName = 'F_VENDEDOR'
      Origin = 'F_VENDEDOR'
    end
    object TBL_VENDASF_VALORVENDA: TBCDField
      FieldName = 'F_VALORVENDA'
      Origin = 'F_VALORVENDA'
      Precision = 18
      Size = 2
    end
    object TBL_VENDASF_VALORDESC: TBCDField
      FieldName = 'F_VALORDESC'
      Origin = 'F_VALORDESC'
      Precision = 18
      Size = 2
    end
    object TBL_VENDASF_VALORTOT: TBCDField
      FieldName = 'F_VALORTOT'
      Origin = 'F_VALORTOT'
      Precision = 18
      Size = 2
    end
    object TBL_VENDASF_VALORPERC: TBCDField
      FieldName = 'F_VALORPERC'
      Origin = 'F_VALORPERC'
      Precision = 18
      Size = 2
    end
    object TBL_VENDASF_VALORCOMI: TBCDField
      FieldName = 'F_VALORCOMI'
      Origin = 'F_VALORCOMI'
      Precision = 18
      Size = 2
    end
    object TBL_VENDASF_PERBONI: TBCDField
      FieldName = 'F_PERBONI'
      Origin = 'F_PERBONI'
      Precision = 18
      Size = 2
    end
    object TBL_VENDASF_VALORBONI: TBCDField
      FieldName = 'F_VALORBONI'
      Origin = 'F_VALORBONI'
      Precision = 18
      Size = 2
    end
    object TBL_VENDASF_COMILIQU: TBCDField
      FieldName = 'F_COMILIQU'
      Origin = 'F_COMILIQU'
      Precision = 18
      Size = 2
    end
  end
  object dts_vendas: TDataSource
    DataSet = TBL_VENDAS
    Left = 96
    Top = 96
  end
end
