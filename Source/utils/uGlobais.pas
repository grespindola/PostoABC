
{------------------------------------------------------------------------------}
{ # PostoABC - Vari�veis  Globais                                              }
{ Gustavo Esp�ndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}

unit uGlobais;

interface

var
  gExePath,
  gRelPath,
  gDBPath,
  gDBPort,
  gDBHost : String;

  //Globais de Relatorios
  gTagRelatorio : Integer;
    //Filtros
    gTipoRel, // 1 - Sint�tico ; 2 - Anal�tico
    gStatusVenda // 1 - Fechadas ; 2 - Abertas ; 3 - Canceladas ; 4 - Todas
    : Integer;
    gSemPromissorias : Boolean;
    gCodCliente : Integer;
    gDtVendaIni, gDtVendaFim,
    gDtVencIni, gDtVencFim : TDateTime;
implementation

end.
