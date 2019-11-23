{ /*
  MIT License

  Copyright (c) 2014-2019 Wuping Xin
  https://github.com/wxinix
  xinwuping007@gmail.com
  Initially created by Wuping Xin on 2014-03-08 22:42:46

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
  */ }

unit ANGConProxie;

interface

uses
  AAPI_Util;

const
  INTEGER_TYPE      = 1;
  DOUBLE_TYPE       = 2;
  STRING_TYPE       = 3;
  EXTERNAL_TEMPORAL = 0;
  INTERNAL_         = 1;
  EXTERNAL_         = 2;
  ESONONE           = 0;
  ESOCANCEL         = 1;
  ESOREWIND         = 2;
  ESOSTOP           = 3;
  ESOSTOPAT         = 4;

function ANGConnGetReplicationId: Cardinal; cdecl; external A2KERNEL_DLL;

function ANGConnGetExperimentId: Cardinal; cdecl; external A2KERNEL_DLL;

function ANGConnGetScenarioId: Cardinal; cdecl; external A2KERNEL_DLL;

function ANGConnGetObjectId(const aName: PChar; aDeleteUShortName: Boolean)
  : Integer; cdecl; external A2KERNEL_DLL; deprecated;

function ANGConnGetObjectIdByType(const aName: PChar; const aTypeName: PChar;
  aDeleteUShortName: Boolean): Integer; cdecl; external A2KERNEL_DLL;

function ANGConnGetObjectName(aObjectID: Integer): PChar; cdecl;
  external A2KERNEL_DLL;

procedure ANGConnHideObject(aObjectID: Integer; aHide: Boolean); cdecl;
  external A2KERNEL_DLL;

function ANGConnIsObjectHidden(aObjectID: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function ANGConnGetScenarioTime: PChar; cdecl; external A2KERNEL_DLL;

function ANGConnGetAttribute(aInternalAttrName: PChar): Pointer; cdecl;
  external A2KERNEL_DLL;

function ANGConnCreateAttribute(aTypeName: PChar; aInternalAttrName: PChar;
  aExternalName: PChar; aAttrType: Integer; aColumnType: Integer = EXTERNAL_)
  : Pointer; cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueString(aAttr: Pointer; aObjectID: Integer;
  aValue: PChar); cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueString(aAttr: Pointer; aObjectID: Integer)
  : PChar; cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueBool(aAttr: Pointer; aObjectID: Integer;
  aValue: Boolean); cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueBool(aAttr: Pointer; aObjectID: Integer)
  : Boolean; cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueInt(aAttr: Pointer; aObjectID: Integer;
  aValue: Integer); cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueInt(aAttr: Pointer; aObjectID: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueDouble(aAttr: Pointer; aObjectID: Integer;
  aValue: Double); cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueDouble(aAttr: Pointer; aObjectID: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

procedure ANGConnActivatePolicy(aObjectID: Integer); cdecl;
  external A2KERNEL_DLL;

procedure ANGConnDeactivatePolicy(aObjectID: Integer); cdecl;
  external A2KERNEL_DLL;

function ANGConnIsPolicyActive(aObjectID: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function ANGConnGetTimeSeriesSize(aAttr: Pointer; aObjectID: Cardinal): Integer;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetTimeSeriesValue(aAttr: Pointer; aObjectID: Cardinal;
  aPos: Cardinal): Double; cdecl; external A2KERNEL_DLL;

procedure ANGConnSetText(aObjectID: Cardinal; aText: PChar); cdecl;
  external A2KERNEL_DLL;

procedure ANGConnMarkActivatePolicy(aObjectID: Cardinal;
  aValue: Boolean); cdecl; external A2KERNEL_DLL;

procedure ANGConnInitPolicies; cdecl; external A2KERNEL_DLL;

function ANGConnVehGetGKSimVehicleId(aVehID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

procedure ANGConnEnableVehiclesInBatch(aValue: Boolean); cdecl;
  external A2KERNEL_DLL;

function ANGGetSimulationOrder(var aWhen: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

procedure ANGSetSimulationOrder(aOrder, aWhen: Integer); cdecl;
  external A2KERNEL_DLL;

implementation

end.
