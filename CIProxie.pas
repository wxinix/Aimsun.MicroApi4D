{ /*
  MIT License
  Copyright (c) 2014-2021 Wuping Xin

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

unit CIProxie;

interface

uses
  AAPI_Util;

function ECIGetNumberJunctions: Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetJunctionId(
  AIndex: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetJunctionName(
  AJunctionID: Integer
  ): PChar;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberSignalGroups(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetLogicalNameofSignalGroup(
  AJunctionID: Integer;
  ASignalGroupID: Integer
  ): PChar;
  cdecl; external ACONTROL_DLL;

function ECIGetExternalIdofSignalGroup(
  AJunctionID: Integer;
  ASignalGroupID: Integer
  ): PChar;
  cdecl; external ACONTROL_DLL;

function ECIGetAimsunIdofSignalGroup(
  AJunctionID: Integer;
  ASignalGroupID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetJunctionIdFromExternalId(
  const AExternalID: PChar
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberTurningsofSignalGroup(
  AJunctionID: Integer;
  ASignalGroupID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetFromToofTurningofSignalGroup(
  AJunctionID: Integer;
  ASignalGroupID: Integer;
  AIndexTuring: Integer;
  var AFrom: Integer;
  var ATo: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupGreenDuration(
  AJunctionID: Integer;
  ASignalPos: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupYellowDuration(
  AJunctionID: Integer;
  ASignalPos: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupRedDuration(
  AJunctionID: Integer;
  ASignalPos: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentPhase(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentPhaseInRing(
  AJunctionID: Integer;
  ARing: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentTimeInCycle(
  AJunctionID: Integer;
  ARing: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberPhases(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberPhasesInRing(
  AJunctionID: Integer;
  ARing: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetStartingTimePhase(
  AJunctionID: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIGetStartingTimePhaseInRing(
  AJunctionID: Integer;
  ARing: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIGetDurationsPhase(
  AJunctionID: Integer;
  APhaseID: Integer;
  ATimeSta: Double;
  var ADur: Double;
  var AMax: Double;
  var AMin: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetYellowTimePhase(
  AJunctionID: Integer;
  APhaseID: Integer;
  ATimeSta: Double;
  var AYellowTime: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECISetYellowTimePhase(
  AJunctionID: Integer;
  APhaseID: Integer;
  ATimeSta: Double;
  AYellowTime: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIIsAnInterPhase(
  AJunctionID: Integer;
  APhaseID: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNbActiveControls: Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetActiveControls(
  var AActiveControls: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIdisableBusPreemptionNode(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIEnableBusPreemptionNode(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIIsBusPreemptionNodeEnabled(
  AJunctionID: Integer
  ): Boolean;
  cdecl; external ACONTROL_DLL;

function ECIGetNbPreemptionSets(
  AJunctionID: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetParameters(
  AJunctionID: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ADelay: Double;
  var AMinDwell: Double;
  var AReserve: Double;
  var AInhibit: Double;
  var AMaxDwell: Double;
  var AType: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetLines(
  AJunctionID: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANumLines: Integer;
  ALines: PInteger
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetNbPhases(
  AJunctionID: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetPhases(
  AJunctionID: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANumPhases: Integer;
  APhases: PInteger
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetNbRequestDetectors(
  AJunction: Integer;
  ATimeSta: Double;
  AIndex: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetRequestDetectors(
  AJunctionID: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANumDetectors: Integer;
  ADetectors: PInteger
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetNbEndDetectors(
  AJunction: Integer;
  ATimeSta: Double;
  AIndex: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetEndDetectors(
  AJunctionID: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANbDetectors: Integer;
  ADetectors: PInteger
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumSignalGroupsPhaseofJunction(
  AJunctionID: Integer;
  APhaseID: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupPhaseofJunction(
  AJunctionID: Integer;
  APhaseID: Integer;
  AIndexSG: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeColorSignalGroupPhaseofJunction(
  AJunctionID: Integer;
  APhaseID: Integer;
  ASGIndex: Integer;
  AState: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetControlType(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetYellowTime(
  AJunctionID: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIGetOffset(
  AJunctionID: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIDisableEvents(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIEnableEvents(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIEnableEventsActivatingPhase(
  AJunctionID: Integer;
  AIdPhaseToActivateNow: Integer;
  AExpiredTime: Double;
  ACurrentTime: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIIsEventsEnabled(
  AJunctionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeDirectPhase(
  AJunctionID: Integer;
  APhaseID: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double;
  AExpiredTime: Double = 0.0
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeDirectPhaseWithInterphaseTransition(
  AJunctionID: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeTimingPhase(
  AJunctionID: Integer;
  APhaseID: Integer;
  ANewTime: Double;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupState(
  AJunctionID: Integer;
  ASignalGroupID: Integer;
  AState: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupStateToYellow(
  AJunctionID: Integer;
  ASignalGroupID: Integer;
  AState: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double;
  AGreenTime: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofSignalGroup(
  AJunctionID: Integer;
  ASignalGroupID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupStatebyName(
  AJunctionID: Integer;
  ASignalGroupName: PChar;
  AState: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofSignalGroupbyName(
  AJunctionID: Integer;
  ASignalGroupName: PChar
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetTypeControlofJunction(
  AElemControl: Integer;
  AJunction: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNbPhasesofJunction(
  AElemControl: Integer;
  AJunction: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetControlCycleofJunction(
  AElemControl: Integer;
  AJunction: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNbRingsJunction(
  AElemControl: Integer;
  AJunction: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNbBarriersJunction(
  AElemControl: Integer;
  AJunction: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberPhasesInRingofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  ARing: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetDurationsPhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseID: Integer;
  var AMax: Double;
  var ADur: Double;
  var AMin: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetYellowTimeofJunction(
  AElemControl: Integer;
  AJunction: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIGetYellowTimePhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseID: Integer;
  ATimeSta: Double;
  var AYellow: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECISetYellowTimePhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseID: Integer;
  AYellow: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIIsAnInterPhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsPassageTime(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer;
  var APassageTime: Double;
  var ATimeBeforeReduce: Double;
  var ATimeToReduce: Double;
  var AMinimumGap: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsPassageTime(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer;
  APassageTime: Double;
  ATimeBeforeReduce: Double;
  ATimeToReduce: Double;
  AMinimumGap: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsMinimumGreen(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer;
  var AMinDurationMinGreen: Double;
  var AMaxMinGreen: Double;
  var ASecActuation: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsMinimumGreen(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer;
  AMinDurationMinGreen: Double;
  AMaxMinGreen: Double;
  ASecActuation: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsMaxGreen(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsMaxGreen(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer;
  AMaxDuration: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsForceOFFPermissivePeriod(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer;
  var AForceOFF: Double;
  var APermissivePeriodFrom: Double;
  var APermissivePeriodTo: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsForceOFFPermissivePeriod(
  AElemControl: Integer;
  AJunctionID: Integer;
  APhaseID: Integer;
  AForceOFF: Double;
  APermissivePeriodFrom: Double;
  APermissivePeriodTo: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIetExternalCall(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentNbRingsJunction(
  AJunction: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentNbBarriersJunction(
  AJunction: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

type
  StructA2KMetering = record
    Report: Integer;
    ID: Integer;
    SectionID: Integer;
    FirstLaneID: Integer;
    LastLaneID: Integer;
    MeteringType: Integer;
    Distance: Double;
    Name: PChar;
    Platoon: Integer;
  end;

function ECIGetMeteringProperties(
  AElement: Integer
  ): StructA2KMetering;
  cdecl; external ACONTROL_DLL;

function ECIGetMeteringPropertiesById(
  AMeteringID: Integer
  ): StructA2KMetering;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberMeterings: Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetMeteringIdSection(
  AElem: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetMeteringName(
  ASectionID: Integer
  ): PChar;
  cdecl; external ACONTROL_DLL;

function ECIGetMeteringId(
  ASectionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetMeteringIdByPos(
  ASectionID: Integer;
  AMetPos: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetTypeMetering(
  ASectionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersGreenMetering(
  ASectionID: Integer;
  ATimeSta: Double;
  var AMax: Double;
  var AGreenTime: Double;
  var AMin: Double;
  var ACycleTime: Double;
  var AOffset: Double;
  var AYellowTime: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersGreenMetering(
  ASectionID: Integer;
  ATimeSta: Double;
  AMax: Double;
  AGreenTime: Double;
  AMin: Double;
  ACycleTime: Double;
  AOffset: Double;
  AYellowTime: Double;
  ACurrentTime: Double;
  ACurrentTimeTrans: Double;
  ASimStep: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersFlowMetering(
  ASectionID: Integer;
  ATimeSta: Double;
  var AMax, aFlow, AMin: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersFlowMetering(
  ASectionID: Integer;
  ATimeSta: Double;
  AMax: Double;
  aFlow: Double;
  AMin: Double;
  ACurrentTime: Double;
  ACycle: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersDelayMetering(
  ASectionID: Integer;
  ATimeSta: Double;
  var AAvg, aDev: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMetering(
  ASectionID: Integer;
  TimeSta: Double;
  AAvg, aDev: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIdisableEventsMetering(
  ASectionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIEnableEventsMetering(
  ASectionID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeStateMetering(
  ASectionID: Integer;
  AState: Integer;
  ATime: Double;
  ASimStep: Double;
  AIdentity: Integer = 0
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofMetering(
  AArcID: Integer;
  AIdentity: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetMeteringIdByPosition(
  AElem: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetMeteringNameById(
  AMeteringID: Integer
  ): PChar;
  cdecl; external ACONTROL_DLL;

function ECIGetTypeMeteringById(
  AMeteringID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersGreenMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  var AMax: Double;
  var AGreenTime: Double;
  var AMin: Double;
  var ACircleTime: Double;
  var AOffset: Double;
  var AYellowTime: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersGreenMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  AMax: Double;
  AGreenTime: Double;
  AMin: Double;
  ACycleTime: Double;
  AOffset: Double;
  AYellowTime: Double;
  ACurrentTime: Double;
  ACurrentTimeTrans: Double;
  ASimStep: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersGreenMeteringByLaneById(
  AMeteringID: Integer;
  ATimeSta: Double;
  var AMax: Double;
  var AGreenTime: Double;
  var AMin: Double;
  var ACircleTime: Double;
  var AOffset: Double;
  var AYellowTime: Double;
  var ALaneOffset: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersGreenMeteringByLaneById(
  AMeteringID: Integer;
  ATimeSta: Double;
  AMax: Double;
  AGreenTime: Double;
  AMin: Double;
  ACycleTime: Double;
  AOffset: Double;
  AYellowTime: Double;
  ALaneOffset: Double;
  ACurrentTime: Double;
  ACurrentTimeTrans: Double;
  ACycle: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersFlowMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  var AMax: Double;
  var aFlow: Double;
  var AMin: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersFlowMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  AMax: Double;
  AFlow: Double;
  AMin: Double;
  ACurrentTime: Double;
  ACycle: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersDelayMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  var AAvg: Double;
  var aDev: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetParametersFlowAlineaMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  var AMax: Double;
  var aFlow: Double;
  var AMin: Double;
  var AKr: Double;
  var AOStr: Double;
  var AIntervalUpdate: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersFlowAlineaMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  AMax: Double;
  aFlow: Double;
  AMin: Double;
  AKr: Double;
  AOStar: Double;
  AIntervalUpdate: Double;
  ACurrentTime: Double;
  ACycle: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMeteringById(
  AMeteringID: Integer;
  ATimeSta: Double;
  ANewAvg: Double;
  ANewDev: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIdisableEventsMeteringById(
  AMeteringID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIEnableEventsMeteringById(
  AMeteringID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeStateMeteringById(
  AMeteringID: Integer;
  AState: Integer;
  ATime: Double;
  ASimStep: Double;
  AIdentity: Integer = 0;
  ATimePorportion: Double = 0.0
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofMeteringById(
  AMeteringID: Integer;
  ALaneID: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberofControls: Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNameofControl(
  AElemControl: Integer
  ): PChar;
  cdecl; external ACONTROL_DLL;

function ECIGetIniTimeofControl(
  AElemControl: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIGetOffsetofControl(
  AElemControl: Integer
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIGetNameCurrentControl: PChar;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberCurrentControl: Integer;
  cdecl; external ACONTROL_DLL;

function ECIRemoveControl(
  AElemControl: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberSem(
  AArcID: Integer;
  AEntID: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPositionSem(
  AArcID: Integer;
  AEntID: Integer;
  ANumSum: Integer;
  ATimeSta: Double
  ): Double;
  cdecl; external ACONTROL_DLL;

function ECIGetStateSem(
  AArcID: Integer;
  AEntID: Integer;
  ANumSum: Integer;
  ATimeSta: Double
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMeteringVehTypeById(
  AMeteringID: Integer;
  ATimeSta: Double;
  ANewAvg: Double;
  ANewDev: Double;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMeteringVehType(
  ASectionID: Integer;
  ATimeSta: Double;
  ANewAvg: Double;
  ANewDev: Double;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external ACONTROL_DLL;

implementation

end.
