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

unit AAPI;

interface

{ Aimsun MicroApi time notations:

  aTime: Absolute simulation time in seconds;
  aTimeSta: Stationary simulation time, in seconds;
  aTimeTrans: Warm-up period, in seconds;
  aSimStep: Simulation step. in seconds.

  For example, a simulation scenario starts at 07:00, with 5 minutes of warm-up
  period, and Aimsun has finished a simulation runtime of 1 minute, with 1
  second as the simulation step. Thus:

  aTime
  = 5*60 + 60
  = 360.0

  aTimeSta
  = 7*3600 +60
  = 25260.0

  aTimeTrans
  = 5*60
  = 300.0

  aSimStep
  = 1.0
}

{$REGION 'Initialization Functions'}
/// <summary> Fires when Aimsun loads the MicroApi dll.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPILoad: Integer; cdecl;

/// <summary> Fires when Aimsunis is about to start the simulation, i.e., right
/// before running the first simulation step. This should be where to put
/// initialization code for the user logic.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIInit: Integer; cdecl;
{$ENDREGION}
{$REGION 'Timestep-wise Functions'}
/// <summary> Fires at the beginning of every simulation step.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIManage(aTime: Double; aTimeSta: Double; aTimeTrans: Double;
  aSimStep: Double): Integer; cdecl;

/// <summary> Fires at the end of every simulation step.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIPostManage(aTime: Double; aTimeSta: Double; aTimeTrans: Double;
  aSimStep: Double): Integer; cdecl;
{$ENDREGION}
{$REGION 'Finialization Functions'}
/// <summary> Fires when Aimsun has finished all simulaton steps. This should
///  be where to put clean-up code of the user logic.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIFinish: Integer; cdecl;

/// <summary> Fires when Aimsun unloads the MicroApi dll.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIUnLoad: Integer; cdecl;
{$ENDREGION}
{$REGION 'Simulation Events'}
/// <summary> Fires when an vehicle enters a boundary section of the network,
///  i.e., the vehicle enters its first travelling section (not the virtual queue
///  if any).
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIEnterVehicle(aVehId: Integer; aSectionId: Integer): Integer; cdecl;

/// <summary> Fires when a vehicle exits its last traveling section.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIExitVehicle(aVehId: Integer; aSectionId: Integer): Integer; cdecl;

/// <summary> Fires when a new pedestrian enters the network.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIEnterPedestrian(aPedId: Integer;
  aOrigCentroid: Integer): Integer; cdecl;

/// <summary> Fires when a pedestrian exits the network.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIExitPedestrian(aPedId: Integer;
  aDestCentroid: Integer): Integer; cdecl;

/// <summary> Fires when a vehicle enters a new section.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIEnterVehicleSection(aVehId: Integer; aSectionId: Integer;
  aTime: Double): Integer; cdecl;

/// <summary> Fires when a vehicle exits a section.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIExitVehicleSection(aVehId: Integer; aSectionId: Integer;
  aTime: Double): Integer; cdecl;

/// <summary> Fires before performing a new round of route choice calculation.
/// Section or turning costs can be modified here based on some user logic.
///  </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIPreRouteChoiceCalculation(aTime: Double;
  aTimeSta: Double): Integer; cdecl;

{$ENDREGION}

implementation

uses
  System.Classes,
  System.SysUtils,
  AKIProxie;

function AAPIEnterVehicle(aVehId: Integer; aSectionId: Integer): Integer;
begin
  Result := 0;
end;

function AAPIEnterVehicleSection(aVehId: Integer; aSectionId: Integer;
  aTime: Double): Integer;
begin
  Result := 0;
end;

function AAPIExitVehicle(aVehId: Integer; aSectionId: Integer): Integer;
begin
  Result := 0;
end;

function AAPIExitVehicleSection(aVehId: Integer; aSectionId: Integer;
  aTime: Double): Integer;
begin
  Result := 0;
end;

function AAPIFinish: Integer;
begin
  Result := 0;
end;

function AAPILoad: Integer;
begin
  Result := 0;
end;

function AAPIInit: Integer;
begin
  Result := 0;
end;

function AAPIManage(aTime: Double; aTimeSta: Double; aTimeTrans: Double;
  aSimStep: Double): Integer;
begin
  Result := 0;
end;

function AAPIPostManage(aTime: Double; aTimeSta: Double; aTimeTrans: Double;
  aSimStep: Double): Integer;
begin
  Result := 0;
end;

function AAPIPreRouteChoiceCalculation(aTime: Double; aTimeSta: Double)
  : Integer;
begin
  Result := 0;
end;

function AAPIUnLoad: Integer;
begin
  Result := 0;
end;

function AAPIEnterPedestrian(aPedId: Integer; aOrigCentroid: Integer): Integer;
begin
  Result := 0;
end;

function AAPIExitPedestrian(aPedId: Integer; aDestCentroid: Integer): Integer;
begin
  Result := 0;
end;

end.
