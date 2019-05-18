object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Obliczanie r'#243'wna'#324' nielinowych'
  ClientHeight = 459
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioButton1: TRadioButton
    Left = 32
    Top = 192
    Width = 153
    Height = 33
    Caption = 'Metoda po'#322'owienia'
    TabOrder = 0
  end
  object RadioButton2: TRadioButton
    Left = 32
    Top = 231
    Width = 153
    Height = 34
    Caption = 'Metoda siecznych'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 104
    Top = 147
    Width = 208
    Height = 21
    TabOrder = 2
    Text = '*.dll'
  end
  object Edit2: TEdit
    Left = 110
    Top = 336
    Width = 202
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 415
    Top = 260
    Width = 81
    Height = 56
    Caption = 'Wylicz'
    TabOrder = 4
    OnClick = Button1Click
  end
  object RadioButton3: TRadioButton
    Left = 32
    Top = 271
    Width = 153
    Height = 34
    Caption = 'Metoda regula-falsi'
    TabOrder = 5
  end
  object StaticText1: TStaticText
    Left = 32
    Top = 336
    Width = 37
    Height = 17
    Caption = 'Wynik:'
    TabOrder = 6
  end
  object StaticText2: TStaticText
    Left = 32
    Top = 363
    Width = 28
    Height = 17
    Caption = 'fatx:'
    TabOrder = 7
  end
  object Edit3: TEdit
    Left = 110
    Top = 363
    Width = 202
    Height = 21
    TabOrder = 8
  end
  object StaticText3: TStaticText
    Left = 32
    Top = 390
    Width = 17
    Height = 17
    Caption = 'st:'
    TabOrder = 9
  end
  object Edit4: TEdit
    Left = 110
    Top = 390
    Width = 337
    Height = 21
    TabOrder = 10
  end
  object StaticText4: TStaticText
    Left = 32
    Top = 417
    Width = 72
    Height = 17
    Caption = 'Liczba iteracji:'
    TabOrder = 11
  end
  object Edit5: TEdit
    Left = 110
    Top = 417
    Width = 337
    Height = 21
    TabOrder = 12
  end
  object StaticText5: TStaticText
    Left = 75
    Top = 151
    Width = 23
    Height = 17
    Caption = 'Plik:'
    TabOrder = 13
  end
  object Edit6: TEdit
    Left = 228
    Top = 271
    Width = 57
    Height = 21
    TabOrder = 14
    Text = '1'
  end
  object StaticText6: TStaticText
    Left = 208
    Top = 248
    Width = 51
    Height = 17
    Caption = 'Przedzia'#322':'
    TabOrder = 15
  end
  object Edit7: TEdit
    Left = 228
    Top = 298
    Width = 57
    Height = 21
    TabOrder = 16
    Text = '2'
  end
  object StaticText7: TStaticText
    Left = 208
    Top = 271
    Width = 14
    Height = 17
    Caption = 'a:'
    TabOrder = 17
  end
  object StaticText8: TStaticText
    Left = 208
    Top = 304
    Width = 14
    Height = 17
    Caption = 'b:'
    TabOrder = 18
  end
  object Button2: TButton
    Left = 318
    Top = 144
    Width = 123
    Height = 28
    Caption = 'Wczytaj funkcj'#281' z DLL'
    TabOrder = 19
    OnClick = Button2Click
  end
  object FileListBox1: TFileListBox
    Left = 247
    Top = 22
    Width = 200
    Height = 101
    FileEdit = Edit1
    ItemHeight = 13
    Mask = '*.dll'
    TabOrder = 20
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 32
    Top = 22
    Width = 193
    Height = 101
    FileList = FileListBox1
    TabOrder = 21
  end
  object Panel1: TPanel
    Left = 233
    Top = 174
    Width = 177
    Height = 68
    TabOrder = 22
    object RadioButton6: TRadioButton
      Left = 15
      Top = 8
      Width = 186
      Height = 17
      Caption = 'Arytmetyka liczbowa'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton6Click
    end
    object RadioButton4: TRadioButton
      Left = 15
      Top = 40
      Width = 186
      Height = 17
      Caption = 'Arytmetyka przedzia'#322'owa'
      TabOrder = 1
      OnClick = RadioButton4Click
    end
  end
  object Edit8: TEdit
    Left = 318
    Top = 271
    Width = 66
    Height = 21
    TabOrder = 23
    Visible = False
  end
  object Edit9: TEdit
    Left = 318
    Top = 298
    Width = 66
    Height = 21
    TabOrder = 24
    Visible = False
  end
  object StaticText9: TStaticText
    Left = 304
    Top = 271
    Width = 8
    Height = 17
    Caption = ';'
    TabOrder = 25
    Visible = False
  end
  object StaticText10: TStaticText
    Left = 304
    Top = 298
    Width = 8
    Height = 17
    Caption = ';'
    TabOrder = 26
    Visible = False
  end
  object Edit10: TEdit
    Left = 326
    Top = 336
    Width = 195
    Height = 21
    TabOrder = 27
    Text = 'Edit10'
  end
  object Edit11: TEdit
    Left = 326
    Top = 363
    Width = 195
    Height = 21
    TabOrder = 28
    Text = 'Edit10'
  end
end
