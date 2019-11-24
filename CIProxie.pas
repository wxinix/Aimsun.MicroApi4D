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

function ECIGetJunctionName(aJunctionId: Integer): PChar; cdecl;
  external ACONTROL_DLL;

function ECIGetNumberSignalGroups(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetLogicalNameofSignalGroup(aJunctionId: Integer;
  aSignalGroupId: Integer): PChar; cdecl; external ACONTROL_DLL;

function ECIGetExternalIdofSignalGroup(aJunctionId: Integer;
  aSignalGroupId: Integer): PChar; cdecl; external ACONTROL_DLL;

function ECIGetAimsunIdofSignalGroup(aJunctionId: Integer;
  aSignalGroupId: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetJunctionIdFromExternalId(const aExternalId: PChar): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNumberTurningsofSignalGroup(aJunctionId: Integer;
  aSignalGroupId: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetFromToofTurningofSignalGroup(aJunctionId: Integer;
  aSignalGroupId: Integer; aIndexTuring: Integer; var aFrom: Integer;
  var aTo: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupGreenDuration(aJunctionId: Integer;
  aSignalPos: Integer; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupYellowDuration(aJunctionId: Integer;
  aSignalPos: Integer; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupRedDuration(aJunctionId: Integer; aSignalPos: Integer;
  aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentPhase(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetCurrentPhaseInRing(aJunctionId: Integer; aRing: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentTimeInCycle(aJunctionId: Integer; aRing: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetNumberPhases(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetNumberPhasesInRing(aJunctionId: Integer; aRing: Integer)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetStartingTimePhase(aJunctionId: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIGetStartingTimePhaseInRing(aJunctionId: Integer; aRing: Integer)
  : Double; cdecl; external ACONTROL_DLL;

function ECIGetDurationsPhase(aJunctionId: Integer; aPhaseId: Integer;
  aTimeSta: Double; var aDur: Double; var aMax: Double; var aMin: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetYellowTimePhase(aJunctionId: Integer; aPhaseId: Integer;
  aTimeSta: Double; var aYellowTime: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECISetYellowTimePhase(aJunctionId: Integer; aPhaseId: Integer;
  aTimeSta: Double; aYellowTime: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIIsAnInterPhase(aJunctionId: Integer; aPhaseId: Integer;
  aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetNbActiveControls: Integer; cdecl; external ACONTROL_DLL;

function ECIGetActiveControls(var aActiveControls: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIdisableBusPreemptionNode(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableBusPreemptionNode(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIIsBusPreemptionNodeEnabled(aJunctionId: Integer): Boolean; cdecl;
  external ACONTROL_DLL;

function ECIGetNbPreemptionSets(aJunctionId: Integer; aTimeSta: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetParameters(aJunctionId: Integer; aTimeSta: Double;
  aIndex: Integer; var aDelay: Double; var aMinDwell: Double;
  var Reserve: Double; var aInhibit: Double; var aMaxDwell: Double;
  var aType: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetLines(aJunctionId: Integer; aTimeSta: Double;
  aIndex: Integer; var aNbLines: Integer; aLines: PInteger): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetPreemptionSetNbPhases(aJunctionId: Integer; aTimeSta: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetPhases(aJunctionId: Integer; aTimeSta: Double;
  aIndex: Integer; var aNbPhases: Integer; aPhases: PInteger): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetPreemptionSetNbRequestDetectors(aJunction: Integer;
  aTimeSta: Double; aIndex: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetRequestDetectors(aJunctionId: Integer;
  aTimeSta: Double; aIndex: Integer; var aNbDetectors: Integer;
  aDetectors: PInteger): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetNbEndDetectors(aJunction: Integer; aTimeSta: Double;
  aIndex: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetPreemptionSetEndDetectors(aJunctionId: Integer; aTimeSta: Double;
  aIndex: Integer; var aNbDetectors: Integer; aDetectors: PInteger): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetNbSignalGroupsPhaseofJunction(aJunctionId: Integer;
  aPhaseId: Integer; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetSignalGroupPhaseofJunction(aJunctionId: Integer;
  aPhaseId: Integer; aIndexSG: Integer; aTimeSta: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeColorSignalGroupPhaseofJunction(aJunctionId: Integer;
  aPhaseId: Integer; aSGIndex: Integer; aState: Integer; aTimeSta: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetControlType(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetYellowTime(aJunctionId: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIGetOffset(aJunctionId: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECIdisableEvents(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableEvents(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIEnableEventsActivatingPhase(aJunctionId: Integer;
  aIdPhaseToActivateNow: Integer; aExpiredTime: Double; aCurrentTime: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIIsEventsEnabled(aJunctionId: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeDirectPhase(aJunctionId: Integer; aPhaseId: Integer;
  aTimeSta: Double; aTime: Double; aSimStep: Double; aExpiredTime: Double = 0.0)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIChangeDirectPhaseWithInterphaseTransition(aJunctionId: Integer;
  aTimeSta: Double; aTime: Double; aSimStep: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIChangeTimingPhase(aJunctionId: Integer; aPhaseId: Integer;
  aNewTime: Double; aTimeSta: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupState(aJunctionId: Integer;
  aSignalGroupId: Integer; aState: Integer; aTimeSta: Double; aTime: Double;
  aSimStep: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupStateToYellow(aJunctionId: Integer;
  aSignalGroupId: Integer; aState: Integer; aTimeSta: Double; aTime: Double;
  aSimStep: Double; aGreenTime: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofSignalGroup(aJunctionId: Integer;
  aSignalGroupId: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIChangeSignalGroupStatebyName(aJunctionId: Integer;
  aSignalGroupName: PChar; aState: Integer; aTimeSta: Double;
  aTime: Double; aSimStep: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentStateofSignalGroupbyName(aJunctionId: Integer;
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
  aJunctionId: Integer; aPhaseId: Integer; var aPassageTime: Double;
  var aTimeBeforeReduce: Double; var aTimeToReduce: Double;
  var aMinimumGap: Double): Integer; cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsPassageTime(aElemControl: Integer;
  aJunctionId: Integer; aPhaseId: Integer; aPassageTime: Double;
  aTimeBeforeReduce: Double; aTimeToReduce: Double; aMinimumGap: Double)
  : Integer; cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsMinimumGreen(aElemControl: Integer;
  aJunctionId: Integer; aPhaseId: Integer; var aMinDurationMinGreen: Double;
  var aMaxMinGreen: Double; var aSecActuation: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECISetActuatedParamsMinimumGreen(aElemControl: Integer;
  aJunctionId: Integer; aPhaseId: Integer; aMinDurationMinGreen: Double;
  aMaxMinGreen: Double; aSecActuation: Double): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetActuatedParamsMaxGreen(aElemControl: Integer;
  aJunctionId: Integer; aPhaseId: Integer): Double; cdecl;
  external ACONTROL_DLL;

function ECISetActuatedParamsMaxGreen(aElemControl: Integer;
  aJunctionId: Integer; aPhaseId: Integer; aMaxDuration: Double): Integer;
  cdecl; external ACONTROL_DLL;

function ECIGetActuatedParamsForceOFFPermissivePeriod(aElemControl: Integer;
  aJunctionId: Integer; aPhaseId: Integer; var aForceOFF: Double;
  var aPermissivePeriodFrom: Double; var aPermissivePeriodTo: Double): Integer;
  cdecl; external ACONTROL_DLL;

function ECISetActuatedParamsForceOFFPermissivePeriod(aElemControl: Integer;
  aJunctionId: Integer; aPhaseId: Integer; aForceOFF, aPermissivePeriodFrom,
  aPermissivePeriodTo: Double): Integer; cdecl; external ACONTROL_DLL;

function ECIetExternalCall(aElemControl: Integer; aJunction: Integer;
  aPhaseId: Integer): Integer; cdecl; external ACONTROL_DLL;

function ECIGetCurrentNbRingsJunction(aJunction: Integer): Integer; cdecl;
  external ACONTROL_DLL;

function ECIGetCurrentNbBarriersJunction(aJunction: Integer): Integer; cdecl;
  external ACONTROL_DLL;

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

function ECIGetMeteringProperties(aElement: Integer): StructA2KMetering; cdecl;
  external ACONTROL_DLL;

function ECIGetMeteringPropertiesById(aMeteringId: Integer): StructA2KMetering;
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
