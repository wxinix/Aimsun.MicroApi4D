{ /*
  MIT License
  Copyright (c) 2014-2020 Wuping Xin

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

function ANGConnGetReplicationId()
  : Cardinal;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetExperimentId()
  : Cardinal;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetScenarioId()
  : Cardinal;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetObjectId(
  const AName: PChar;
  ADeleteUShortName: Boolean)
  : Integer;
  cdecl; external A2KERNEL_DLL; deprecated;

function ANGConnGetObjectIdByType(
  const AName: PChar;
  const ATypeName: PChar;
  ADeleteUShortName: Boolean)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetObjectName(AObjectId: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnHideObject(
  AObjectId: Integer;
  AHide: Boolean);
  cdecl; external A2KERNEL_DLL;

function ANGConnIsObjectHidden(AObjectId: Integer)
  : Boolean;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetScenarioTime()
  : PChar;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetAttribute(AInternalAttrName: PChar)
  : Pointer;
  cdecl; external A2KERNEL_DLL;

function ANGConnCreateAttribute(
  ATypeName: PChar;
  AInternalAttrName: PChar;
  AExternalName: PChar;
  AAttrType: Integer;
  AColumnType: Integer = EXTERNAL_)
  : Pointer;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueString(
  AAttr: Pointer;
  AObjectId: Integer;
  AValue: PChar);
  cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueString(
  AAttr: Pointer;
  AObjectId: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueBool(
  AAttr: Pointer;
  AObjectId: Integer;
  AValue: Boolean);
  cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueBool(
  AAttr: Pointer;
  AObjectId: Integer)
  : Boolean;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueInt(
  AAttr: Pointer;
  AObjectId: Integer;
  AValue: Integer);
  cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueInt(
  AAttr: Pointer;
  AObjectId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnSetAttributeValueDouble(
  AAttr: Pointer;
  AObjectId: Integer;
  AValue: Double);
  cdecl; external A2KERNEL_DLL;

function ANGConnGetAttributeValueDouble(
  AAttr: Pointer;
  AObjectId: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnActivatePolicy(AObjectId: Integer);
  cdecl; external A2KERNEL_DLL;

procedure ANGConnDeactivatePolicy(AObjectId: Integer);
  cdecl; external A2KERNEL_DLL;

function ANGConnIsPolicyActive(AObjectId: Integer)
  : Boolean;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetTimeSeriesSize(
  AAttr: Pointer;
  AObjectId: Cardinal)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ANGConnGetTimeSeriesValue(
  AAttr: Pointer;
  AObjectId: Cardinal;
  APos: Cardinal)
  : Double;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnSetText(
  AObjectId: Cardinal;
  AText: PChar);
  cdecl; external A2KERNEL_DLL;

procedure ANGConnMarkActivatePolicy(
  AObjectId: Cardinal;
  AValue: Boolean);
  cdecl; external A2KERNEL_DLL;

procedure ANGConnInitPolicies;
  cdecl; external A2KERNEL_DLL;

function ANGConnVehGetGKSimVehicleId(AVehId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

procedure ANGConnEnableVehiclesInBatch(AValue: Boolean);
  cdecl; external A2KERNEL_DLL;

function ANGGetSimulationOrder(var aWhen: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

procedure ANGSetSimulationOrder(AOrder, aWhen: Integer);
  cdecl; external A2KERNEL_DLL;

implementation

end.
