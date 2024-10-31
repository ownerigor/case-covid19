object FrmCasosPaises: TFrmCasosPaises
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Casos por pa'#237'ses'
  ClientHeight = 673
  ClientWidth = 996
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 996
    Height = 673
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object grdResultado: TDBGrid
      Left = 0
      Top = 105
      Width = 996
      Height = 568
      Align = alClient
      DataSource = dsPesquisa
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'country'
          Title.Caption = 'Pa'#237's'
          Width = 286
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cases'
          Title.Caption = 'Casos'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'confirmed'
          Title.Caption = 'Confirmados'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deaths'
          Title.Caption = 'Mortos'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Recuperados'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Atualizado em'
          Width = 199
          Visible = True
        end>
    end
    object pnlFiltros: TPanel
      Left = 0
      Top = 0
      Width = 996
      Height = 105
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 12
        Width = 21
        Height = 15
        Caption = 'Pa'#237's'
      end
      object Label2: TLabel
        Left = 421
        Top = 12
        Width = 64
        Height = 15
        Caption = 'Ordenar por'
      end
      object Label3: TLabel
        Left = 151
        Top = 12
        Width = 101
        Height = 15
        Caption = 'N'#250'mero de mortos'
      end
      object Label6: TLabel
        Left = 285
        Top = 12
        Width = 130
        Height = 15
        Caption = 'N'#250'mero de confirmados'
      end
      object Label4: TLabel
        Left = 207
        Top = 36
        Width = 16
        Height = 15
        Caption = 'at'#233
      end
      object Label5: TLabel
        Left = 341
        Top = 36
        Width = 16
        Height = 15
        Caption = 'at'#233
      end
      object btnFiltrar: TButton
        Left = 572
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 0
        OnClick = btnFiltrarClick
      end
      object edtPaisFiltro: TEdit
        Left = 24
        Top = 33
        Width = 121
        Height = 23
        TabOrder = 1
      end
      object cbxOrdenacaoFiltro: TComboBox
        Left = 421
        Top = 33
        Width = 145
        Height = 23
        TabOrder = 2
        Items.Strings = (
          'Casos confirmados'
          'Mortes'
          'Recuperados')
      end
      object edtMortosMin: TEdit
        Left = 151
        Top = 33
        Width = 50
        Height = 23
        TabOrder = 3
      end
      object edtMortosMax: TEdit
        Left = 229
        Top = 33
        Width = 50
        Height = 23
        TabOrder = 4
      end
      object edtConfirmadosMax: TEdit
        Left = 363
        Top = 33
        Width = 50
        Height = 23
        TabOrder = 5
      end
      object edtConfirmadosMin: TEdit
        Left = 285
        Top = 33
        Width = 50
        Height = 23
        TabOrder = 6
      end
    end
  end
  object dsPesquisa: TDataSource
    Left = 792
    Top = 560
  end
end
