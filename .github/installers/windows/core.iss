#define MyAppName "GoPipeline"
#define MyInstallerName "GoPipelineSetup"
#define MyAppPublisher "Jon Friesen Codes"
#define MyAppURL "https://github.com/jonfriesen/github-actions-pipeline"
#define MyAppContact "https://github.com/jonfriesen"

#define gopipeline "..\bundle\gopipeline.exe"

[Setup]
AppCopyright={#MyAppPublisher}
AppId={#MyAppName}
AppContact={#MyAppContact}
AppComments={#MyAppURL}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
DisableWelcomePage=no
OutputBaseFilename={#MyInstallerName}
Compression=lzma
SolidCompression=yes
WizardImageFile=windows-installer-side.bmp
WizardSmallImageFile=windows-installer-logo.bmp
WizardImageStretch=yes
UninstallDisplayIcon={app}\unins000.exe
SetupIconFile=icon.ico
ChangesEnvironment=true

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: "full"; Description: "Full installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Tasks]
Name: modifypath; Description: "Add gopipeline binaries to &PATH"

[Components]
Name: "GoPipeline"; Description: "GoPipeline for Windows" ; Types: full custom; Flags: fixed

[Files]
Source: "{#gopipeline}"; DestDir: "{app}"; Flags: ignoreversion; Components: "GoPipeline"

[UninstallRun]
Filename: "{app}\gopipeline.exe"; Parameters: "implode"

[Registry]
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName:"GOPIPELINE_INSTALL_PATH"; ValueData:"{app}" ; Flags: preservestringtype uninsdeletevalue;

[Code]
#include "base64.iss"
#include "guid.iss"

function uuid(): String;
var
  dirpath: String;
  filepath: String;
  ansiresult: AnsiString;
begin
  dirpath := ExpandConstant('{userappdata}\GoPipeline');
  filepath := dirpath + '\id.txt';
  ForceDirectories(dirpath);

  Result := '';
  if FileExists(filepath) then
    LoadStringFromFile(filepath, ansiresult);
    Result := String(ansiresult)

  if Length(Result) = 0 then
    Result := GetGuid('');
    StringChangeEx(Result, '{', '', True);
    StringChangeEx(Result, '}', '', True);
    SaveStringToFile(filepath, AnsiString(Result), False);
end;

function WindowsVersionString(): String;
var
  ResultCode: Integer;
  lines : TArrayOfString;
begin
  if not Exec(ExpandConstant('{cmd}'), ExpandConstant('/c wmic os get caption | more +1 > C:\windows-version.txt'), '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then begin
    Result := 'N/A';
    exit;
  end;

  if LoadStringsFromFile(ExpandConstant('C:\windows-version.txt'), lines) then begin
    Result := lines[0];
  end else begin
    Result := 'N/A'
  end;
end;

procedure InitializeWizard;
var
  WelcomePage: TWizardPage;
begin

  WelcomePage := PageFromID(wpWelcome)

  WizardForm.WelcomeLabel2.AutoSize := True;
  
end;

const
  ModPathName = 'modifypath';
  ModPathType = 'user';

function ModPathDir(): TArrayOfString;
begin
  setArrayLength(Result, 1);
  Result[0] := ExpandConstant('{app}');
end;
#include "modpath.iss"

procedure CurStepChanged(CurStep: TSetupStep);
var
  Success: Boolean;
begin
  Success := True;
  if CurStep = ssPostInstall then
  begin
    if IsTaskSelected(ModPathName) then
      ModPath();
  end;
end;
