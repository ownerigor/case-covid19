object ServiceCasosPaises: TServiceCasosPaises
  Height = 145
  Width = 169
  object mtPesquisa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 48
    object mtPesquisacountry: TStringField
      FieldName = 'country'
    end
    object mtPesquisacases: TIntegerField
      FieldName = 'cases'
    end
    object mtPesquisaconfirmed: TIntegerField
      FieldName = 'confirmed'
    end
    object mtPesquisadeaths: TIntegerField
      FieldName = 'deaths'
    end
    object mtPesquisarecovered: TIntegerField
      FieldName = 'recovered'
    end
    object mtPesquisaupdated_at: TDateTimeField
      FieldName = 'updated_at'
    end
  end
end
