unit uUtils.Python;

interface

uses
  PythonEngine, System.SysUtils;

Type
   TUtilsPython = Class
     Private
     Protected
     Public
     Class function ExecuteScript(Script : String) : String;
   End;

var
  GlPythonEngine: TPythonEngine;

procedure InitializePythonEngine;
Function GetPythonEngine(DllName: String = 'python39.dll'): TPythonEngine;


implementation

Function GetPythonEngine(DllName: String): TPythonEngine;
Begin
  if not Assigned(GlPythonEngine) then
  begin
    GlPythonEngine := TPythonEngine.Create(nil);
  end;

  GlPythonEngine.DllName := DllName; // Aseg�rate de usar la versi�n correcta de Python

  If Not GlPythonEngine.Initialized then
    GlPythonEngine.LoadDll;

  Result := GlPythonEngine;
End;

procedure InitializePythonEngine;
begin
  if not Assigned(GlPythonEngine) then
  begin
    GlPythonEngine := TPythonEngine.Create(nil);
  end;
end;

{ TPythonUtils }

class function TUtilsPython.ExecuteScript(Script: String): String;
// En esta funci�n el script debe retornar el resultado en una variable llamada result
var
  PyEngine : TPythonEngine;
  PyModule: TPythonModule;
  PyResult: PPyObject;
begin

  PyEngine := GetPythonEngine; //Obtiene el engine global

  try
    // Crear el m�dulo de Python
    PyModule := TPythonModule.Create(nil);
    PyModule.Engine := PyEngine;
    PyModule.ModuleName := 'mymodule';

    // Ejecutar el script de Python
    PyEngine.ExecString(Script);

    // Obtener el resultado de la ejecuci�n
    PyResult := PyEngine.EvalString('result');

    // Convertir el resultado a una cadena
    Result := PyEngine.PyObjectAsString(PyResult);

    // Decrementar la referencia del objeto Python
    PyEngine.Py_DecRef(PyResult);
  Except
    On E: Exception do
    Begin
      Result := E.Message;
    End;
  end;
end;

initialization

InitializePythonEngine;

finalization

FreeAndNil(GlPythonEngine);

end.
