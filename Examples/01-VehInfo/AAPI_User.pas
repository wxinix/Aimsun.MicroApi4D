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

unit AAPI_User;

interface

{ Aimsun MicroApi time notations:

  ATime: Absolute simulation time in seconds;
  ATimeSta: Stationary simulation time, in seconds;
  ATimeTrans: Warm-up period, in seconds;
  ASimStep: Simulation step. in seconds.

  For example, a simulation scenario starts at 07:00, with 5 minutes of warm-up
  period, and Aimsun has finished a simulation runtime of 1 minute, with 1
  second as the simulation step. Thus:

  ATime
  = 5*60 + 60
  = 360.0

  ATimeSta
  = 7*3600 +60
  = 25260.0

  ATimeTrans
  = 5*60
  = 300.0

  ASimStep
  = 1.0

  Note by Wuping Xin, 2020-03-15 20:25 PM

  Aimsun offical MicroApi (in C) was poorly designed, lacking in consistent naming
  style with Apis logics completely dis-orgnized. It does not even have minimal
  performance considerations, for example, a lot of its methods pass large struct
  by value, a practice that should be avoided in the first place. This Object Pascal
  porting of Aimsun's original MicroApi cannot fix those fundamental design issues
  but at least with better naming style in terms of the Pascal language.
}

{$REGION 'Initialization Functions'}
/// <summary> Fires when Aimsun loads the MicroApi dll.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPILoad: Integer; cdecl;

/// <summary> Fires when Aimsun is about to start the simulation, i.e., right
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
function AAPIManage(ATime: Double; ATimeSta: Double; ATimeTrans: Double; ASimStep: Double): Integer; cdecl;

/// <summary> Fires at the end of every simulation step.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIPostManage(ATime: Double; ATimeSta: Double; ATimeTrans: Double; ASimStep: Double): Integer; cdecl;
{$ENDREGION}
{$REGION 'Finialization Functions'}
/// <summary> Fires when Aimsun has finished all simulation steps. This should
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
function AAPIEnterVehicle(AVehID: Integer; ASectionID: Integer): Integer; cdecl;

/// <summary> Fires when a vehicle exits its last traveling section.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIExitVehicle(AVehID: Integer; ASectionID: Integer): Integer; cdecl;

/// <summary> Fires when a new pedestrian enters the network.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIEnterPedestrian(APedID: Integer; AOrigCentroid: Integer): Integer; cdecl;

/// <summary> Fires when a pedestrian exits the network.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIExitPedestrian(APedID: Integer; ADestCentroid: Integer): Integer; cdecl;

/// <summary> Fires when a vehicle enters a new section.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIEnterVehicleSection(AVehID: Integer; ASectionID: Integer; ATime: Double): Integer; cdecl;

/// <summary> Fires when a vehicle exits a section.
/// </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIExitVehicleSection(AVehID: Integer; ASectionID: Integer; ATime: Double): Integer; cdecl;

/// <summary> Fires before performing a new round of route choice calculation.
/// Section or turning costs can be modified here based on some user logic.
///  </summary>
/// <returns> Integer, 0 success code; negative error code.
/// </returns>
function AAPIPreRouteChoiceCalculation(ATime: Double; ATimeSta: Double): Integer; cdecl;

{$ENDREGION}

implementation

uses
  System.Classes, System.SysUtils, AKIProxie;

function AAPIEnterVehicle(AVehID: Integer; ASectionID: Integer): Integer;
begin
  Result := 0;
end;

function AAPIEnterVehicleSection(AVehID: Integer; ASectionID: Integer; ATime: Double): Integer;
begin
  Result := 0;
end;

function AAPIExitVehicle(AVehID: Integer; ASectionID: Integer): Integer;
begin
  Result := 0;
end;

function AAPIExitVehicleSection(AVehID: Integer; ASectionID: Integer; ATime: Double): Integer;
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

function AAPIManage(ATime: Double; ATimeSta: Double; ATimeTrans: Double; ASimStep: Double): Integer;
begin
  var numSections := AKIInfNetNbSectionsANG();

  for var I := 0 to numSections - 1 do
  begin
    var secID := AKIInfNetGetSectionANGId(I);
    var numVehs := AKIVehStateGetNbVehiclesSection(secID, True);

    for var J := 0 to numVehs - 1 do
    begin
      var vehInfo := AKIVehStateGetVehicleInfSection(secID, J);
      AKIPrintStringEx(Format('Vehicle %d, Section %d, Lane %d, CurPos %f, CurSpeed %f',
        [
          vehInfo.VehID,
          vehInfo.SectionID,
          vehInfo.LaneID,
          vehInfo.CurrentPos,
          vehInfo.CurrentSpeed
        ]));
    end;
  end;

  var numJunctions := AKIInfNetNbJunctions();

  for var I := 0 to numJunctions - 1 do
  begin
    var junctionID := AKIInfNetGetJunctionId(I);
    var numVehs := AKIVehStateGetNbVehiclesJunction(junctionID);

    for var J := 0 to numVehs - 1 do
    begin
      var vehInfo := AKIVehStateGetVehicleInfJunction(junctionID, J);
      AKIPrintStringEx(Format('Vehicle %d, Node %d, From %d, To %d CurPos %f, CurSpeed %f',
        [
          vehInfo.VehID,
          vehInfo.JunctionID,
          vehInfo.FromSectionID,
          vehInfo.ToSectionID,
          vehInfo.CurrentPos,
          vehInfo.CurrentSpeed
        ]));
    end;
  end;

  Result := 0;
end;

function AAPIPostManage(ATime: Double; ATimeSta: Double; ATimeTrans: Double; ASimStep: Double): Integer;
begin
  Result := 0;
end;

function AAPIPreRouteChoiceCalculation(ATime: Double; ATimeSta: Double): Integer;
begin
  Result := 0;
end;

function AAPIUnLoad: Integer;
begin
  Result := 0;
end;

function AAPIEnterPedestrian(APedID: Integer; AOrigCentroid: Integer): Integer;
begin
  Result := 0;
end;

function AAPIExitPedestrian(APedID: Integer; ADestCentroid: Integer): Integer;
begin
  Result := 0;
end;

end.
