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

unit CIProxie;

interface

uses
  AAPI_Util;

function ECIGetNumberJunctions: Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetJunctionId(AIndex: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetJunctionName(AJunctionId: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

function ECIGetNumberSignalGroups(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetLogicalNameofSignalGroup(
  AJunctionId: Integer;
  ASignalGroupId: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

function ECIGetExternalIdofSignalGroup(
  AJunctionId: Integer;
  ASignalGroupId: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

function ECIGetAimsunIdofSignalGroup(
  AJunctionId: Integer;
  ASignalGroupId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetJunctionIdFromExternalId(const aExternalId: PChar)
  : Integer;

  cdecl; external A2KERNEL_DLL;

function ECIGetNumberTurningsofSignalGroup(
  AJunctionId: Integer;
  ASignalGroupId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetFromToofTurningofSignalGroup(
  AJunctionId: Integer;
  ASignalGroupId: Integer;
  AIndexTuring: Integer;
  var AFrom: Integer;
  var ATo: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetSignalGroupGreenDuration(
  AJunctionId: Integer;
  ASignalPos: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetSignalGroupYellowDuration(
  AJunctionId: Integer;
  ASignalPos: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetSignalGroupRedDuration(
  AJunctionId: Integer;
  ASignalPos: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentPhase(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentPhaseInRing(
  AJunctionId: Integer;
  ARing: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentTimeInCycle(
  AJunctionId: Integer;
  ARing: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNumberPhases(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNumberPhasesInRing(
  AJunctionId: Integer;
  ARing: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetStartingTimePhase(AJunctionId: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIGetStartingTimePhaseInRing(
  AJunctionId: Integer;
  ARing: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIGetDurationsPhase(
  AJunctionId: Integer;
  APhaseId: Integer;
  ATimeSta: Double;
  var ADur: Double;
  var AMax: Double;
  var AMin: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetYellowTimePhase(
  AJunctionId: Integer;
  APhaseId: Integer;
  ATimeSta: Double;
  var AYellowTime: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECISetYellowTimePhase(
  AJunctionId: Integer;
  APhaseId: Integer;
  ATimeSta: Double;
  AYellowTime: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIIsAnInterPhase(
  AJunctionId: Integer;
  APhaseId: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNbActiveControls: Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetActiveControls(var AActiveControls: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIdisableBusPreemptionNode(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIEnableBusPreemptionNode(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIIsBusPreemptionNodeEnabled(AJunctionId: Integer)
  : Boolean;
  cdecl; external A2KERNEL_DLL;

function ECIGetNbPreemptionSets(
  AJunctionId: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetParameters(
  AJunctionId: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ADelay: Double;
  var AMinDwell: Double;
  var AReserve: Double;
  var AInhibit: Double;
  var AMaxDwell: Double;
  var AType: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetLines(
  AJunctionId: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANumLines: Integer;
  ALines: PInteger)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetNbPhases(
  AJunctionId: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetPhases(
  AJunctionId: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANumPhases: Integer;
  APhases: PInteger)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetNbRequestDetectors(
  AJunction: Integer;
  ATimeSta: Double;
  AIndex: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetRequestDetectors(
  AJunctionId: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANumDetectors: Integer;
  ADetectors: PInteger)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetNbEndDetectors(
  AJunction: Integer;
  ATimeSta: Double;
  AIndex: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetPreemptionSetEndDetectors(
  AJunctionId: Integer;
  ATimeSta: Double;
  AIndex: Integer;
  var ANbDetectors: Integer;
  ADetectors: PInteger)
  : Integer;

  cdecl; external A2KERNEL_DLL;

function ECIGetNumSignalGroupsPhaseofJunction(
  AJunctionId: Integer;
  APhaseId: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetSignalGroupPhaseofJunction(
  AJunctionId: Integer;
  APhaseId: Integer;
  AIndexSG: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeColorSignalGroupPhaseofJunction(
  AJunctionId: Integer;
  APhaseId: Integer;
  ASGIndex: Integer;
  AState: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetControlType(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetYellowTime(AJunctionId: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIGetOffset(AJunctionId: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIdisableEvents(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIEnableEvents(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIEnableEventsActivatingPhase(
  AJunctionId: Integer;
  AIdPhaseToActivateNow: Integer;
  AExpiredTime: Double;
  ACurrentTime: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIIsEventsEnabled(AJunctionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeDirectPhase(
  AJunctionId: Integer;
  APhaseId: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double;
  AExpiredTime: Double = 0.0)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeDirectPhaseWithInterphaseTransition(
  AJunctionId: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeTimingPhase(
  AJunctionId: Integer;
  APhaseId: Integer;
  ANewTime: Double;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeSignalGroupState(
  AJunctionId: Integer;
  ASignalGroupId: Integer;
  AState: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeSignalGroupStateToYellow(
  AJunctionId: Integer;
  ASignalGroupId: Integer;
  AState: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double;
  AGreenTime: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentStateofSignalGroup(
  AJunctionId: Integer;
  ASignalGroupId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeSignalGroupStatebyName(
  AJunctionId: Integer;
  ASignalGroupName: PChar;
  AState: Integer;
  ATimeSta: Double;
  ATime: Double;
  ASimStep: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentStateofSignalGroupbyName(
  AJunctionId: Integer;
  ASignalGroupName: PChar)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetTypeControlofJunction(
  AElemControl: Integer;
  AJunction: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNbPhasesofJunction(
  AElemControl: Integer;
  AJunction: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetControlCycleofJunction(
  AElemControl: Integer;
  AJunction: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNbRingsJunction(
  AElemControl: Integer;
  AJunction: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNbBarriersJunction(
  AElemControl: Integer;
  AJunction: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNumberPhasesInRingofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  ARing: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetDurationsPhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseId: Integer;
  var AMax: Double;
  var ADur: Double;
  var AMin: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetYellowTimeofJunction(
  AElemControl: Integer;
  AJunction: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIGetYellowTimePhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseId: Integer;
  ATimeSta: Double;
  var AYellow: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECISetYellowTimePhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseId: Integer;
  AYellow: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIIsAnInterPhaseofJunction(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetActuatedParamsPassageTime(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer;
  var APassageTime: Double;
  var ATimeBeforeReduce: Double;
  var ATimeToReduce: Double;
  var AMinimumGap: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECISetActuatedParamsPassageTime(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer;
  APassageTime: Double;
  ATimeBeforeReduce: Double;
  ATimeToReduce: Double;
  AMinimumGap: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetActuatedParamsMinimumGreen(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer;
  var AMinDurationMinGreen: Double;
  var AMaxMinGreen: Double;
  var ASecActuation: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECISetActuatedParamsMinimumGreen(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer;
  AMinDurationMinGreen: Double;
  AMaxMinGreen: Double;
  ASecActuation: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetActuatedParamsMaxGreen(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECISetActuatedParamsMaxGreen(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer;
  AMaxDuration: Double)
  : Integer;

  cdecl; external A2KERNEL_DLL;

function ECIGetActuatedParamsForceOFFPermissivePeriod(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer;
  var AForceOFF: Double;
  var APermissivePeriodFrom: Double;
  var APermissivePeriodTo: Double)
  : Integer;

  cdecl; external A2KERNEL_DLL;

function ECISetActuatedParamsForceOFFPermissivePeriod(
  AElemControl: Integer;
  AJunctionId: Integer;
  APhaseId: Integer;
  AForceOFF, APermissivePeriodFrom,
  APermissivePeriodTo: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIetExternalCall(
  AElemControl: Integer;
  AJunction: Integer;
  APhaseId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentNbRingsJunction(AJunction: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentNbBarriersJunction(AJunction: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

type
  StructA2KMetering = record
    Report: Integer;
    Id: Integer;
    SectionId: Integer;
    FirstLaneId: Integer;
    LastLaneId: Integer;
    MeteringType: Integer;
    Distance: Double;
    Name: PChar;
    Platoon: Integer;
  end;

function ECIGetMeteringProperties(AElement: Integer)
  : StructA2KMetering;
  cdecl; external A2KERNEL_DLL;

function ECIGetMeteringPropertiesById(AMeteringId: Integer)
  : StructA2KMetering;

  cdecl; external A2KERNEL_DLL;

function ECIGetNumberMeterings: Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetMeteringIdSection(AElem: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetMeteringName(ASectionId: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

function ECIGetMeteringId(ASectionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetMeteringIdByPos(
  ASectionId: Integer;
  AMetPos: Double)
  : Integer;

  cdecl; external A2KERNEL_DLL;

function ECIGetTypeMetering(ASectionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersGreenMetering(
  ASectionId: Integer;
  ATimeSta: Double;
  var AMax: Double;
  var AGreenTime: Double;
  var AMin: Double;
  var ACycleTime: Double;
  var AOffset: Double;
  var AYellowTime: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersGreenMetering(
  AIdSection: Integer;
  ATimeSta: Double;
  AMax: Double;
  AGreenTime: Double;
  AMin: Double;
  ACycleTime: Double;
  AOffset: Double;
  AYellowTime: Double;
  ACurrentTime: Double;
  ACurrentTimeTrans: Double;
  ASimStep: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersFlowMetering(
  ASectionId: Integer;
  ATimeSta: Double;
  var AMax, aFlow, AMin: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersFlowMetering(
  AIdSection: Integer;
  ATimeSta: Double;
  AMax: Double;
  aFlow: Double;
  AMin: Double;
  ACurrentTime: Double;
  ACycle: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersDelayMetering(
  ASectionId: Integer;
  ATimeSta: Double;
  var AAvg, aDev: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersDelayMetering(
  ASectionId: Integer;
  TimeSta: Double;
  AAvg, aDev: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIdisableEventsMetering(ASectionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIEnableEventsMetering(ASectionId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeStateMetering(
  ASectionId: Integer;
  AState: Integer;
  ATime: Double;
  ASimStep: Double;
  AIdentity: Integer = 0)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentStateofMetering(
  AArcId: Integer;
  AIdentity: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetMeteringIdByPosition(AElem: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetMeteringNameById(AMeteringId: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

function ECIGetTypeMeteringById(AMeteringId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersGreenMeteringById(
  AMeteringId: Integer;
  ATimeSta: Double;
  var AMax, AGreenTime, AMin, aCircleTime, AOffset,
  AYellowTime: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersGreenMeteringById(
  AIdMetering: Integer;
  ATimeSta, AMax, AGreenTime, AMin, ACycleTime, AOffset, AYellowTime,
  ACurrentTime, ACurrentTimeTrans, ASimStep: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersGreenMeteringByLaneById(
  AMeteringId: Integer;
  ATimeSta: Double;
  var AMax, AGreenTime, AMin, aCircleTime, AOffset,
  AYellowTime, aLaneOffset: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersGreenMeteringByLaneById(
  AIdMetering: Integer;
  ATimeSta: Double;
  AMax: Double;
  AGreenTime: Double;
  AMin: Double;
  ACycleTime: Double;
  AOffset: Double;
  AYellowTime: Double;
  aLaneOffset: Double;
  ACurrentTime: Double;
  ACurrentTimeTrans: Double;
  ACycle: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersFlowMeteringById(
  AMeteringId: Integer;
  ATimeSta: Double;
  var AMax, aFlow, AMin: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersFlowMeteringById(
  AIdMetering: Integer;
  ATimeSta: Double;
  AMax: Double;
  aFlow: Double;
  AMin: Double;
  ACurrentTime: Double;
  ACycle: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersDelayMeteringById(
  AMeteringId: Integer;
  ATimeSta: Double;
  var AAvg, aDev: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetParametersFlowAlineaMeteringById(
  AMeteringId: Integer;
  ATimeSta: Double;
  var AMax, aFlow, AMin, aKr, aOStr, aIntervalUpdate: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersFlowAlineaMeteringById(
  AIdMetering: Integer;
  ATimeSta: Double;
  AMax: Double;
  aFlow: Double;
  AMin: Double;
  aKr: Double;
  AOStar: Double;
  aIntervalUpdate: Double;
  ACurrentTime: Double;
  ACycle: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersDelayMeteringById(
  AMeteringId: Integer;
  ATimeSta: Double;
  ANewAvg, aNewDev: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIdisableEventsMeteringById(AMeteringId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIEnableEventsMeteringById(AMeteringId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeStateMeteringById(
  AMeteringId: Integer;
  AState: Integer;
  ATime, ASimStep: Double;
  AIdentity: Integer = 0;
  ATimePorportion: Double = 0.0)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetCurrentStateofMeteringById(
  AMeteringId: Integer;
  ALaneId: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNumberofControls: Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNameofControl(AElemControl: Integer)
  : PChar;
  cdecl; external A2KERNEL_DLL;

function ECIGetIniTimeofControl(AElemControl: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIGetOffsetofControl(AElemControl: Integer)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIGetNameCurrentControl: PChar;
  cdecl; external A2KERNEL_DLL;

function ECIGetNumberCurrentControl: Integer;
  cdecl; external A2KERNEL_DLL;

function ECIRemoveControl(AElemControl: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIGetNumberSem(
  AArcId, aEntId: Integer;
  ATimeSta: Double)
  : Integer;

  cdecl; external A2KERNEL_DLL;

function ECIGetPositionSem(
  AArcId, aEntId, aNumSum: Integer;
  ATimeSta: Double)
  : Double;
  cdecl; external A2KERNEL_DLL;

function ECIGetStateSem(
  AArcId, aEntId, aNumSum: Integer;
  ATimeSta: Double)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersDelayMeteringVehTypeById(
  AIdMetering: Integer;
  ATimeSta: Double;
  ANewAvg: Double;
  aNewDev: Double;
  AVehTypePos: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

function ECIChangeParametersDelayMeteringVehType(
  AIdSection: Integer;
  ATimeSta: Double;
  ANewAvg: Double;
  aNewDev: Double;
  AVehTypePos: Integer)
  : Integer;
  cdecl; external A2KERNEL_DLL;

implementation

end.
