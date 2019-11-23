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

unit CIProxie;

interface

uses
  AAPI_Util;

function ECIGetNumberJunctions: Integer; cdecl; external ACONTROL_DLL;

function ECIGetJunctionId(aIndex: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetJunctionName(aJunctionID: Integer): PChar; cdecl;
  external ACONTROL_DLL;

function ECIGetNumberSignalGroups(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetLogicalNameofSignalGroup(aJunctionID: Integer;
  aSignalGroupID: Integer): PChar; cdecl; external ACONTROL_DLL;

function ECIGetExternalIdofSignalGroup(aJunctionID: Integer;
  aSignalGroupID: Integer): PChar; cdecl; external ACONTROL_DLL;

function ECIGetAimsunIdofSignalGroup(aJunctionID: Integer;
  aSignalGroupID: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetJunctionIdFromExternalId(const aExternalId: PChar): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberTurningsofSignalGroup(aJunctionID: Integer;
  aSignalGroupID: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetFromToofTurningofSignalGroup(aJunctionID: Integer;
  aSignalGroupID: Integer; aIndexTuring: Integer; var aFrom: Integer;
  var aTo: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupGreenDuration(aJunctionID: Integer;
  aSignalPos: Integer; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupYellowDuration(aJunctionID: Integer;
  aSignalPos: Integer; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupRedDuration(aJunctionID: Integer; aSignalPos: Integer;
  aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentPhase(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetCurrentPhaseInRing(aJunctionID: Integer; aRing: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentTimeInCycle(aJunctionID: Integer; aRing: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetNumberPhases(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetNumberPhasesInRing(aJunctionID: Integer; aRing: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetStartingTimePhase(aJunctionID: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIGetStartingTimePhaseInRing(aJunctionID: Integer; aRing: Integer)
  : Double; cdecl; external ACONTROL_DLL;

function ECIGetDurationsPhase(aJunctionID: Integer; aPhaseId: Integer;
  aTimeSta: Double; var aDur: Double; var aMax: Double; var aMin: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetYellowTimePhase(aJunctionID: Integer; aPhaseId: Integer;
  aTimeSta: Double; var aYellowTime: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECISetYellowTimePhase(aJunctionID: Integer; aPhaseId: Integer;
  aTimeSta: Double; aYellowTime: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIIsAnInterPhase(aJunctionID: Integer; aPhaseId: Integer;
  aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetNbActiveControls: Integer; cdecl; external ACONTROL_DLL;

function ECIGetActiveControls(var aActiveControls: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIdisableBusPreemptionNode(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableBusPreemptionNode(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIIsBusPreemptionNodeEnabled(aJunctionID: Integer): Boolean; cdecl;
  external ACONTROL_DLL;

function ECIGetNbPreemptionSets(aJunctionID: Integer; aTimeSta: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetParameters(aJunctionID: Integer; aTimeSta: Double;
  aIndex: Integer; var aDelay: Double; var aMinDwell: Double;
  var Reserve: Double; var aInhibit: Double; var aMaxDwell: Double;
  var aType: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetLines(aJunctionID: Integer; aTimeSta: Double;
  aIndex: Integer; var aNbLines: Integer; aLines: PInteger): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetPreemptionSetNbPhases(aJunctionID: Integer; aTimeSta: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetPhases(aJunctionID: Integer; aTimeSta: Double;
  aIndex: Integer; var aNbPhases: Integer; aPhases: PInteger): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetPreemptionSetNbRequestDetectors(aJunction: Integer;
  aTimeSta: Double; aIndex: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetRequestDetectors(aJunctionID: Integer;
  aTimeSta: Double; aIndex: Integer; var aNbDetectors: Integer;
  aDetectors: PInteger): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetNbEndDetectors(aJunction: Integer; aTimeSta: Double;
  aIndex: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetEndDetectors(aJunctionID: Integer; aTimeSta: Double;
  aIndex: Integer; var aNbDetectors: Integer; aDetectors: PInteger): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNbSignalGroupsPhaseofJunction(aJunctionID: Integer;
  aPhaseId: Integer; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupPhaseofJunction(aJunctionID: Integer;
  aPhaseId: Integer; aIndexSG: Integer; aTimeSta: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeColorSignalGroupPhaseofJunction(aJunctionID: Integer;
  aPhaseId: Integer; aSGIndex: Integer; aState: Integer; aTimeSta: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetControlType(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetYellowTime(aJunctionID: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIGetOffset(aJunctionID: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIdisableEvents(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableEvents(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableEventsActivatingPhase(aJunctionID: Integer;
  aIdPhaseToActivateNow: Integer; aExpiredTime: Double; aCurrentTime: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIIsEventsEnabled(aJunctionID: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeDirectPhase(aJunctionID: Integer; aPhaseId: Integer;
  aTimeSta: Double; aTime: Double; aSimStep: Double; aExpiredTime: Double = 0.0)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIChangeDirectPhaseWithInterphaseTransition(aJunctionID: Integer;
  aTimeSta: Double; aTime: Double; aSimStep: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeTimingPhase(aJunctionID: Integer; aPhaseId: Integer;
  aNewTime: Double; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupState(aJunctionID: Integer;
  aSignalGroupID: Integer; aState: Integer; aTimeSta: Double; aTime: Double;
  aSimStep: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupStateToYellow(aJunctionID: Integer;
  aSignalGroupID: Integer; aState: Integer; aTimeSta: Double; aTime: Double;
  aSimStep: Double; aGreenTime: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofSignalGroup(aJunctionID: Integer;
  aSignalGroupID: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupStatebyName(aJunctionID: Integer;
  aSignalGroupName: PChar; aState: Integer; aTimeSta: Double;
  aTime: Double; aSimStep: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofSignalGroupbyName(aJunctionID: Integer;
  aSignalGroupName: PChar): Integer; cdecl; external ACONTROL_DLL;

function ECIGetTypeControlofJunction(aElemControl: Integer; aJunction: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetNbPhasesofJunction(aElemControl: Integer; aJunction: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetControlCycleofJunction(aElemControl: Integer; aJunction: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetNbRingsJunction(aElemControl: Integer; aJunction: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetNbBarriersJunction(aElemControl: Integer; aJunction: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetNumberPhasesInRingofJunction(aElemControl: Integer;
  aJunction: Integer; aRing: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetDurationsPhaseofJunction(aElemControl: Integer;
  aJunction: Integer; aPhaseId: Integer; var aMax: Double; var aDur: Double;
  var aMin: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetYellowTimeofJunction(aElemControl: Integer; aJunction: Integer)
  : Double; cdecl; external ACONTROL_DLL;

function ECIGetYellowTimePhaseofJunction(aElemControl: Integer;
  aJunction: Integer; aPhaseId: Integer; aTimeSta: Double; var aYellow: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECISetYellowTimePhaseofJunction(aElemControl: Integer;
  aJunction: Integer; aPhaseId: Integer; aYellow: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIIsAnInterPhaseofJunction(aElemControl: Integer; aJunction: Integer;
  aPhaseId: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsPassageTime(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer; var aPassageTime: Double;
  var aTimeBeforeReduce: Double; var aTimeToReduce: Double;
  var aMinimumGap: Double): Integer; cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsPassageTime(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer; aPassageTime: Double;
  aTimeBeforeReduce: Double; aTimeToReduce: Double; aMinimumGap: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsMinimumGreen(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer; var aMinDurationMinGreen: Double;
  var aMaxMinGreen: Double; var aSecActuation: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECISetActuatedParamsMinimumGreen(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer; aMinDurationMinGreen: Double;
  aMaxMinGreen: Double; aSecActuation: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetActuatedParamsMaxGreen(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECISetActuatedParamsMaxGreen(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer; aMaxDuration: Double): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsForceOFFPermissivePeriod(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer; var aForceOFF: Double;
  var aPermissivePeriodFrom: Double; var aPermissivePeriodTo: Double): Integer;
  cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsForceOFFPermissivePeriod(aElemControl: Integer;
  aJunctionID: Integer; aPhaseId: Integer; aForceOFF, aPermissivePeriodFrom,
  aPermissivePeriodTo: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIetExternalCall(aElemControl: Integer; aJunction: Integer;
  aPhaseId: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentNbRingsJunction(aJunction: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetCurrentNbBarriersJunction(aJunction: Integer): Integer; cdecl;
  external ACONTROL_DLL;

type
  structA2KMetering = packed record
    Report: Integer;
    Id: Integer;
    IdSection: Integer;
    IdFirstLane: Integer;
    IdLastLane: Integer;
    MeteringType: Integer;
    Distance: Double;
    Name: PChar;
    Platoon: Integer;
  end;

function ECIGetMeteringProperties(aElement: Integer): structA2KMetering; cdecl;
  external ACONTROL_DLL;

function ECIGetMeteringPropertiesById(aMeteringId: Integer): structA2KMetering;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberMeterings: Integer; cdecl; external ACONTROL_DLL;

function ECIGetMeteringIdSection(aElem: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetMeteringName(aSectionId: Integer): PChar; cdecl;
  external ACONTROL_DLL;

function ECIGetMeteringId(aSectionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetMeteringIdByPos(aSectionId: Integer; aMetPos: Double): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetTypeMetering(aSectionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetParametersGreenMetering(aSectionId: Integer; aTimeSta: Double;
  var aMax: Double; var aGreenTime: Double; var aMin: Double;
  var aCycleTime: Double; var aOffset: Double; var aYellowTime: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersGreenMetering(aIdSection: Integer; aTimeSta: Double;
  aMax: Double; aGreenTime: Double; aMin: Double; aCycleTime: Double;
  aOffset: Double; aYellowTime: Double; aCurrentTime: Double;
  aCurrentTimeTrans: Double; aSimStep: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetParametersFlowMetering(aSectionId: Integer; aTimeSta: Double;
  var aMax, aFlow, aMin: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersFlowMetering(aIdSection: Integer; aTimeSta: Double;
  aMax: Double; aFlow: Double; aMin: Double; aCurrentTime: Double;
  aCycle: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetParametersDelayMetering(aSectionId: Integer; aTimeSta: Double;
  var aAvg, aDev: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMetering(aSectionId: Integer; TimeSta: Double;
  aAvg, aDev: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIdisableEventsMetering(aSectionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableEventsMetering(aSectionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeStateMetering(aSectionId: Integer; aState: Integer;
  aTime: Double; aSimStep: Double; aIdentity: Integer = 0): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetCurrentStateofMetering(aArcId: Integer; aIdentity: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetMeteringIdByPosition(aElem: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetMeteringNameById(aMeteringId: Integer): PChar; cdecl;
  external ACONTROL_DLL;

function ECIGetTypeMeteringById(aMeteringId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetParametersGreenMeteringById(aMeteringId: Integer;
  aTimeSta: Double; var aMax, aGreenTime, aMin, aCircleTime, aOffset,
  aYellowTime: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersGreenMeteringById(aIdMetering: Integer;
  aTimeSta, aMax, aGreenTime, aMin, aCycleTime, aOffset, aYellowTime,
  aCurrentTime, aCurrentTimeTrans, aSimStep: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetParametersGreenMeteringByLaneById(aMeteringId: Integer;
  aTimeSta: Double; var aMax, aGreenTime, aMin, aCircleTime, aOffset,
  aYellowTime, aLaneOffset: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersGreenMeteringByLaneById(aIdMetering: Integer;
  aTimeSta: Double; aMax: Double; aGreenTime: Double; aMin: Double;
  aCycleTime: Double; aOffset: Double; aYellowTime: Double; aLaneOffset: Double;
  aCurrentTime: Double; aCurrentTimeTrans: Double;
  aCycle: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetParametersFlowMeteringById(aMeteringId: Integer;
  aTimeSta: Double; var aMax, aFlow, aMin: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeParametersFlowMeteringById(aIdMetering: Integer;
  aTimeSta: Double; aMax: Double; aFlow: Double; aMin: Double;
  aCurrentTime: Double;
  aCycle: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetParametersDelayMeteringById(aMeteringId: Integer;
  aTimeSta: Double; var aAvg, aDev: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetParametersFlowAlineaMeteringById(aMeteringId: Integer;
  aTimeSta: Double; var aMax, aFlow, aMin, aKr, aOStr, aIntervalUpdate: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersFlowAlineaMeteringById(aIdMetering: Integer;
  aTimeSta: Double; aMax: Double; aFlow: Double; aMin: Double; aKr: Double;
  aOStar: Double; aIntervalUpdate: Double; aCurrentTime: Double;
  aCycle: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMeteringById(aMeteringId: Integer;
  aTimeSta: Double; aNewAvg, aNewDev: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIdisableEventsMeteringById(aMeteringId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableEventsMeteringById(aMeteringId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeStateMeteringById(aMeteringId: Integer; aState: Integer;
  aTime, aSimStep: Double; aIdentity: Integer = 0;
  aTimePorportion: Double = 0.0): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofMeteringById(aMeteringId: Integer;
  aLaneId: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetNumberofControls: Integer; cdecl; external ACONTROL_DLL;

function ECIGetNameofControl(aElemControl: Integer): PChar; cdecl;
  external ACONTROL_DLL;

function ECIGetIniTimeofControl(aElemControl: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIGetOffsetofControl(aElemControl: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIGetNameCurrentControl: PChar; cdecl; external ACONTROL_DLL;

function ECIGetNumberCurrentControl: Integer; cdecl; external ACONTROL_DLL;

function ECIRemoveControl(aElemControl: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetNumberSem(aArcId, aEntId: Integer; aTimeSta: Double): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetPositionSem(aArcId, aEntId, aNumSum: Integer; aTimeSta: Double)
  : Double; cdecl; external ACONTROL_DLL;

function ECIGetStateSem(aArcId, aEntId, aNumSum: Integer; aTimeSta: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMeteringVehTypeById(aIdMetering: Integer;
  aTimeSta: Double; aNewAvg: Double; aNewDev: Double; aVehTypePos: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIChangeParametersDelayMeteringVehType(aIdSection: Integer;
  aTimeSta: Double; aNewAvg: Double; aNewDev: Double; aVehTypePos: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

implementation

end.
