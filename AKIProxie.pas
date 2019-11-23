{ /*
  MIT License

  Copyright (c) 2014-2019 Wuping Xin
  https://github.com/wxinix
  xinwuping007@gmail.com
  Initially created by Wuping Xin on 2014-03-18 00:20:06

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

unit AKIProxie;

interface

uses
  AAPI_Util;

// .......................................
// 1. ACTIONS MANAGEMENT
// .......................................
function AKIActionAddSpeedAction(aSectionID: Integer; aNewSpeed: Double;
  aVehTypePos: Integer; aAcomplianceLevel: Double): Pointer; cdecl;
  external A2KERNEL_DLL;

function AKIActionAddDetailedSpeedAction(aANG_SectionID: Integer;
  aLaneID: Integer; aANG_SegmentID: Integer; aNewSpeed: Double;
  aVehTypePos: Integer; aAcomplianceLevel: Double): Pointer; cdecl;
  external A2KERNEL_DLL;

function AKIActionCloseLaneAction(aSectionID: Integer; aLine: Integer;
  aVehTypePos: Integer): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionCloseLaneActionBySegment(aSectionID: Integer; aLine: Integer;
  aAng_SegmentFromID: Integer; aAng_SegmentToID: Integer; aVehTypePos: Integer;
  aApply2LanesCF: Boolean; aVisibilityDistance: Double): Pointer; cdecl;
  external A2KERNEL_DLL;

function AKIActionCloseLaneDetailedAction(aSectionID: Integer; aLine: Integer;
  aVehTypePos: Integer; aApply2LanesCF: Boolean;
  aVisibilityDistance: Double): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionAddNextTurningODAction(aSectionID: Integer;
  aNextSection: Integer; aOrigin, aDest, aVehTypePos: Integer;
  aSectionInPath: Integer; aAcomplianceLevel: Double;
  aVisibilityDistance: Double): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionAddNextTurningResultAction(aSectionID: Integer;
  aOldNextSection, aNewNextSection, aVehTypePos: Integer;
  aAcomplianceLevel: Double): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionAddChangeDestAction(aSectionID: Integer;
  aNewDest, aOrigin, aDest: Integer; aVehTypePos: Integer;
  aAcomplianceLevel: Double): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionChangeTurningProbAction(aSectionID: Integer;
  aNbNewProb: Integer; var aNextSection: Integer; var aNewProb: Double;
  aVehTypePos: Integer): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionCongestionPricingODAction(aActionID: Integer;
  aANG_SectionID: Integer; aANG_HOTSection: Integer;
  aOrigin, aDest, aVehTypePos: Integer; aAcomplianceLevel: Double;
  aVisibilityDistance: Double; aType: Integer; aIsTolled: Boolean;
  aGPSection, aMethod: Integer; aThreshold, aLogitScaleFactor, aPenalisationGPL,
  aPenalisationHOTL: Double): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionDisableReservedLaneAction(aSectionID: Integer; aLine: Integer;
  aANG_SegmentID: Integer): Pointer; cdecl; external A2KERNEL_DLL;

procedure AKIActionRemoveAction(aA2KAction: Pointer); cdecl;
  external A2KERNEL_DLL;

procedure AKIActionReset; cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathODAction(aANG_SectionID: Integer;
  aNbNextSections: Integer; aNextSections: PInteger;
  aOrigin, aDest, aVehTypePos: Integer; aSectionInPath: Integer;
  aAcomplianceLevel: Double; aVisibilityDistance: Double): Pointer; cdecl;
  external A2KERNEL_DLL;

function AKIActionAddNextSubPathResultAction(aANG_SectionID: Integer;
  aNbNextSections: Integer; aNextSections: PInteger; aVehTypePos: Integer;
  aAcomplianceLevel: Double): Pointer; cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathPTAction(aANG_SectionID: Integer;
  aNbSections: Integer; aSections: PInteger; aLineID, aVehTypePos: Integer;
  aAcomplianceLevel: Double): Pointer; cdecl; external A2KERNEL_DLL;

procedure AKIActionAddCloseTurningODAction(aSectionID, aNewSection2Close,
  aOrigin, aDest, aVehTypePos: Integer; aAcomplianceLevel: Double;
  aVisibilityDistance: Double = 200.0; aLocalEffect: Boolean = True;
  aIsDUE: Boolean = False); cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextTurningODAction(aA2KAction: Pointer;
  aAcomplianceLevel: Double); cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextTurningResultAction(aA2KAction: Pointer;
  aAcomplianceLevel: Double); cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyChangeDestAction(aA2KAction: Pointer;
  aAcomplianceLevel: Double); cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextSubPathResultAction(aA2KAction: Pointer;
  aAcomplianceLevel: Double); cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextSubPathODAction(aA2KAction: Pointer;
  aAcomplianceLevel: Double); cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyCloseTurningODAction(aA2KAction: Pointer;
  aAcomplianceLevel: Double); cdecl; external A2KERNEL_DLL;

// .......................................
// 2. INFORMATION OF GENERAL VEHICLES
// .......................................
const
  AKIInfVehGetMem            = - 4001;
  AKIInfVehUnknownSection    = - 4002;
  AKIInfIndexNotValid        = - 4003;
  AKIInfNotReady             = - 4004;
  AKIInfVehUnknownJunction   = - 4005;
  AKIInfVehNotFound          = - 4006;
  AKIInfVehInvalidParam      = - 4007;
  AKIVehInvalidVehicleTypeId = - 4008;
  AKIInfVehNotAvalaible      = - 1;

type
  InfVeh = packed record
    report: Integer;
    idVeh: Integer;
    aType: Integer;
    idSection: Integer;
    segment: Integer;
    numberLane: Integer;
    idJunction: Integer;
    idSectionFrom: Integer;
    idLaneFrom: Integer;
    idSectionTo: Integer;
    idLaneTo: Integer;
    CurrentPos: Double;
    distance2End: Double;
    xCurrentPos: Double;
    yCurrentPos: Double;
    zCurrentPos: Double;
    xCurrentPosBack: Double;
    yCurrentPosBack: Double;
    zCurrentPosBack: Double;
    CurrentSpeed: Double;
    PreviousSpeed: Double;
    TotalDistance: Double;
    SystemEntranceT: Double;
    SectionEntranceT: Double;
    CurrentStopTime: Double;
  end;

type
  StaticInfVeh = packed record
    report: Integer;
    idVeh: Integer;
    aType: Integer;
    length: Double;
    width: Double;
    maxDesiredSpeed: Double;
    maxAcceleration: Double;
    normalDeceleration: Double;
    maxDeceleration: Double;
    speedAcceptance: Double;
    minDistanceVeh: Double;
    minSafetyDistance: Double;
    giveWayTime: Double;
    guidanceAcceptance: Double;
    enrouted: Integer;
    equipped: Integer;
    tracked: Integer;
    keepfastLane: Boolean;
    headwayMin: Double;
    sensitivityFactor: Double;
    reactionTime: Double;
    reactionTimeAtStop: Double;
    reactionTimeAtTrafficLight: Double;
    centroidOrigin: Integer;
    centroidDest: Integer;
    idsectionExit: Integer;
    idLine: Integer;
    internalInfo: Pointer;
    margin2Overtake: Double;
    TM: Double;
    TA: Double;
    TC: Double;
    TS: Double;
    VelMaxOvertaking: Double;
  end;

type
  VehPos = packed record
    xPos: Double;
    yPos: Double;
    zPos: Double;
    xPosBack: Double;
    yPosBack: Double;
    zPosBack: Double;
  end;

  PVehPos = ^VehPos;

type
  InfVehPos = packed record
    report: Integer;
    idVeh: Integer;
    Npos: Integer;
    vehiclePos: PVehPos;
  end;

type
  GraphicInfVeh = packed record
    report: Integer;
    idVeh: Integer;
    leftTurnSignal: Boolean;
    rightTurnSignal: Boolean;
    brakeLight: Boolean;
    drivingBackwards: Boolean;
  end;

function AKIRemoveVehicle(aSectionID: Integer; aVehIndex: Integer): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehEnableGraphicalInf(Always: Boolean = False): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehDisableGraphicalInf: Integer; cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbVehiclesSection(aSectionID: Integer;
  ConsiderAllSegments: Boolean): Integer; cdecl; external A2KERNEL_DLL;

procedure AKIVehStateGetVehicleInfSection(aSectionID: Integer;
  aVehIndex: Integer); cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleStaticInfSection(aSectionID: Integer;
  aVehIndex: Integer): StaticInfVeh; cdecl; external A2KERNEL_DLL;

function AKIVehSetVehicleStaticInfSection(aSectionID: Integer;
  aVehIndex: Integer; aStaticinfVeh: StaticInfVeh): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosSection(aSectionID: Integer; aVehIndex: Integer;
  aNbPos: Integer): InfVehPos; cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosSectionWithStruct(aSectionID: Integer;
  aVehIndex: Integer; aNbPos: Integer; var aInfVehPos: InfVehPos): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGraphicInfSection(aSectionID: Integer;
  aVehIndex: Integer): GraphicInfVeh; cdecl; external A2KERNEL_DLL;

function AKIVehSetDrivingBackwards(aSectionID: Integer; aVehIndex: Integer;
  aValue: Boolean): Integer; cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbVehiclesJunction(aJunction: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehStateGetVehicleInfJunction(aJunction: Integer;
  aVehIndex: Integer): InfVeh; cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleStaticInfJunction(aJunction: Integer;
  aVehIndex: Integer): StaticInfVeh; cdecl; external A2KERNEL_DLL;

function AKIVehSetVehicleStaticInfJunction(aJunction: Integer;
  aVehIndex: Integer; aStaticinfVeh: StaticInfVeh): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosJunction(aJunction: Integer; aVehIndex: Integer;
  aNbPos: Integer): InfVehPos; cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosJunctionWithStruct(aJunction: Integer;
  aVehIndex: Integer; aNbPos: Integer; var aInfVehPos: InfVehPos): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGraphicInfJunction(aJunction: Integer;
  aVehIndex: Integer): GraphicInfVeh; cdecl; external A2KERNEL_DLL;

function AKIVehGetInf(aVehID: Integer): InfVeh; cdecl; external A2KERNEL_DLL;

function AKIVehGetStaticInf(aVehID: Integer): StaticInfVeh; cdecl;
  external A2KERNEL_DLL;

function AKIVehSetStaticInf(aVehID: Integer;
  aStaticinfVeh: StaticInfVeh): Integer; cdecl; external A2KERNEL_DLL;

function AKIVehGetNbVehTypes: Integer; cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetIdVehTypeANG(aVehTypePos: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehGetMinLengthVehType(aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIVehGetMaxLengthVehType(aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIVehGetVehTypeName(aVehTypePos: Integer): PChar; cdecl;
  external A2KERNEL_DLL;

function AKIVehGetVehTypeInternalPosition(aAimsunVehicleTypeID: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetPercentageForImprudentLaneChanging(aVehicleTypeID
    : Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetPercentageForImprudentLaneChanging(
  aVehicleTypeID: Integer; aNewPercentage: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehTypeGetSensitivityForImprudentLaneChanging(aVehicleTypeID
    : Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetSensitivityForImprudentLaneChanging(
  aVehicleTypeID: Integer; aNewSensitivity: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehTypeGetPercentageForStayingInFastLane(aVehicleTypeID: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetPercentageForStayingInFastLane(aVehicleTypeID: Integer;
  aNewPercentage: Double): Integer; cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetPercentageForUndertaking(aVehicleTypeID: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetPercentageForUndertaking(aVehicleTypeID: Integer;
  aNewPercentage: Double): Integer; cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbSectionsVehiclePathJunction(aJunctionID: Integer;
  aVehIndex: Integer; aStartSectionID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehStateGetIdSectionVehiclePathJunction(aJunctionID: Integer;
  aVehIndex: Integer; aSectionID: Integer; aSectionIndex: Integer): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbSectionsVehiclePathSection(aSectionID: Integer;
  aVehIndex: Integer; aStartSectionID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehStateGetIdSectionVehiclePathSection(aSectionID: Integer;
  aVehIndex: Integer; aStartSectionID: Integer; aSectionIndex: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetNbSectionsVehiclePath(aVehID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehTrackedGetIdSectionVehiclePath(aVehID: Integer;
  aSectionIndex: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIRemoveVehicleJunction(aJunctionID: Integer; aVehIndex: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

procedure AKIVehTrackedRemove(aVehID: Integer); cdecl; external A2KERNEL_DLL;

// .......................................
// 3. INFORMATION OF DETECTORS AND DETECTORS MEASURES
// .......................................
const
  AKIDETUnknownDetector       = - 3010;
  AKIDETIncorrectInterval     = - 3011;
  AKIDETMeasureNotGathered    = - 3012;
  AKIDETNoAggregatedDetection = - 3013;
  AKIDETNoInstantDetection    = - 3015;

type
  structA2KDetector = packed record
    report: Integer;
    Id: Integer;
    idSection: Integer;
    IdFirstLane: Integer;
    IdLastLane: Integer;
    DistinguishType: Boolean;
    Capabilities: Integer;
    InitialPosition: Double;
    FinalPosition: Double;
  end;

type
  EquippedInfVeh = packed record
    report: Integer;
    timedetected: Double;
    idVeh: Integer;
    vehType: Integer;
    speed: Double;
    headway: Double;
    idptline: Integer;
  end;

function AKIDetGetNumberDetectors: Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetIdDetector(aNbDet: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetPropertiesDetector(aNbDet: Integer): structA2KDetector; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetPropertiesDetectorById(aDetID: Integer): structA2KDetector;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsCountGather(aCapability: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function AKIDetIsPresenceGather(aCapability: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function AKIDetIsSpeedGather(aCapability: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function AKIDetIsOccupancyGather(aCapability: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function AKIDetIsHeadwayGather(aCapability: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function AKIDetIsDensityGather(aCapability: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function AKIDetIsInfEquippedVehGather(aCapability: Integer): Boolean; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetIntervalDetection: Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetCycleInstantDetection: Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetNbMeasuresAvailableInstantDetection: Integer; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetEndTimeMeasureAvailableInstantDetection(aElem: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetSCOOTOccupancyCyclebyId(aDetID: Integer; aVehTypePos: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetFinTimeOccupedCyclebyId(aDetID: Integer; aElem: Integer;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetIniTimeOccupedCyclebyId(aDetID: Integer; aElem: Integer;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetNbintervalsOccupedCyclebyId(aDetID: Integer;
  aVehTypePos: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetCounterCyclebyId(aDetID: Integer; aVehTypePos: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetSpeedCyclebyId(aDetID: Integer; aVehTypePos: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetTimeOccupedCyclebyId(aDetID: Integer; aVehTypePos: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetPresenceCyclebyId(aDetID: Integer; aVehTypePos: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetHeadwayCyclebyId(aDetID: Integer; aVehTypePos: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetDensityCyclebyId(aDetID: Integer; aVehTypePos: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsEquippedInDetectionCyclebyId(aDetID: Integer;
  aVehTypePos: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionStaticInfVehCyclebyId(aDetID: Integer;
  aElem: Integer; aVehTypePos: Integer): StaticInfVeh; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionInfVehCyclebyId(aDetID: Integer;
  aElem: Integer; aVehTypePos: Integer): InfVeh; cdecl; external A2KERNEL_DLL;

function AKIDetGetSCOOTOccupancyInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetIniTimeOccupedInstantDetectionbyId(aDetID: Integer;
  aElem: Integer; aVehTypePos: Integer; aEndTime: Double): Double; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetEndTimeOccupedInstantDetectionbyId(aDetID: Integer;
  aElem: Integer; aVehTypePos: Integer; aEndTime: Double): Double; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetNbintervalsOccupedInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetCounterInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetSpeedInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetTimeOccupedInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetPresenceInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetHeadwayInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetDensityInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsEquippedInDetectionInstantDetectionbyId(aDetID: Integer;
  aVehTypePos: Integer; aEndTime: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionStaticInfVehInstantDetectionbyId
  (aDetID: Integer; aElem: Integer; aVehTypePos: Integer; aEndTime: Double)
  : StaticInfVeh; cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionInfVehInstantDetectionbyId(aDetID: Integer;
  aElem: Integer; aVehTypePos: Integer; aEndTime: Double): InfVeh; cdecl;
  external A2KERNEL_DLL;

function AKIDetGetCounterAggregatedbyId(aDetID: Integer; aVehTypePos: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetSpeedAggregatedbyId(aDetID: Integer; aVehTypePos: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetTimeOccupedAggregatedbyId(aDetID: Integer;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetPresenceAggregatedbyId(aDetID: Integer; aVehTypePos: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetDensityAggregatedbyId(aDetID: Integer; aVehTypePos: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetHeadwayAggregatedbyId(aDetID: Integer; aVehTypePos: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsInDetectionAggregatedbyId(aDetID: Integer;
  aVehTypePos: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionAggregatedbyId(aDetID: Integer;
  aVehTypePos: Integer; aElem: Integer): EquippedInfVeh; cdecl;
  external A2KERNEL_DLL;

// .......................................
// 4. DETECTOR CLICKABLE EVENTS
// .......................................
const
  AKIDetectorEventsNoTraffic = - 10000;

function AKIDetectorEventsEnable: Integer; cdecl; external A2KERNEL_DLL;

function AKIDetectorEventsDisable: Integer; cdecl; external A2KERNEL_DLL;

procedure AKIDetectorEventsAddEvent(aDetID: Integer; aIniTime, aEndTime: Double;
  aVehTypePos: Integer; aSpeed, aLength: Double; aPTLineID: Integer); cdecl;
  external A2KERNEL_DLL;

procedure AKIDetectorEventsClear; cdecl; external A2KERNEL_DLL;

// .......................................
// 5. INFORMATION OF IDENTIFIERS OF SECTIONS AND JUNCTIONS
// .......................................
const
  AKIInfNetGetMem          = - 5001;
  AKIInfUnknownId          = - 5002;
  AKIInfUnknownTurning     = - 5003;
  AKIInfUnknownFromSection = - 5004;
  AKIInfUnknownToSection   = - 5005;
  AKIInfNoPath             = - 5006;

type
  A2KSectionInf = packed record
    report: Integer;
    Id: Integer;
    angId: Integer;
    nbCentralLanes: Integer;
    nbSideLanes: Integer;
    speedLimit: Double;
    visibilityDistance: Double;
    reservedLanesVisibilityDistance: Double;
    yellowBoxSpeed: Double;
    capacity: Double;
    distance_OnRamp: Double;
    distance_OnRampMerge: Double;
    cooperation_OnRamp: Double;
    slope_percentage: Double;
    length: Double;
    userDefinedCost: Double;
    reactionTimeVariation: Integer;
    reactionTimeAtTrafficLightVariation: Double;
    reactionTimeAtStopVariation: Double;
    imprudentLaneChangingFactor: Double;
    sensitivity2ImprudentLaneChangingFactor: Double;
    nbTurnings: Integer;
  end;

type
  A2KSectionBehaviourParam = packed record
    speedLimit: Double;
    visibilityDistance: Double;
    reservedLanesVisibilityDistance: Double;
    yellowBoxSpeed: Double;
    capacity: Double;
    distance_OnRamp: Double;
    distance_OnRampMerge: Double;
    cooperation_OnRamp: Double;
    userDefinedCost: Double;
    reactionTimeVariation: Integer;
    reactionTimeAtTrafficLightVariation: Double;
    reactionTimeAtStopVariation: Double;
    imprudentLaneChangingFactor: Double;
    sensitivity2ImprudentLaneChangingFactor: Double;
  end;

type
  A2KCentroidInf = packed record
    report: Integer;
    Id: Integer;
    AsDestConsider_percentage: Boolean;
    AsOrigConsider_percentage: Boolean;
    IsOrigin: Boolean;
    IsDestination: Boolean;
    NumConnecTo: Integer;
    NumConnecFrom: Integer;
  end;

type
  A2KTurnInf = packed record
    report: Integer;
    Id: Integer;
    length: Double;
    speedLimit: Double;
    originSectionId: Integer;
    destinationSectionId: Integer;
    originFromLane: Integer;
    originToLane: Integer;
    destinationFromLane: Integer;
    destinationToLane: Integer;
  end;

type
  A2KTurnBehaviourParam = packed record
    speedLimit: Double;
    yellowBoxSpeed: Double;
  end;

function AKIInfNetGetUnits: Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetWorldCoordinates(var min_x, min_y, max_x, max_y: Double)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetNbSectionsANG: Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetSectionANGId(aElem: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetSectionANGInf(aID: Integer): A2KSectionInf; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetIdSectionANGDestinationofTurning(aID: Integer;
  aElem: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetDestinationFromLaneofTurning(aID: Integer; aElem: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetDestinationToLaneofTurning(aID: Integer; aElem: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetOriginFromLaneofTurning(aID: Integer; aElem: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetOriginToLaneofTurning(aID: Integer; aElem: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetNbTurns: Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurnId(aElem: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetTurnInf(aID: Integer): A2KTurnInf; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetNbTurnsInNode(aNodeID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetOriginSectionInTurn(aNodeID: Integer; aIndex: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetDestinationSectionInTurn(aNodeID: Integer; aIndex: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurnInfo(aNodeID: Integer; aIndex: Integer): A2KTurnInf;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetSetTurnBehaviouralParam(aID: Integer;
  aBehaviourParam: A2KTurnBehaviourParam): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetTurnBehaviouralParam(aTurnID: Integer;
  var aReport: Integer): A2KTurnBehaviourParam; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningId(aOriginSection: Integer;
  aDestinationSection: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningDestinationFromLane(aOriginSection: Integer;
  aDestinationSection: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningDestinationToLane(aOriginSection: Integer;
  aDestinationSection: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningOriginFromLane(aOriginSection: Integer;
  aDestinationSection: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningOriginToLane(aOriginSection: Integer;
  aDestinationSection: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetSetSectionBehaviouralParam(aID: Integer;
  aBehaviourParam: A2KSectionBehaviourParam; aIsAllsegments: Boolean): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetSectionBehaviouralParam(aSectionID: Integer;
  var aReport: Integer): A2KSectionBehaviourParam; cdecl; external A2KERNEL_DLL;

function AKISetSectionCapacity(aID: Integer; aCapacity: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKISetSectionUserDefinedCost(aID: Integer; aUserDefinedCost: Double)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKISetSectionUserDefinedCost2(aID: Integer; aUserDefinedCost: Double)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKISetSectionUserDefinedCost3(aID: Integer; aUserDefinedCost: Double)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIGetSectionCapacity(aID: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIGetSectionUserDefinedCost(aID: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIGetSectionUserDefinedCost2(aID: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIGetSectionUserDefinedCost3(aID: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetNbJunctions: Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetJunctionId(aElem: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetNbCentroids: Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetCentroidId(aElem: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetCentroidInf(aID: Integer): A2KCentroidInf; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetIdSectionofOriginCentroidConnector(aID: Integer;
  aElem: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIdSectionofDestinationCentroidConnector(aID: Integer;
  aElem: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIdSectionANGofOriginCentroidConnector(aID: Integer;
  aElem: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIdSectionANGofDestinationCentroidConnector(aID: Integer;
  aElem: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetShortestPathNbSections(aFromSection: Integer;
  aToSection: Integer; aSectionColumnCost: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIInfNetGetShortestPath(aFromSection: Integer; aToSection: Integer;
  aSectionColumnCost: Pointer; var aPath: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

// .......................................
// 6. INFORMATION OF PATH & NAMES
// .......................................
const
  ODMatrixDemand = 1;
  StateDemand    = 2;

function AKIInfNetGetNetworkPath: PChar; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetNetworkName: PChar; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTrafficDemandName: PChar; cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTrafficDemandType: Integer; cdecl; external A2KERNEL_DLL;

// .......................................
// 7. STATISTICAL INFORMATION
// .......................................
const
  AKIESTUnknownSection                = - 6001;
  AKIESTNotAvalaible                  = - 6002;
  AKIESTUnknownCentroid               = - 6004;
  AKIESTUnknownStream                 = - 6005;
  AKIESTFuelConsumptionNotAvailable   = - 6006;
  AKIESTPollutionEmissionNotAvailable = - 6007;
  AKIESTUnknownPollutant              = - 6008;
  AKIESTWrongLane                     = - 6009;
  AKIESTUnknownNode                   = - 6010;

type
  StructAkiEstadSystem = packed record
    report: Integer;
    Flow: Integer;
    TTa: Double;
    TTd: Double;
    DTa: Double;
    DTd: Double;
    Sa: Double;
    Sd: Double;
    SHa: Double;
    SHd: Double;
    Density: Double;
    STa: Double;
    STd: Double;
    NumStops: Double;
    LongQueueAvg: Double;
    LongQueueMax: Double;
    TotalTravel: Double;
    TotalTravelTime: Double;
    virtualQueueAvg: Double;
    virtualQueueMax: Integer;
    count: Integer;
    inputFlow: Integer;
    inputCount: Integer;
    vehsWaiting: Integer;
    vehIn: Integer;
    vehsLostIn: Integer;
    vehsLostOut: Integer;
    missedTurns: Double;
  end;

type
  StructAkiEstadSection = packed record
    report: Integer;
    Id: Integer;
    Flow: Integer;
    TTa: Double;
    TTd: Double;
    DTa: Double;
    DTd: Double;
    Sa: Double;
    Sd: Double;
    SHa: Double;
    SHd: Double;
    Density: Double;
    STa: Double;
    STd: Double;
    NumStops: Double;
    LongQueueAvg: Double;
    LongQueueMax: Double;
    TotalTravel: Double;
    TotalTravelTime: Double;
    virtualQueueAvg: Double;
    virtualQueueMax: Integer;
    count: Integer;
    inputFlow: Integer;
    inputCount: Integer;
    flowCapacity: Double;
    laneChanges: Double;
  end;

type
  StructAkiEstadTurning = packed record
    report: Integer;
    idSectionFrom: Integer;
    idSectionTo: Integer;
    Flow: Integer;
    TTa: Double;
    TTd: Double;
    DTa: Double;
    DTd: Double;
    Sa: Double;
    Sd: Double;
    SHa: Double;
    SHd: Double;
    STa: Double;
    STd: Double;
    NumStops: Double;
    LongQueueAvg: Double;
    LongQueueMax: Double;
    TotalTravel: Double;
    TotalTravelTime: Double;
  end;

type
  StructAkiEstadSectionLane = packed record
    report: Integer;
    idSection: Integer;
    Flow: Integer;
    TTa: Double;
    TTd: Double;
    DTa: Double;
    DTd: Double;
    Sa: Double;
    Sd: Double;
    SHa: Double;
    SHd: Double;
    Density: Double;
    LongQueueAvg: Double;
    LongQueueMax: Double;
  end;

type
  StructAkiEstadODPair = packed record
    report: Integer;
    IdOrigin: Integer;
    IdDest: Integer;
    Flow: Integer;
    TTa: Double;
    TTd: Double;
    DTa: Double;
    DTd: Double;
    Sa: Double;
    Sd: Double;
    SHa: Double;
    SHd: Double;
    STa: Double;
    STd: Double;
    NumStops: Double;
    virtualQueueAvg: Double;
    virtualQueueMax: Double;
    TotalTravel: Double;
    TotalTravelTime: Double;
    vehLost: Integer;
  end;

type
  StructAkiEstadStream = packed record
    report: Integer;
    Id: Integer;
    Flow: Integer;
    TTa: Double;
    TTd: Double;
    DTa: Double;
    DTd: Double;
    Sa: Double;
    Sd: Double;
    SHa: Double;
    SHd: Double;
    STa: Double;
    STd: Double;
    NumStops: Double;
    virtualQueueAvg: Double;
    virtualQueueMax: Double;
    TotalTravel: Double;
    TotalTravelTime: Double;
  end;

function AKIIsGatheringStatistics: Integer; cdecl; external A2KERNEL_DLL;

function AKIEstGetIntervalStatistics: Double; cdecl; external A2KERNEL_DLL;

function AKIEstIsNewStatisticsAvailable: Boolean; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSection(aArcID: Integer; aVehTypePos: Integer)
  : StructAkiEstadSection; cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSection(aArcID: Integer; aTimeSta: Double;
  aVehTypePos: Integer): StructAkiEstadSection; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSectionLane(aArcID: Integer;
  aLaneIndex: Integer; aVehTypePos: Integer): StructAkiEstadSectionLane; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSectionLane(aArcID: Integer;
  aLaneIndex: Integer; aTimeSta: Double; aVehTypePos: Integer)
  : StructAkiEstadSectionLane; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsTurning(aFromSectionID: Integer;
  aToSectionID: Integer; aVehTypePos: Integer): StructAkiEstadTurning; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsTurning(aFromSectionID: Integer;
  aToSectionID: Integer; aTimeSta: Double; aVehTypePos: Integer)
  : StructAkiEstadTurning; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsLink(aFromSectionID: Integer;
  aToSectionID: Integer; aVehTypePos: Integer): StructAkiEstadTurning; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsLink(aFromSectionID: Integer;
  aToSectionID: Integer; aTimeSta: Double; aVehTypePos: Integer)
  : StructAkiEstadTurning; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSystem(aVehTypePos: Integer)
  : StructAkiEstadSystem; cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSystem(aTimeSta: Double;
  aVehTypePos: Integer): StructAkiEstadSystem; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsODPair(aOriginID: Integer;
  aDestinationID: Integer; aVehTypePos: Integer): StructAkiEstadODPair; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsODPair(aOriginID: Integer;
  aDestinationID: Integer; aTimeSta: Double; aVehTypePos: Integer)
  : StructAkiEstadODPair; cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsStream(aStreamID: Integer; aTimeSta: Double;
  aVehTypePos: Integer): StructAkiEstadStream; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsStream(aStreamID: Integer;
  aVehTypePos: Integer): StructAkiEstadStream; cdecl; external A2KERNEL_DLL;

function AKIEstGetInstantVirtualQueueSection(aArcID: Integer;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsNodeLostVehicles(aNodeID: Integer;
  aVehTypePos: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIEstGetPartialStatisticsNodeLostVehicles(aNodeID: Integer;
  aVehTypePos: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsNodeLevelOfService(aNodeID: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetPartialStatisticsNodeLevelOfService(aNodeID: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsNodeMissedTurns(aNodeID: Integer;
  aVehTypePos: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIEstGetPartialStatisticsNodeMissedTurns(aNodeID: Integer;
  aVehTypePos: Integer): Integer; cdecl; external A2KERNEL_DLL;

//Pollutants and emission statistics
function AKIEstGetGlobalStatisticsSectionFuelCons(aArcID: Integer;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSectionFuelCons(aArcID: Integer;
  aTimeSta: Double; aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsTurningFuelCons(aFromSectionID: Integer;
  aToSectionID: Integer; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsTurningFuelCons(aFromSectionID: Integer;
  aToSectionID: Integer; aTimeSta: Double; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsLinkFuelCons(aFromSectionID: Integer;
  aToSectionID: Integer; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsLinkFuelCons(aFromSectionID: Integer;
  aToSectionID: Integer; aTimeSta: Double; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSystemFuelCons(aVehTypePos: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSystemFuelCons(aTimeSta: Double;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsODPairFuelCons(aOriginID: Integer;
  aDestinationID: Integer; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsODPairFuelCons(aOriginID: Integer;
  aDestinationID: Integer; aTimeSta: Double; aVehTypePos: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsStreamFuelCons(aStreamID: Integer;
  aTimeSta: Double; aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsStreamFuelCons(aStreamID: Integer;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetNbPollutants: Integer; cdecl; external A2KERNEL_DLL;

function AKIEstGetPollutantName(aIndex: Integer): PChar; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSectionPollution(aPolIndex: Integer;
  aArcID: Integer; aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSectionPollution(aPolIndex: Integer;
  aArcID: Integer; aTimeSta: Double; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsTurningPollution(aPolIndex: Integer;
  aFromSectionID: Integer; aToSectionID: Integer; aVehTypePos: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsTurningPollution(aPolIndex: Integer;
  aFromSectionID: Integer; aToSectionID: Integer; aTimeSta: Double;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsLinkPollution(aPolIndex: Integer;
  aFromSectionID: Integer; aToSectionID: Integer; aVehTypePos: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsLinkPollution(aPolIndex: Integer;
  aFromSectionID: Integer; aToSectionID: Integer; aTimeSta: Double;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSystemPollution(aPolIndex: Integer;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSystemPollution(aPolIndex: Integer;
  aTimeSta: Double; aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsODPairPollution(aPolIndex: Integer;
  aOriginID: Integer; aDestinationID: Integer; aVehTypePos: Integer): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsODPairPollution(aPolIndex: Integer;
  aOriginID: Integer; aDestinationID: Integer; aTimeSta: Double;
  aVehTypePos: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsStreamPollution(aPolIndex: Integer;
  aStreamID: Integer; aTimeSta: Double; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsStreamPollution(aPolIndex: Integer;
  aStreamID: Integer; aVehTypePos: Integer): Double; cdecl;
  external A2KERNEL_DLL;

// .......................................
// 8. VEHICLE ENTRANCE
// .......................................
const
  AKIEnterVehUnknownSection     = - 7001;
  AKIEnterVehUnFeasibleLane     = - 7003;
  AKIEnterVehNotSpace           = - 7004;
  AKIEnterVehUnknownCentroid    = - 7005;
  AKIEnterVehUnFeasiblePath     = - 7006;
  AKIEnterVehNoTrafficFlow      = - 7008;
  AKIEnterVehNoTrafficOD        = - 7009;
  AKIEnterVehUnknownLane        = - 7010;
  AKIEnterVehUnknownNextSection = - 7011;
  AKIEnterVehUnknownVehType     = - 7016;
  AKILegionNotLoaded            = - 7017;
  AKIZeroPedestriansToGenerate  = - 7018;
  AKIZeroTimeInterval           = - 7019;
  AKIEntranceCentroidNotFound   = - 7020;
  AKIExitCentroidNotFound       = - 7021;
  AKIRouteNotFound              = - 7022;
  AKIEntranceCentroidNotInRoute = - 7023;
  AKIExitCentroidNotInRoute     = - 7024;
  RIGHT                         = - 1;
  NOCHANGE                      = 0;
  LEFT                          = 1;

procedure AKIEnterVehTrafficFlow(aSectionID: Integer; aVehTypePos: Integer;
  aTracking: Integer = 0); cdecl; external A2KERNEL_DLL;

procedure AKIEnterVehTrafficOD(aSectionID: Integer; aVehTypePos: Integer;
  aCentroidOriginID: Integer; aCentroidDest: Integer;
  aTracking: Integer = 0); cdecl; external A2KERNEL_DLL;

procedure AKIPutVehTrafficFlow(aSectionID: Integer; aLaneID: Integer;
  aVehTypePos: Integer; aInitPosition, aInitSpeed: Double;
  aNextSection: Integer; aTracking: Integer); cdecl; external A2KERNEL_DLL;

procedure AKIPutVehTrafficOD(aSectionID: Integer; aLaneID: Integer;
  aVehTypePos: Integer; aCentroidOrigin: Integer; aCentroidDest: Integer;
  aInitPosition, aInitSpeed: Double; aTracking: Integer); cdecl;
  external A2KERNEL_DLL;

type
  InfArrival = packed record
    report: Integer;
    idVeh: Integer;
    inVirtualQueue: Boolean;
    entranceSection: Integer;
  end;

function AKIGenerateArrivalTrafficFlow(aSectionID: Integer;
  aVehTypePos: Integer; aUseVirtualQueue: Integer): InfArrival; cdecl;
  external A2KERNEL_DLL;

function AKIGenerateArrivalTrafficOD(aVehTypePos: Integer;
  aCentroidOriginID: Integer; aCentroidDest: Integer; aUseVirtualQueue: Integer)
  : InfArrival; cdecl; external A2KERNEL_DLL;

// .......................................
// 9. VEHICLE TRACKED MANAGE
// .......................................
const
  AKIVehNotTracked             = - 7012;
  AKIVehInvalidParameter       = - 7013;
  AKIVehNextSectionUnreachable = - 7014;

function AKIVehTrackedModifySpeed(aVehID: Integer; newSpeed: Double): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedModifyLane(aVehID: Integer; nextLane: Integer): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedModifyNextSection(aVehID: Integer; nextSection: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIVehTrackedModifyNextSections(aVehID: Integer;
  sizeNextSections: Integer; nextSections: PInteger): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehTrackedModifyNextTargetLaneInNextSection(aVehID: Integer;
  nextSection: Integer; nextLane: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehTrackedDelete(aVehID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehSetAsTracked(aVehID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehSetAsTrackedbyPointer(aVeh: Pointer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIVehSetAsNoTracked(aVehID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

// .......................................
// 10. INFORMATION OF VEHICLE TRACKED
// .......................................
type
  DynInfVeh = packed record
    xCurrentPos: Double;
    yCurrentPos: Double;
    xCurrentPosBack: Double;
    yCurrentPosBack: Double;
    CurrentSpeed: Double;
    turning: Integer;
  end;

function AKIVehTrackedGetStaticInf(aVehID: Integer): StaticInfVeh; cdecl;
  external A2KERNEL_DLL;

function AKIVehTrackedGetInf(aVehID: Integer): InfVeh; cdecl;
  external A2KERNEL_DLL;

function AKIVehTrackedSetStaticInf(aVehID: Integer; aStaticinfVeh: StaticInfVeh)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetPos(aVehID: Integer; aNbPos: Integer): InfVehPos;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetPosWithStruct(aVehID: Integer; aNbPos: Integer;
  var aInfVehPos: InfVehPos): Integer; cdecl; external A2KERNEL_DLL;

procedure AKIVehSetVehicleTrackedDynInf(aVehID: Integer;
  aDynInfVeh: DynInfVeh); cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetGraphicInf(aVehID: Integer): GraphicInfVeh; cdecl;
  external A2KERNEL_DLL;

// .......................................
// 11. INFORMATION OF RUN TIME SIMULATION
// .......................................
function AKIGetCurrentSimulationTime: Double; cdecl; external A2KERNEL_DLL;

function AKIGetTimeSta: Double; cdecl; external A2KERNEL_DLL;

function AKIGetIniSimTime: Double; cdecl; external A2KERNEL_DLL;

function AKIGetEndSimTime: Double; cdecl; external A2KERNEL_DLL;

function AKIGetDurationTransTime: Double; cdecl; external A2KERNEL_DLL;

function AKIGetSimulationStepTime: Double; cdecl; external A2KERNEL_DLL;

function AKISetEndSimTime(aTime: Double): Integer; cdecl; external A2KERNEL_DLL;

// .......................................
// 12. INFORMATION OF REPLICATION
// .......................................
function AKIGetRandomNumber: Double; cdecl; external A2KERNEL_DLL;

// .......................................
// 13. MANAGING OF INCIDENTS
// .......................................
const
  AKIIncidentWrongIniTime   = - 8001;
  AKIIncidentWrongPosition  = - 8002;
  AKIIncidentUnknownLane    = - 8003;
  AKIIncidentUnknownSection = - 8004;
  AKIIncidentNotPresent     = - 8005;
  AKIIncidentWrongLength    = - 8006;
  AKIIncidentWrongDuration  = - 8007;

function AKIGenerateIncident(aSection: Integer; aLane: Integer;
  aPosition: Double; aLength, aIniTime, aDuration, aVisibilityDistance: Double;
  aDoUpdateIdGroup: Boolean): Integer; cdecl; external A2KERNEL_DLL;

function AKIRemoveIncident(aSection: Integer; aLane: Integer; aPosition: Double)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIRemoveAllIncidentsInSection(aSection: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIResetAllIncidents: Integer; cdecl; external A2KERNEL_DLL;

// .......................................
// 14. MANAGING OF Public Transport
// .......................................
const
  AKIPTNotLoaded           = - 9001;
  AKIPTVehUnknown          = - 9002;
  AKIPTStopUnknown         = - 9003;
  AKIPTLineUnknown         = - 9005;
  AKIPTVehNotSpace         = - 9006;
  AKIPTIndexNotValid       = - 9007;
  AKIPTVehUnFeasibleLane   = - 9008;
  AKIPTVehCapacityOverflow = - 9009;
  AKIPTNotAvalaible        = - 1;

type
  InfPTVeh = packed record
    report: Integer;
    idVeh: Integer;
    aType: Integer;
    idSection: Integer;
    segment: Integer;
    numberLane: Integer;
    idJunction: Integer;
    idSectionFrom: Integer;
    idLaneFrom: Integer;
    idSectionTo: Integer;
    idLaneTo: Integer;
    CurrentPosD: Double;
    distance2End: Double;
    xCurrentPos: Double;
    yCurrentPos: Double;
    zCurrentPos: Double;
    xCurrentPosBack: Double;
    yCurrentPosBack: Double;
    zCurrentPosBack: Double;
    CurrentSpeed: Double;
    PreviousSpeed: Double;
    TotalDistance: Double;
    SystemEntranceT: Double;
    SectionEntranceT: Double;
    CurrentStopTime: Double;
    theoricalGenerationTime: Double;
    nbStopsDone: Integer;
    observedLastStopTime: Double;
    observedLastInitialStopTime: Double;
    nextStopId: Integer;
    offsetInNextStop: Double;
    distanceNextStop: Double;
    nextServiceTime: Double;
    currentStoppedTimeInBusStop: Double;
    currentLoad: Integer;
  end;

type
  StaticInfPTVeh = packed record
    report: Integer;
    idVeh: Integer;
    aType: Integer;
    length: Double;
    width: Double;
    maxDesiredSpeed: Double;
    maxAcceleration: Double;
    normalDeceleration: Double;
    maxDeceleration: Double;
    speedAcceptance: Double;
    minDistanceVeh: Double;
    minSafetyDistance: Double;
    giveWayTime: Double;
    guidanceAcceptance: Double;
    enrouted: Integer;
    equipped: Integer;
    tracked: Integer;
    keepfastLane: Boolean;
    headwayMin: Double;
    sensitivityFactor: Double;
    reactionTime: Double;
    reactionTimeAtStop: Double;
    reactionTimeAtTrafficLight: Double;
    maxCapacity: Integer;
    idLine: Integer;
  end;

function AKIPTGetNumberLines: Integer; cdecl; external A2KERNEL_DLL;

function AKIPTGetIdLine(aElem: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIPTGetNumberSectionsInLine(aLineID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIPTGetIdSectionInLine(aLineID: Integer; aElem: Integer): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTGetNumberStopsInLine(aLineID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIPTGetIdStopsInLine(aLineID: Integer; aElem: Integer): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTEnterVeh(aLineID: Integer; aVehTypePos: Integer;
  aIsTracked: Boolean): Integer; cdecl; external A2KERNEL_DLL;

function AKIPTVehModifyStopTime(aVehID: Integer; aNStop: Integer;
  aStopTime: Double): Integer; cdecl; external A2KERNEL_DLL;

function AKIPTVehGetStaticInf(aVehID: Integer): StaticInfPTVeh; cdecl;
  external A2KERNEL_DLL;

function AKIPTVehSetStaticInf(aVehID: Integer; aStaticinfVeh: StaticInfVeh)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIPTVehGetInf(aVehID: Integer): InfPTVeh; cdecl;
  external A2KERNEL_DLL;

function AKIPTGetServiceTimeStopsInLine(aVehID: Integer; aNStop: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIPTVehSetCurrentLoad(aVehID: Integer; aCurrentLoad: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

// .......................................
// 15. PRINT INFORMATION IN XCONSOLE / LOG WINDOW
// .......................................
procedure AKIPrintStringEx(aString: string); cdecl; external A2KERNEL_DLL;

function AKIPrintString(aString: PAnsiChar): Integer; cdecl;
  external A2KERNEL_DLL;

procedure AKIPrintAsUNICODEString(aString: PChar); cdecl; external A2KERNEL_DLL;

function AKIConvertToAsciiString(aString: PChar; aDeleteUshortString: Boolean;
  var aHasAnyNonAnsiChar: Boolean): PAnsiChar; cdecl; external A2KERNEL_DLL;

function AKIConvertFromAsciiString(const aString: PAnsiChar): PChar; cdecl;
  external A2KERNEL_DLL;

procedure AKIDeleteUNICODEString(aString: PChar); cdecl; external A2KERNEL_DLL;

//.........................................
// 16. ODDemand
//.........................................
const
  AKIODDemandNoTrafficOD       = - 11000;
  AKIODDemandIncorrectNumSlice = - 11002;
  AKIODDemandUnknownCentroid   = - 11003;
  AKIODDemandUnknownODPair     = - 11004;

function AKIODDemandGetNumSlicesOD(aVehTypePos: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIODDemandGetIniTimeSlice(aVehTypePos: Integer; aSlice: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIODDemandGetEndTimeSlice(aVehTypePos: Integer; aSlice: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIODDemandGetDemandODPair(aOrigin: Integer; aDestination: Integer;
  aVehTypePos: Integer; aNumSlice: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIODDemandSetDemandODPair(aOrigin: Integer; aDestination: Integer;
  aVehTypePos: Integer; aNumSlice: Integer; aNewDemand: Integer): Integer;
  cdecl; external A2KERNEL_DLL;

//.........................................
// 17. TrafficDemand
//........................................
const
  AKIStateDemandNoTrafficState    = - 15000;
  AKIStateDemandIncorrectNumSlice = - 15002;
  AKIStateDemandUnknownVehType    = - 15004;

function AKIStateDemandGetNumSlices(aVehTypePos: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIStateDemandGetIniTimeSlice(aVehTypePos: Integer; aNumSlice: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIStateDemandGetEndTimeSlice(aVehTypePos: Integer; aNumSlice: Integer)
  : Double; cdecl; external A2KERNEL_DLL;

function AKIStateDemandGetDemandSection(aSectionID: Integer;
  aVehTypePos: Integer; aNumSlice: Integer): Double; cdecl;
  external A2KERNEL_DLL;

function AKIStateDemandSetDemandSection(aSectionID: Integer;
  aVehTypePos: Integer; aNumSlice: Integer; aNewFlow: Double): Integer; cdecl;
  external A2KERNEL_DLL;

//.........................................
// 18. PastCosts
//........................................
const
  AKIPastCostUnknownLink       = - 12001;
  AKIPastCostNoPerVehType      = - 12002;
  AKIPastCostPerVehType        = - 12003;
  AKIPastCostNoReaded          = - 12004;
  AKIPastCostIncorrectTypeName = - 12005;

function AKIPastCostAreCostsPerVehicleType: Integer; cdecl;
  external A2KERNEL_DLL;

function AKIPastCostGetIniTimeReaded: Double; cdecl; external A2KERNEL_DLL;

function AKIPastCostGetIntervalReaded: Double; cdecl; external A2KERNEL_DLL;

function AKIPastCostGetNbIntervalsReaded: Integer; cdecl; external A2KERNEL_DLL;

function AKIPastCostSetPastCost(aSectOrig: Integer; aSectSest: Integer;
  aTime: Double; aVehTypeID: Integer; aNewPastCost: Double;
  aNewPastOutCost: Double): Integer; cdecl; external A2KERNEL_DLL;

function AKIPastCostGetPastCost(aSectOrig: Integer; aSectSest: Integer;
  aTime: Double; aVehTypeID: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIPastCostGetPastOutputCost(aSectOrig: Integer; aSectSest: Integer;
  aTime: Double; aVehTypeID: Integer): Double; cdecl; external A2KERNEL_DLL;

function AKIConvertLatitudeLongitudeToXY(Latitude, Longittude: Double;
  var X, Y: Double): Integer; cdecl; external A2KERNEL_DLL;

function AKIConvertXYToLatitudeLongitude(X, Y: Double;
  var Latitude, Longittude: Double): Integer; cdecl; external A2KERNEL_DLL;

//.........................................
// 19. Fleet Management
//........................................
const
  AKIFleetNotLoaded            = - 14001;
  AKIFleetVehUnknown           = - 14002;
  AKIFleetStopUnknown          = - 14003;
  AKIFleetVehNotSpace          = - 14005;
  AKIFleetVehUnFeasibleLane    = - 14006;
  AKIFleetSectUnknown          = - 14007;
  AKIFleetStopTypeUnknown      = - 14008;
  AKIFleetInvalidFleetId       = - 14009;
  AKIFleetRouteAlreadyAssigned = - 14010;
  AKIFleetSectNotConnected     = - 14011;
  AKIFleetRouteUnknown         = - 14012;
  AKIFleetFleetVehNotGenerated = - 14013;
  AKIFleetInvalidFirstSection  = - 14014;
  AKIFleetInvalidDistance      = - 14015;
  AKIFleetInvalidLane          = - 14016;

function AKIFleetGetNbFleet: Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetGetFleetId: Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetGetNbFleetStops: Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetGetFleetStopId(aIndex: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIFleetGetNbFleetVehicles(aFleetID: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIFleetGetFleetVehicleName(aFleetID: Integer; aIndex: Integer): PChar;
  cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleet(aID: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleetStop(aID: Integer;
  aType, aSecttionID, aLaneID: Integer; aDistannce, aLength, aMaxVeh: Double)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetModifyFleetStopTimeWindow(aID: Integer;
  aOpenTW, aCloseTW: Double): Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleetAssignment(aFleetID: Integer; aFleetVehName: PChar;
  aVehTypePos: Integer; aDepartureTime, aDeviation: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIFleetAddFleetAssignmentRoute(aFleetID: Integer;
  aFleetVehName: PChar; aRouteID: Integer; aNbSect: Integer;
  var aSectionID: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleetAssignmentStop(aFleetID: Integer; aFleetVehName: PChar;
  aNbStops: Integer; aStopsIDs: PInteger; var aAvgTime: Double;
  var aDevTime: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetIsFleetVehicleGenerated(aFleetID: Integer;
  aFleetVehID: Integer): Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetGetCurrentSectionIdFleetVehicle(aFleetID: Integer;
  aFleetVehName: PChar): Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetModifyRouteStopsFleetVehicle(aFleetID: Integer;
  aFleetVehName: PChar; aNbSect: Integer; var aSectID: Integer;
  aNbStops: Integer;
  aStopsIDs: PInteger; var aAvgTime: Double; var aDevTimeD: Double): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetNbStopsFleetVeh(aFleetID: Integer; aFleetVehName: PChar)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetChangeStopTimeFleetVeh(aFleetID: Integer; aFleetVehName: PChar;
  aStopIndex: Integer; aServiceTime: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIFleetGetNbStopsDoneFleetVeh(aFleetID: Integer; aFleetVehName: PChar)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetIsDoingStopFleetVeh(aFleetID: Integer; aFleetVehName: PChar)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIFleetGetStopTimeFleetVeh(aFleetID: Integer; aFleetVehName: PChar;
  aStopIndex: Integer): Double; cdecl; external A2KERNEL_DLL;

//.........................................
// 20. Functions relative to path information
//.........................................
const
  AKIInfVehPathNotAvailable           = - 13001;
  AKIInfVehDestinationUnreachable     = - 13002;
  AKIInfVehInvalidDestinationCentroid = - 13003;

type
  PathInfVeh = packed record
    report: Integer;
    idVeh: Integer;
    aType: Integer;
    entranceSectionId: Integer;
    numSectionsInPath: Integer;
    TotalDistance: Double;
  end;

function AKIVehInfPath(aVehID: Integer): PathInfVeh; cdecl;
  external A2KERNEL_DLL;

function AKIVehInfPathSection(aSectionID: Integer; aVehIndex: Integer)
  : PathInfVeh; cdecl; external A2KERNEL_DLL;

function AKIVehInfPathGetNextSection(aVehID: Integer; aFromSection: Integer)
  : Integer; cdecl; external A2KERNEL_DLL;

function AKIVehInfPathGetNextSectionInSection(aSectionID: Integer;
  aVehIndex: Integer; aFromSection: Integer): Integer; cdecl;
  external A2KERNEL_DLL;

//.........................................
// 21. Function relative to legion
//.........................................
function AKIGeneratePedestrians(aFromCentroid: Integer;
  aToCentroid: Integer; aRouteID: Integer; aNbPedestrians: Double): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIGeneratePedestriansInTime(aFromCentroid: Integer;
  aToCentroid: Integer; aRouteID: Integer; aNbPedestrians: Double;
  aTimeInterval: Double): Integer; cdecl; external A2KERNEL_DLL;

function AKIGeneratePedestriansDefaultRoutes(aFromCentroid: Integer;
  aToCentroid: Integer; aNbPedestrians: Double): Integer; cdecl;
  external A2KERNEL_DLL;

function AKIGeneratePedestriansDefaultRoutesInTime(aFromCentroid: Integer;
  aToCentroid: Integer; aNbPedestrians: Double; aTimeInterval: Double): Integer;
  cdecl; external A2KERNEL_DLL;

implementation

end.
