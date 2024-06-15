
{------------------------------------------------------------------------------}
{ # PostoABC - Constantes  Globais                                             }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}

unit uConstants;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Vcl.StdCtrls, Dialogs;

const
    cIniFile = 'PostoABC.ini';

    {CORES}
    cCadFooter = 90;
    //cCorReadOnly = $00D7D7D7;
    cCorReadOnly = $00E9DACD;
    cCorAtivo = clWhite;
    cFundoPrincipal = $00C7A383;
    cFundoMenu = $00C7A383;
    cFundoCadastro = $00E9DACD;
    cFontePrincipal = $00FAFFF4;
    cCorFoco = clWhite;

    {Constantes de Criptografia}
    CK = 6482;
    CK1 = 30889;
    CK2 = 74358;
    cA = '54A55D31';
    cU = '71F8FEE57163A3D09F8C3D00CBA58F713C396145A229019D25D82652F90344DE01417A2B7C2A8E21DBD34262478600CFF08E3394DE12274D9500D5C5F082B7';
    cMS = '4FE0FB3203E9EB12D65655C876EC72533C445ADA4DACDD43E4CE0C904F7407E60024CCE8E4A1D74F999BA61DBAB26FB8CD4A72D00F7C98';
    cMS2 = '4FE0FB3203E9EB12DBE0AB51195A814370E823FA4D3C9FFFB4359ACA9D92BB9E2B10084CF9F64F6F1F95D335E60B030A6DEC';




implementation

{ TEdit }

end.
