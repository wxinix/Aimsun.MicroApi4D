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

unit AKIProxie;

interface

uses
  AAPI_Util;

// .......................................
// 1. ACTIONS MANAGEMENT
// .......................................

function AKIGetNbScenarioActions: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIGetScenarioActions(
  var AActions: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIIsActionActive(
  AActionID: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIGetActionType(
  AActionID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddSpeedAction(
  ASectionID: Integer;
  ANewSpeed: Double;
  AVehTypePos: Integer;
  AAcomplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddSpeedActionByID(
  AActionID: Integer;
  ANumSections: Integer;
  ASectionIDs: PInteger;
  ANewSpeed: Double;
  AVehType: Integer;
  AComplianceLevel: Double;
  AConsiderSpeedAcceptance: Boolean
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddDetailedSpeedAction(
  AANG_SectionID: Integer;
  ALaneID: Integer;
  AANG_SegmentID: Integer;
  ANewSpeed: Double;
  AVehTypePos: Integer;
  AComplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddDetailedSpeedActionByID(
  AActionID: Integer;
  ANumSections: Integer;
  ASectionIDs: PInteger;
  ALaneID: Integer;
  AANG_fromSegmentID: Integer;
  AANG_toSegmentID: Integer;
  ANewSpeed: Double;
  AVehType: Integer;
  AComplianceLevel: Double;
  AConsiderSpeedAcceptance: Boolean
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionCloseLaneAction(
  ASectionID: Integer;
  ALine: Integer;
  AVehTypePos: Integer
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionCloseLaneActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ALane: Integer;
  AVehTypePos: Integer
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionCloseLaneActionBySegment(
  ASectionID: Integer;
  ALine: Integer;
  AAng_SegmentFromID: Integer;
  AAng_SegmentToID: Integer;
  AVehTypePos: Integer;
  AApply2LanesCF: Boolean;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionCloseLaneActionBySegmentByID(
  AActionID: Integer;
  ASectionID: Integer;
  ALane: Integer;
  AAng_SegmentFromID: Integer;
  AAng_SegmentToID: Integer;
  AVehTypePos: Integer;
  AApply2LanesCF: Boolean;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionCloseLaneDetailedAction(
  ASectionID: Integer;
  ALine: Integer;
  AVehTypePos: Integer;
  AApply2LanesCF: Boolean;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionCloseLaneDetailedActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ALane: Integer;
  AVehTypePos: Integer;
  AApply2LanesCF: Boolean;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextTurningODAction(
  ASectionID: Integer;
  ANextSection: Integer;
  AOrigin: Integer;
  ADest: Integer;
  AVehTypePos: Integer;
  ASectionInPath: Integer;
  AComplianceLevel: Double;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextTurningODActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ANextSection: Integer;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  ASectionInPath: Integer;
  AComplianceLevel: Double;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextTurningResultAction(
  ASectionID: Integer;
  AOldNextSection: Integer;
  ANewNextSection: Integer;
  AVehTypePos: Integer;
  AComplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddChangeDestAction(
  ASectionID: Integer;
  ANewDest: Integer;
  AOrigin: Integer;
  ADest: Integer;
  AVehTypePos: Integer;
  AComplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextTurningResultActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  AOldNextSection: Integer;
  ANewNextSection: Integer;
  AVehType: Integer;
  AComplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionChangeTurningProbAction(
  ASectionID: Integer;
  ANumNewProb: Integer;
  var ANextSection: Integer;
  var aNewProb: Double;
  AVehTypePos: Integer
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionDisableReservedLaneAction(
  ASectionID: Integer;
  ALine: Integer;
  AANG_SegmentID: Integer
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionDisableReservedLaneActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ALane: Integer;
  AANG_SegmentID: Integer
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddEnRouteAssignmentAction(
  AActionID: Integer;
  AANG_SectionID: Integer;
  ASectionInPath: Integer;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  AAcomplianceLevel: Double;
  AReevaluateAction: Boolean;
  ARouteChoiceType: Integer;
  ARouteChoiceParam1: Double;
  ARouteChoiceParam2: Double;
  ARouteChoiceParam3: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionCongestionPricingODAction(
  AActionID: Integer;
  AANG_SectionID: Integer;
  AANG_HOTSection: Integer;
  AOrigin: Integer;
  ADest: Integer;
  AVehTypePos: Integer;
  AAcomplianceLevel: Double;
  AVisibilityDistance: Double;
  AType: Integer;
  AIsTolled: Boolean;
  AGPSection: Integer;
  AMethod: Integer;
  AThreshold: Double;
  ALogitScaleFactor: Double;
  APenalisationGPL: Double;
  APenalisationHOTL: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

procedure AKIActionRemoveAction(
  AA2KAction: Pointer
  );
  cdecl; external A2KERNEL_DLL;

procedure AKIActionRemoveActionByID(
  AActionID: Integer
  );
  cdecl; external A2KERNEL_DLL;

procedure AKIActionReset;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathODAction(
  AANG_SectionID: Integer;
  ANumNextSections: Integer;
  ANextSections: PInteger;
  AOrigin: Integer;
  ADest: Integer;
  AVehTypePos: Integer;
  ASectionInPath: Integer;
  AAcomplianceLevel: Double;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathResultAction(
  AANG_SectionID: Integer;
  ANumNextSections: Integer;
  ANextSections: PInteger;
  AVehTypePos: Integer;
  AAcomplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathODActionByID(
  AActionID: Integer;
  AANG_SectionID: Integer;
  ANumNextSections: Integer;
  ANextSections: PInteger;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  ASectionInPath: Integer;
  AAcomplianceLevel: Double;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathResultActionByID(
  AActionID: Integer;
  AANG_SectionID: Integer;
  ANumNextSections: Integer;
  ANextSections: PInteger;
  AVehType: Integer;
  AAcomplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathPTAction(
  AANG_SectionID: Integer;
  ANumSections: Integer;
  ASections: PInteger;
  ALineID: Integer;
  AVehTypePos: Integer;
  AAcomplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddNextSubPathAndStopsPTAction(
  AANG_SectionID,
  ANumSections: Integer;
  ASections: PInteger;
  AStops: PInteger;
  var ADwellTime: Double;
  var AOffset: Double;
  ALineID: Integer;
  AVehType: Integer;
  AAcomplianceLevel: Double;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

procedure AKIActionAddCloseTurningODAction(
  ASectionID: Integer;
  ANewSection2Close,
  AOrigin: Integer;
  ADest: Integer;
  AVehTypePos: Integer;
  AAcomplianceLevel: Double;
  AVisibilityDistance: Double = 200.0;
  ALocalEffect: Boolean = True;
  AIsDUE: Boolean = False);
  cdecl; external A2KERNEL_DLL;

function AKIActionAddCloseTurningODActionByID(
  AActionID: Integer;
  ASectionID,
  ANewSection2Close: Integer;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  AAcomplianceLevel: Double;
  AVisibilityDistance: Double = 200.0;
  ALocalEffect: Boolean = True
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextTurningODAction(
  AA2KAction: Pointer;
  AAcomplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextTurningODActionByID(
  AActionID: Integer;
  AAcomplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextTurningResultAction(
  AA2KAction: Pointer;
  AAcomplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextTurningResultActionByID(
  AActionID: Integer;
  AComplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyChangeDestAction(
  AA2KAction: Pointer;
  AAcomplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyChangeDestActionByID(
  AActionID: Integer;
  AComplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextSubPathResultAction(
  AA2KAction: Pointer;
  AAcomplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextSubPathResultActionByID(
  AActionID: Integer;
  AComplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextSubPathODAction(
  AA2KAction: Pointer;
  AAcomplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyNextSubPathODActionByID(
  AActionID: Integer;
  AComplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyCloseTurningODAction(
  AA2KAction: Pointer;
  AAcomplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

procedure AKIActionModifyCloseTurningODActionByID(
  AActionID: Integer;
  AComplianceLevel: Double);
  cdecl; external A2KERNEL_DLL;

// .......................................
// 2. INFORMATION OF FORCE TURNINGS
// .......................................
type
  A2KSubPathProportion = record
    NumSections: Integer;
    SubPath: ^Integer;
    Percentage: Double;
  end;

type
  A2KDestinationProportion = record
    NewDest: Integer;
    Percentage: Double;
    NumSubpaths: Integer;
    SubParths: ^A2KSubPathProportion;
  end;

  PA2KDestinationProportion = ^A2KDestinationProportion;

function AKIActionAddForceTurningODActionByID(
  AActionID: Integer;
  ASectionID,
  ANumNextSections: Integer;
  ANextSections: PA2KDestinationProportion;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  ASectionInPath: Integer;
  AComplianceLevel: Double;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddForceTurningODSubPathActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ANumNextSections: Integer;
  ANextSections: PA2KDestinationProportion;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  ASectionInPath: Integer;
  AComplianceLevel: Double;
  AVisibilityDistance: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddForceTurningResultActionByID(
  AActionID: Integer;
  ASectionID,
  AOldNextSection: Integer;
  ANumNewNextSections: Integer;
  ANewNextSections: PA2KDestinationProportion;
  AVehType: Integer;
  AComplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddForceTurningResultSubPathActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ANumNewNextSections: Integer;
  ANewNextSections: PA2KDestinationProportion;
  AVehType: Integer;
  AComplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 3.	REROUTING
// .......................................
function AKIActionAddChangeDestActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ANumNextSections: Integer;
  ANewDests: PA2KDestinationProportion;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  AComplianceLevel: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

function AKIActionAddChangeDestParkRideActionByID(
  AActionID: Integer;
  ASectionID: Integer;
  ANumNextSections: Integer;
  ANewDests: PA2KDestinationProportion;
  AOrigin: Integer;
  ADest: Integer;
  AVehType: Integer;
  AComplianceLevelL: Double;
  AScaleFactor: Double
  ): Pointer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 4. INFORMATION OF GENERAL VEHICLES
// .......................................
const
  AKIInfVehGetMem            = - 4001;
  AKIInfVehUnknownSection    = - 4002;
  AKIInfIndexNotValid        = - 4003;
  AKIInfNotReady             = - 4004;
  AKIInfVehUnknownJunction   = - 4005;
  AKIInfVehNotFound          = - 4006;
  AKIInfVehInvalidParam      = - 4007;
  AKIVehInvalidVehicleTypeID = - 4008;
  AKIInfVehNotAvalaible      = - 1;

type
  InfVeh = record
    Report: Integer;
    VehID: Integer;
    Type_: Integer;
    SectionID: Integer;
    Segment: Integer;
    LaneID: Integer;
    JunctionID: Integer;
    FromSectionID: Integer;
    FromLaneID: Integer;
    ToSectionID: Integer;
    ToLaneID: Integer;
    CurrentPos: Double;
    Distance2End: Double;
    CurrentPos_X: Double;
    CurrentPos_Y: Double;
    CurrentPos_Z: Double;
    CurrentPosBack_X: Double;
    CurrentPosBack_Y: Double;
    CurrentPosBack_Z: Double;
    CurrentSpeed: Double;
    PreviousSpeed: Double;
    TotalDistance: Double;
    SystemEntranceT: Double;
    SectionEntranceT: Double;
    CurrentStopTime: Double;
    Stopped: Boolean;
  end;

type
  StaticInfVeh = record
    Report: Integer;
    VehID: Integer;
    Type_: Integer;
    Length: Double;
    Width: Double;
    MaxDesiredSpeed: Double;
    MaxAcceleration: Double;
    NormalDeceleration: Double;
    MaxDeceleration: Double;
    SpeedAcceptance: Double;
    MinDistanceVeh: Double;
    MinSafetyDistance: Double;
    GiveWayTime: Double;
    GuidanceAcceptance: Double;
    Enrouted: Integer;
    Equipped: Integer;
    Tracked: Integer;
    KeepFastlane: Boolean;
    SafetyMarginFactor: Double;
    HeadwayMin: Double;
    SensitivityFactor: Double;
    ReactionTime: Double;
    ReactionTimeAtStop: Double;
    ReactionTimeAtTrafficLight: Double;
    LaneChangingCooperation: Boolean;
    LaneChangingAggressivenessLevel: Double;
    DistanceZoneFactor: Double;
    CentroidOrigin: Integer;
    CentroidDest: Integer;
    ExitSectionID: Integer;
    LineID: Integer;
    InternalInfo: Pointer;
    Margin2Overtake: Double;
    TM: Double;
    TA: Double;
    TC: Double;
    TS: Double;
    VelMaxOvertaking: Double;
    AStateFactor: Double;
    BStateFactor: Double;
    TripNumber: Integer;
    TimetableDev: SmallInt;
    TrainLength: Integer;
    Priority: Integer;
    LineNumber: Integer;
    RouteNumber: Integer;
  end;

type
  VehPos = record
    XPos: Double;
    YPos: Double;
    ZPos: Double;
    XPosBack: Double;
    YPosBack: Double;
    ZPosBack: Double;
  end;

  PVehPos = ^VehPos;

type
  InfVehPos = record
    Report: Integer;
    VehID: Integer;
    Npos: Integer;
    VehiclePos: PVehPos;
  end;

type
  GraphicInfVeh = record
    Report: Integer;
    VehID: Integer;
    LeftTurnSignal: Boolean;
    RightTurnSignal: Boolean;
    BrakeLight: Boolean;
    DrivingBackwards: Boolean;
  end;

function AKIRemoveVehicle(
  ASectionID: Integer;
  AVehIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehEnableGraphicalInf(AAlways: Boolean = False
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehDisableGraphicalInf: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbVehiclesSection(
  ASectionID: Integer;
  AConsiderAllSegments: Boolean
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetVehicleInfSection(
  ASectionID: Integer;
  AVehIndex: Integer
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleStaticInfSection(
  ASectionID: Integer;
  AVehIndex: Integer
  ): StaticInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehSetVehicleStaticInfSection(
  ASectionID: Integer;
  AVehIndex: Integer;
  AStaticinfVeh: StaticInfVeh
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosSection(
  ASectionID: Integer;
  AVehIndex: Integer;
  ANumPos: Integer
  ): InfVehPos;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosSectionWithStruct(
  ASectionID: Integer;
  AVehIndex: Integer;
  ANumPos: Integer;
  var aInfVehPos: InfVehPos
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGraphicInfSection(
  ASectionID: Integer;
  AVehIndex: Integer
  ): GraphicInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehSetDrivingBackwards(
  ASectionID: Integer;
  AVehIndex: Integer;
  AValue: Boolean
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbVehiclesJunction(
  AJunction: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetVehicleInfJunction(
  AJunction: Integer;
  AVehIndex: Integer
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleStaticInfJunction(
  AJunction: Integer;
  AVehIndex: Integer
  ): StaticInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehSetVehicleStaticInfJunction(
  AJunction: Integer;
  AVehIndex: Integer;
  AStaticinfVeh: StaticInfVeh
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosJunction(
  AJunction: Integer;
  AVehIndex: Integer;
  ANumPos: Integer
  ): InfVehPos;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGetPosJunctionWithStruct(
  AJunction: Integer;
  AVehIndex: Integer;
  ANumPos: Integer;
  var AInfVehPos: InfVehPos
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehicleGraphicInfJunction(
  AJunction: Integer;
  AVehIndex: Integer
  ): GraphicInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetInf(AVehID: Integer
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetStaticInf(
  AVehID: Integer
  ): StaticInfVeh; cdecl;
  external A2KERNEL_DLL;

function AKIVehSetStaticInf(
  AVehID: Integer;
  AStaticinfVeh: StaticInfVeh
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetNbVehTypes: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetIDVehTypeANG(
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetMinLengthVehType(
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetMaxLengthVehType(
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehTypeName(
  AVehTypePos: Integer
  ): PChar;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetVehTypeInternalPosition(
  AVehTypeID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetLeaderID(
  AVehID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehGetFollowerID(
  AVehID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetImprudentLaneChanging(
  AVehTypeID: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetImprudentLaneChanging(
  AVehTypeID: Integer;
  AValue: Boolean
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetPercentageForStayingInFastLane(
  AVehTypeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetPercentageForStayingInFastLane(
  AVehTypeID: Integer;
  ANewPercentage: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetOvertakeSpeedThreshold(
  AVehTypeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetOvertakeSpeedThreshold(
  AVehTypeID: Integer;
  ANewPercentage: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeGetLaneRecoverySpeedThreshold(
  AVehTypeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIVehTypeSetLaneRecoverySpeedThreshold(
  AVehTypeID: Integer;
  ANewPercentage: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbSectionsVehiclePathJunction(
  AJunctionID: Integer;
  AVehIndex: Integer;
  AStartSectionID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetIDSectionVehiclePathJunction(
  AJunctionID: Integer;
  AVehIndex: Integer;
  ASectionID: Integer;
  ASectionIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetNbSectionsVehiclePathSection(
  ASectionID: Integer;
  AVehIndex: Integer;
  AStartSectionID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehStateGetIDSectionVehiclePathSection(
  ASectionID: Integer;
  AVehIndex: Integer;
  AStartSectionID: Integer;
  ASectionIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetNbSectionsVehiclePath(
  AVehID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetIDSectionVehiclePath(
  AVehID: Integer;
  ASectionIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIRemoveVehicleJunction(
  AJunctionID: Integer;
  AVehIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

procedure AKIVehTrackedRemove(
  AVehID: Integer
  );
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedSetLanesTrajectory(
  AVehID: Integer;
  ANumSegmentsInTrajectory: Integer;
  ASectIDs: PInteger;
  ALanes: PInteger;
  ALastSectionID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 5. INFORMATION OF DETECTORS AND DETECTORS MEASURES
// .......................................
const
  AKIDETUnknownDetector       = - 3010;
  AKIDETIncorrectInterval     = - 3011;
  AKIDETMeasureNotGathered    = - 3012;
  AKIDETNoAggregatedDetection = - 3013;
  AKIDETNoInstantDetection    = - 3015;

type
  StructA2KDetector = record
    Report: Integer;
    ID: Integer;
    SectionID: Integer;
    FirstLaneID: Integer;
    LastLaneID: Integer;
    Capabilities: Integer;
    InitialPosition: Double;
    FinalPosition: Double;
  end;

type
  EquippedInfVeh = record
    Report: Integer;
    TimeDetected: Double;
    VehID: Integer;
    VehType: Integer;
    Speed: Double;
    Headway: Double;
    PTLineID: Integer;
  end;

function AKIDetGetNumberDetectors: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetIDDetector(
  ANumDet: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetPropertiesDetector(
  ANumDet: Integer
  ): StructA2KDetector;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetPropertiesDetectorByID(
  ADetID: Integer
  ): StructA2KDetector;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsCountGather(
  ACapability: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsPresenceGather(
  ACapability: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsSpeedGather(
  ACapability: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsOccupancyGather(
  ACapability: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsHeadwayGather(
  ACapability: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsDensityGather(
  ACapability: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIDetIsInfEquippedVehGather(
  ACapability: Integer
  ): Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetIntervalDetection(
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetCycleInstantDetection(
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbMeasuresAvailableInstantDetection(
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetEndTimeMeasureAvailableInstantDetection(
  AElem: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetSCOOTOccupancyCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetFinTimeOccupedCyclebyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetIniTimeOccupedCyclebyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbintervalsOccupedCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetCounterCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetSpeedCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetTimeOccupedCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetPresenceCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetHeadwayCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetDensityCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsEquippedInDetectionCyclebyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionStaticInfVehCyclebyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer
  ): StaticInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionInfVehCyclebyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsEquippedOverCyclebyId(
  ADetID: Integer;
  AVehType: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehOverStaticInfVehCyclebyId(
  ADetID: Integer;
  AElem: Integer;
  AVehType: Integer
  ): StaticInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehOverInfVehCyclebyId(
  ADetID: Integer;
  AElem: Integer;
  AVehType: Integer
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetSCOOTOccupancyInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetIniTimeOccupedInstantDetectionbyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetEndTimeOccupedInstantDetectionbyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbintervalsOccupedInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetCounterInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetSpeedInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetTimeOccupedInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetPresenceInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetHeadwayInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetDensityInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsEquippedInDetectionInstantDetectionbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionStaticInfVehInstantDetectionbyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): StaticInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionInfVehInstantDetectionbyId(
  ADetID: Integer;
  AElem: Integer;
  AVehTypePos: Integer;
  AEndTime: Double
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsEquippedOverInstantDetectionbyId(
  ADetID,
  AVehType: Integer;
  AEndTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInOverStaticInfVehInstantDetectionbyId(
  ADetID, AElem,
  AVehType: Integer;
  AEndTime: Double
  ): StaticInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehOverInfVehInstantDetectionbyId(
  ADetID, AElem,
  AVehType: Integer;
  AEndTime: Double
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetCounterAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetSpeedAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetTimeOccupedAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetPresenceAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetDensityAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetHeadwayAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetNbVehsInDetectionAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetGetInfVehInDetectionAggregatedbyId(
  ADetID: Integer;
  AVehTypePos: Integer;
  AElem: Integer
  ): EquippedInfVeh;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 6. DETECTOR CLICKABLE EVENTS
// .......................................
const
  AKIDetectorEventsNoTraffic = - 10000;

function AKIDetectorEventsEnable(
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIDetectorEventsDisable(
  ): Integer;
  cdecl; external A2KERNEL_DLL;

procedure AKIDetectorEventsAddEvent(
  ADetID: Integer;
  AIniTime: Double;
  AEndTime: Double;
  AVehTypePos: Integer;
  ASpeed: Double;
  ALength: Double;
  APTLineID: Integer); 
  cdecl; external A2KERNEL_DLL;

procedure AKIDetectorEventsClear();
  cdecl; external A2KERNEL_DLL;

// .......................................
// 7. INFORMATION OF IDENTIFIERS OF SECTIONS AND JUNCTIONS
// .......................................
const
  AKIInfNetGetMem          = - 5001;
  AKIInfUnknownID          = - 5002;
  AKIInfUnknownTurning     = - 5003;
  AKIInfUnknownFromSection = - 5004;
  AKIInfUnknownToSection   = - 5005;
  AKIInfNoPath             = - 5006;

type
  A2KSectionInf = record
    Report: Integer;
    ID: Integer;
    AngID: Integer;
    NumCentralLanes: Integer;
    NumSideLanes: Integer;
    SpeedLimit: Double;
    ReservedLanesVisibilityDistance: Double;
    YellowBoxSpeed: Double;
    Capacity: Double;
    Distance_OnRamp: Double;
    Distance_OnRampMerge: Double;
    Cooperation_OnRamp: Double;
    Length: Double;
    NumSegments: Integer;
    SlopePercentage: PDouble;
    UserDefinedCost: Double;
    ReactionTimeVariation: Integer;
    ReactionTimeAtTrafficLightVariation: Double;
    ReactionTimeAtStopVariation: Double;
    ImprudentLaneChanging: Boolean;
    NumTurnings: Integer;
    CapacityDropModel: Boolean;
  end;

type
  A2KSectionBehaviourParam = record
    SpeedLimit: Double;
    ReservedLanesVisibilityDistance: Double;
    YellowBoxSpeed: Double;
    Capacity: Double;
    Distance_OnRamp: Double;
    Distance_OnRampMerge: Double;
    Cooperation_OnRamp: Double;
    UserDefinedCost: Double;
    ReactionTimeVariation: Integer;
    ReactionTimeAtTrafficLightVariation: Double;
    ReactionTimeAtStopVariation: Double;
    ImprudentLaneChanging: Boolean;
    CapacityDroModel: Boolean;
  end;

type
  A2KCentroidInf = record
    Report: Integer;
    ID: Integer;
    AsDestConsider_Percentage: Boolean;
    AsOrigConsider_Percentage: Boolean;
    IsOrigin: Boolean;
    IsDestination: Boolean;
    NumConnecTo: Integer;
    NumConnecFrom: Integer;
  end;

type
  A2KTurnInf = record
    Report: Integer;
    ID: Integer;
    Length: Double;
    SpeedLimit: Double;
    OriginSectionID: Integer;
    DestinationSectionID: Integer;
    OriginFromLane: Integer;
    OriginToLane: Integer;
    DestinationFromLane: Integer;
    DestinationToLane: Integer;
  end;

type
  A2KTurnBehaviourParam = record
    SpeedLimit: Double;
    YellowBoxSpeed: Double;
    DistanceZone1: Double;
    DistanceZone2: Double;
    WaitingTimeBeforeLosingTurn: Double;
    SafetyMarginFront: Double;
    SafetyMarginBack: Double;
    MinGap: Double;
    MaxGap: Double;
    MinGiveWayTimeFactor: Double;
    MaxGiveWayTimeFactor: Double;
    visibilityDistance: Double;
    VisitilityDistanceMainStream: Double;
  end;

function AKIInfNetGetUnits: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetWorldCoordinates(
  var min_x: Double;
  var min_y: Double;
  var max_x: Double;
  var max_y: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetNbSectionsANG(
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetSectionANGId(
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetSectionANGInf(
  AID: Integer
  ): A2KSectionInf;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIDSectionANGDestinationofTurning(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetDestinationFromLaneofTurning(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetDestinationToLaneofTurning(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetOriginFromLaneofTurning(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetOriginToLaneofTurning(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetNbTurns: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurnId(
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurnInf(
  AID: Integer
  ): A2KTurnInf;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetNbTurnsInNode(
  ANodeID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetOriginSectionInTurn(
  ANodeID: Integer;
  AIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetDestinationSectionInTurn(
  ANodeID: Integer;
  AIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurnInfo(
  ANodeID: Integer;
  AIndex: Integer
  ): A2KTurnInf;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetSetTurnBehaviouralParam(
  AID: Integer;
  ABehaviourParam: A2KTurnBehaviourParam
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurnBehaviouralParam(
  ATurnID: Integer;
  var AReport: Integer
  ): A2KTurnBehaviourParam;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningId(
  AOriginSection: Integer;
  ADestinationSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningDestinationFromLane(
  AOriginSection: Integer;
  ADestinationSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningDestinationToLane(
  AOriginSection: Integer;
  ADestinationSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningOriginFromLane(
  AOriginSection: Integer;
  ADestinationSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTurningOriginToLane(
  AOriginSection: Integer;
  ADestinationSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetSetSectionBehaviouralParam(
  AID: Integer;
  ABehaviourParam: A2KSectionBehaviourParam;
  AIsAllsegments: Boolean
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetSectionBehaviouralParam(
  ASectionID: Integer;
  var AReport: Integer
  ): A2KSectionBehaviourParam;
  cdecl; external A2KERNEL_DLL;

function AKISetSectionCapacity(
  AID: Integer;
  ACapacity: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKISetSectionUserDefinedCost(
  AID: Integer;
  AUserDefinedCost: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKISetSectionUserDefinedCost2(
  AID: Integer;
  AUserDefinedCost: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKISetSectionUserDefinedCost3(
  AID: Integer;
  AUserDefinedCost: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIGetSectionCapacity(
  AID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetSectionUserDefinedCost(
  AID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetSectionUserDefinedCost2(
  AID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetSectionUserDefinedCost3(
  AID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetNbJunctions: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetJunctionId(
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetNbCentroids: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetCentroidId(
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetCentroidInf(
  AID: Integer
  ): A2KCentroidInf;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIDSectionofOriginCentroidConnector(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIDSectionofDestinationCentroidConnector(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIDSectionANGofOriginCentroidConnector(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetIDSectionANGofDestinationCentroidConnector(
  AID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetShortestPathNbSections(
  AFromSection: Integer;
  AToSection: Integer;
  ASectionColumnCost: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetShortestPath(
  AFromSection: Integer;
  AToSection: Integer;
  ASectionColumnCost: Pointer;
  var APath: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 8. INFORMATION OF PATH & NAMES
// .......................................
const
  ODMatrixDemand = 1;
  StateDemand    = 2;

function AKIInfNetGetNetworkPath: PChar;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetNetworkName(
  ): PChar;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTrafficDemandName(
  ): PChar;
  cdecl; external A2KERNEL_DLL;

function AKIInfNetGetTrafficDemandType(
  ): Integer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 9. STATISTICAL INFORMATION
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
  StructAkiEstadSystem = record
    Report: Integer;
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
    VirtualQueueAvg: Double;
    VirtualQueueMax: Integer;
    Count: Integer;
    InputFlow: Integer;
    InputCount: Integer;
    VehsWaiting: Integer;
    VehIn: Integer;
    VehsLostIn: Integer;
    VehsLostOut: Integer;
    MissedTurns: Double;
    LaneChanges: Double;
    TotalLaneChanges: Double;
  end;

type
  StructAkiEstadSection = record
    Report: Integer;
    ID: Integer;
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
    VirtualQueueAvg: Double;
    VirtualQueueMax: Integer;
    Count: Integer;
    InputFlow: Integer;
    InputCount: Integer;
    FlowCapacity: Double;
    LaneChanges: Double;
    TotalLaneChanges: Double;
  end;

type
  StructAkiEstadTurning = record
    Report: Integer;
    FromSectionID: Integer;
    ToSectionID: Integer;
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
    LaneChanges: Double;
    TotalLaneChanges: Double;
  end;

type
  StructAkiEstadSectionLane = packed record
    Report: Integer;
    sectionID: Integer;
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
    Report: Integer;
    OriginID: Integer;
    DestID: Integer;
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
    VirtualQueueAvg: Double;
    VirtualQueueMax: Double;
    TotalTravel: Double;
    TotalTravelTime: Double;
    VehLost: Integer;
  end;

type
  StructAkiEstadStream = record
    Report: Integer;
    ID: Integer;
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
    VirtualQueueAvg: Double;
    VirtualQueueMax: Double;
    TotalTravel: Double;
    TotalTravelTime: Double;
  end;

type
  StructAkiEstadDetector = record
    Report: Integer;
    ID: Integer;
    Flow: Integer;
    Sa: Double;
    Density: Double;
    Occupancy: Double;
    Headway: Double;
  end;

function AKIIsGatheringStatistics: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetIntervalStatistics: Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstIsNewStatisticsAvailable: Boolean;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSection(
  AArcID: Integer;
  AVehTypePos: Integer
  ): StructAkiEstadSection;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSection(
  AArcID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): StructAkiEstadSection;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsSection(
  AArcID: Integer;
  AVehType: Integer
  ): StructAkiEstadSection;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSectionLane(
  AArcID: Integer;
  ALaneIndex: Integer;
  AVehTypePos: Integer
  ): StructAkiEstadSectionLane;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSectionLane(
  AArcID: Integer;
  ALaneIndex: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): StructAkiEstadSectionLane;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsSectionLane(
  AArcID: Integer;
  ALaneIndex: Integer;
  AVehType: Integer
  ): StructAkiEstadSectionLane;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsTurning(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehTypePos: Integer
  ): StructAkiEstadTurning;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsTurning(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): StructAkiEstadTurning;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsTurning(
  AFromSecionID: Integer;
  AToSectionID: Integer;
  AVehType: Integer
  ): StructAkiEstadTurning;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsLink(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehTypePos: Integer
  ): StructAkiEstadTurning;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsLink(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): StructAkiEstadTurning;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsLink(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehType: Integer
  ): StructAkiEstadTurning;
  cdecl; external A2KERNEL_DLL;

function AKIGetTotalLengthSystem(
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSystem(
  AVehTypePos: Integer
  ): StructAkiEstadSystem;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSystem(
  ATimeSta: Double;
  AVehTypePos: Integer
  ): StructAkiEstadSystem;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsODPair(
  AOriginID: Integer;
  ADestinationID: Integer;
  AVehTypePos: Integer
  ): StructAkiEstadODPair;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsODPair(
  AOriginID: Integer;
  ADestinationID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): StructAkiEstadODPair;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsStream(
  AStreamID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): StructAkiEstadStream;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsStream(
  AStreamID: Integer;
  AVehTypePos: Integer
  ): StructAkiEstadStream;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetInstantVirtualQueueSection(
  AArcID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsNodeLostVehicles(
  ANodeID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetPartialStatisticsNodeLostVehicles(
  ANodeID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsNodeApproachDelay(
  ANodeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetPartialStatisticsNodeApproachDelay(
  ANodeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsNodeMissedTurns(
  ANodeID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetPartialStatisticsNodeMissedTurns(
  ANodeID: Integer;
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsNodeLevelOfService(
  ANodeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetPartialStatisticsNodeLevelOfService(
  ANodeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

//Pollutants and emission statistics
function AKIEstGetGlobalStatisticsSectionFuelCons(
  AArcID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSectionFuelCons(
  AArcID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsSectionFuelCons(
  AArcID: Integer;
  AVehType: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsTurningFuelCons(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsTurningFuelCons(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsTurningFuelCons(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehType: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsLinkFuelCons(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsLinkFuelCons(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsLinkFuelCons(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehType: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSystemFuelCons(
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSystemFuelCons(
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsODPairFuelCons(
  AOriginID: Integer;
  ADestinationID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsODPairFuelCons(
  AOriginID: Integer;
  ADestinationID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsStreamFuelCons(
  AStreamID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsStreamFuelCons(
  AStreamID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetNbPollutants: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetPollutantName(
  AIndex: Integer
  ): PChar;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSectionPollution(
  APolIndex: Integer;
  AArcID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSectionPollution(
  APolIndex: Integer;
  AArcID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsSectionPollution(
  APolIndex: Integer;
  AArcID: Integer;
  AVehType: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsTurningPollution(
  APolIndex: Integer;
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsTurningPollution(
  APolIndex: Integer;
  AFromSectionID: Integer;
  AToSectionID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsTurningPollution(
  APolIndex: Integer;
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehType: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsLinkPollution(
  APolIndex: Integer;
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsLinkPollution(
  APolIndex: Integer;
  AFromSectionID: Integer;
  AToSectionID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetCurrentStatisticsLinkPollution(
  APolIndex: Integer;
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehType: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsSystemPollution(
  APolIndex: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsSystemPollution(
  APolIndex: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsODPairPollution(
  APolIndex: Integer;
  AOriginID: Integer;
  ADestinationID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsODPairPollution(
  APolIndex: Integer;
  AOriginID: Integer;
  ADestinationID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsStreamPollution(
  APolIndex: Integer;
  AStreamID: Integer;
  ATimeSta: Double;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsStreamPollution(
  APolIndex: Integer;
  AStreamID: Integer;
  AVehTypePos: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetGlobalStatisticsDetector(
  ADetID: Integer;
  AVehType: Integer
  ): StructAkiEstadDetector;
  cdecl; external A2KERNEL_DLL;

function AKIEstGetParcialStatisticsDetector(
  ADetID: Integer;
  ATime: Double;
  AVehType: Integer
  ): StructAkiEstadDetector;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 10. VEHICLE ENTRANCE
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

procedure AKIEnterVehTrafficFlow(
  ASectionID: Integer;
  AVehTypePos: Integer;
  ATracking: Integer = 0);
  cdecl; external A2KERNEL_DLL;

procedure AKIEnterVehTrafficOD(
  ASectionID: Integer;
  AVehTypePos: Integer;
  ACentroidOriginID: Integer;
  ACentroidDest: Integer;
  ATracking: Integer = 0);
  cdecl; external A2KERNEL_DLL;

procedure AKIPutVehTrafficFlow(
  ASectionID: Integer;
  ALaneID: Integer;
  AVehTypePos: Integer;
  AInitPosition, aInitSpeed: Double;
  ANextSection: Integer;
  ATracking: Integer);
  cdecl; external A2KERNEL_DLL;

procedure AKIPutVehTrafficOD(
  ASectionID: Integer;
  ALaneID: Integer;
  AVehTypePos: Integer;
  ACentroidOrigin: Integer;
  ACentroidDest: Integer;
  AInitPosition: Double;
  aInitSpeed: Double;
  ATracking: Integer);
  cdecl; external A2KERNEL_DLL;

type
  InfArrival = record
    Report: Integer;
    VehID: Integer;
    InVirtualQueue: Boolean;
    EntranceSection: Integer;
  end;

function AKIGenerateArrivalTrafficFlow(
  ASectionID: Integer;
  AVehTypePos: Integer;
  AUseVirtualQueue: Integer
  ): InfArrival;
  cdecl; external A2KERNEL_DLL;

function AKIGenerateArrivalTrafficOD(
  AVehTypePos: Integer;
  ACentroidOriginID: Integer;
  ACentroidDest: Integer;
  AUseVirtualQueue: Integer
  ): InfArrival;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 11. VEHICLE TRACKED MANAGE
// .......................................
const
  AKIVehNotTracked             = - 7012;
  AKIVehInvalidParameter       = - 7013;
  AKIVehNextSectionUnreachable = - 7014;

function AKIVehTrackedModifySpeed(
  AVehID: Integer;
  newSpeed: Double
  ): Integer;

  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedForceSpeed(
  AVehID: Integer;
  ANewSpeed: Double
  ): Integer;

  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedModifyLane(
  AVehID: Integer;
  nextLane: Integer
  ): Integer;

  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedModifyNextSection(
  AVehID: Integer;
  nextSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedModifyNextSections(
  AVehID: Integer;
  ANumNextSections: Integer;
  ANextSections: PInteger
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedModifyNextTargetLaneInNextSection(
  AVehID: Integer;
  ANextSection: Integer;
  ANextLane: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedDelete(
  AVehID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehSetAsTracked(
  AVehID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehSetAsTrackedbyPointer(
  AVeh: Pointer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehSetAsNoTracked(
  AVehID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 12. INFORMATION OF VEHICLE TRACKED
// .......................................
type
  DynInfVeh = record
    XCurrentPos: Double;
    YCurrentPos: Double;
    XCurrentPosBack: Double;
    YCurrentPosBack: Double;
    CurrentSpeed: Double;
    Turning: Integer;
  end;

function AKIVehTrackedGetStaticInf(
  AVehID: Integer
  ): StaticInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetInf(
  AVehID: Integer
  ): InfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedSetStaticInf(
  AVehID: Integer;
  AStaticinfVeh: StaticInfVeh
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetPos(
  AVehID: Integer;
  ANumPos: Integer
  ): InfVehPos;
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetPosWithStruct(
  AVehID: Integer;
  ANumPos: Integer;
  var aInfVehPos: InfVehPos
  ): Integer;
  cdecl; external A2KERNEL_DLL;

procedure AKIVehSetVehicleTrackedDynInf(
  AVehID: Integer;
  ADynInfVeh: DynInfVeh);
  cdecl; external A2KERNEL_DLL;

function AKIVehTrackedGetGraphicInf(
  AVehID: Integer
  ): GraphicInfVeh;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 13. INFORMATION OF RUN TIME SIMULATION
// .......................................
function AKIGetCurrentSimulationTime: Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetTimeSta: Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetIniSimTime: Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetEndSimTime: Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetDurationTransTime: Double;
  cdecl; external A2KERNEL_DLL;

function AKIGetSimulationStepTime: Double;
  cdecl; external A2KERNEL_DLL;

function AKISetEndSimTime(
  ATime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 14. INFORMATION OF REPLICATION
// .......................................
function AKIGetRandomNumber: Double;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 15. MANAGING OF INCIDENTS
// .......................................
const
  AKIIncidentWrongIniTime   = - 8001;
  AKIIncidentWrongPosition  = - 8002;
  AKIIncidentUnknownLane    = - 8003;
  AKIIncidentUnknownSection = - 8004;
  AKIIncidentNotPresent     = - 8005;
  AKIIncidentWrongLength    = - 8006;
  AKIIncidentWrongDuration  = - 8007;

function AKIGenerateIncident(
  ASection: Integer;
  ALane: Integer;
  APosition: Double;
  ALength: Double;
  AIniTime: Double;
  aDuration: Double;
  AVisibilityDistance: Double;
  ADoUpdateIDGroup: Boolean
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIGenerateIncidentDistancePerVehType(
  ASection: Integer;
  ALane: Integer;
  APosition: Double;
  ALength: Double;
  AIniTime: Double;
  aDuration: Double;
  AVisibilityDistanceGeneral: Double;
  ANumVehTypes: Integer;
  AVehType: PInteger;
  AVisibilityDistances: PDouble;
  AUpdateidGroup: Boolean;
  AApplySpeedReduction: Boolean;
  AUpstreamDistanceSR: Double;
  ADownstreamDistanceSR: Double;
  AMaxSpeedSR: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIRemoveIncident(
  ASection: Integer;
  ALane: Integer;
  APosition: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIRemoveAllIncidentsInSection(
  ASection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIResetAllIncidents: Integer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 16. MANAGING OF Public Transport
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
  InfPTVeh = record
    Report: Integer;
    VehID: Integer;
    Type_: Integer;
    sectionID: Integer;
    Segment: Integer;
    NumberLane: Integer;
    JunctionID: Integer;
    FromSectionID: Integer;
    FromLaneID: Integer;
    ToSectionID: Integer;
    ToLaneID: Integer;
    CurrentPos: Double;
    Distance2End: Double;
    XCurrentPos: Double;
    YCurrentPos: Double;
    ZCurrentPos: Double;
    XCurrentPosBack: Double;
    YCurrentPosBack: Double;
    ZCurrentPosBack: Double;
    CurrentSpeed: Double;
    PreviousSpeed: Double;
    TotalDistance: Double;
    SystemEntranceT: Double;
    SectionEntranceT: Double;
    CurrentStopTime: Double;
    TheoricalGenerationTime: Double;
    NumStopsDone: Integer;
    ObservedLastStopTime: Double;
    ObservedLastInitialStopTime: Double;
    NextStopID: Integer;
    OffsetInNextStop: Double;
    DistanceNextStop: Double;
    NextServiceTime: Double;
    CurrentStoppedTimeInBusStop: Double;
    CurrentLoad: Integer;
  end;

type
  StaticInfPTVeh = record
    Report: Integer;
    VehID: Integer;
    Type_: Integer;
    Length: Double;
    Width: Double;
    MaxDesiredSpeed: Double;
    MaxAcceleration: Double;
    NormalDeceleration: Double;
    MaxDeceleration: Double;
    SpeedAcceptance: Double;
    MinDistanceVeh: Double;
    MinSafetyDistance: Double;
    GiveWayTime: Double;
    GuidanceAcceptance: Double;
    Enrouted: Integer;
    Equipped: Integer;
    Tracked: Integer;
    KeepFastlane: Boolean;
    SafetyMarginFactor: Double;
    HeadwayMin: Double;
    SensitivityFactor: Double;
    ReactionTime: Double;
    ReactionTimeAtStop: Double;
    ReactionTimeAtTrafficLight: Double;
    LaneChangingCooperation: Boolean;
    LaneChangingAggressivenessLevel: Double;
    DistanceZoneFactor: Double;
    MaxCapacity: Integer;
    LineID: Integer;
  end;

function AKIPTGetNumberLines: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTGetIDLine(
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTGetNumberSectionsInLine(
  ALineID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTGetIDSectionInLine(
  ALineID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTGetNumberStopsInLine(
  ALineID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTGetIDStopsInLine(
  ALineID: Integer;
  AElem: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTEnterVeh(
  ALineID: Integer;
  AVehTypePos: Integer;
  AIsTracked: Boolean
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTVehModifyStopTime(
  AVehID: Integer;
  ANStop: Integer;
  AStopTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTVehReroute(
  AVehID: Integer;
  ANumSections: Integer;
  ASections: PInteger;
  ANewStops: PInteger;
  ADwellTime: PDouble;
  AOffset: PDouble
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTVehGetStaticInf(
  AVehID: Integer
  ): StaticInfPTVeh;
  cdecl; external A2KERNEL_DLL;

function AKIPTVehSetStaticInf(
  AVehID: Integer;
  AStaticinfVeh: StaticInfVeh
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPTVehGetInf(AVehID: Integer
  ): InfPTVeh;
  cdecl; external A2KERNEL_DLL;

function AKIPTGetServiceTimeStopsInLine(
  AVehID: Integer;
  ANStop: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIPTVehSetCurrentLoad(
  AVehID: Integer;
  ACurrentLoad: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

// .......................................
// 17. PRINT INFORMATION IN XCONSOLE / LOG WINDOW
// .......................................
procedure AKIPrintStringEx(
  AString: String
  );

function AKIPrintString(
  AString: PAnsiChar
  ): Integer;
  cdecl; external A2KERNEL_DLL;

procedure AKIPrintAsUNICODEString(
  AString: PChar
  );
  cdecl; external A2KERNEL_DLL;

function AKIConvertToAsciiString(
  AString: PChar;
  ADeleteUshortString: Boolean;
  var AHasAnyNonAnsiChar: Boolean
  ): PAnsiChar;
  cdecl; external A2KERNEL_DLL;

function AKIConvertFromAsciiString(
  const AString: PAnsiChar
  ): PChar;
  cdecl; external A2KERNEL_DLL;

procedure AKIDeleteUNICODEString(AString: PChar);
  cdecl; external A2KERNEL_DLL;

//.........................................
// 18. ODDemand
//.........................................
const
  AKIODDemandNoTrafficOD       = - 11000;
  AKIODDemandIncorrectNumSlice = - 11002;
  AKIODDemandUnknownCentroid   = - 11003;
  AKIODDemandUnknownODPair     = - 11004;

function AKIODDemandGetNumSlicesOD(
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIODDemandGetIniTimeSlice(
  AVehTypePos: Integer;
  ASlice: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIODDemandGetEndTimeSlice(
  AVehTypePos: Integer;
  ASlice: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIODDemandGetDemandODPair(
  AOrigin: Integer;
  ADestination: Integer;
  AVehTypePos: Integer;
  ANumSlice: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIODDemandSetDemandODPair(
  AOrigin: Integer;
  ADestination: Integer;
  AVehTypePos: Integer;
  ANumSlice: Integer;
  ANewDemand: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

//.........................................
// 19. TrafficDemand
//........................................
const
  AKIStateDemandNoTrafficState    = - 15000;
  AKIStateDemandIncorrectNumSlice = - 15002;
  AKIStateDemandUnknownVehType    = - 15004;

function AKIStateDemandGetNumSlices(
  AVehTypePos: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIStateDemandGetIniTimeSlice(
  AVehTypePos: Integer;
  ANumSlice: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIStateDemandGetEndTimeSlice(
  AVehTypePos: Integer;
  ANumSlice: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIStateDemandGetDemandSection(
  ASectionID: Integer;
  AVehTypePos: Integer;
  ANumSlice: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIStateDemandSetDemandSection(
  ASectionID: Integer;
  AVehTypePos: Integer;
  ANumSlice: Integer;
  ANewFlow: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIStateDemandSetTurningPercentage(
  AFromSectionID: Integer;
  AToSectionID: Integer;
  AVehType: Integer;
  ANumSlice: Integer;
  ANewPercentage: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

//.........................................
// 20. PastCosts
//........................................
const
  AKIPastCostUnknownLink       = - 12001;
  AKIPastCostNoPerVehType      = - 12002;
  AKIPastCostPerVehType        = - 12003;
  AKIPastCostNoReaded          = - 12004;
  AKIPastCostIncorrectTypeName = - 12005;

function AKIPastCostAreCostsPerVehicleType: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPastCostGetIniTimeReaded: Double;
  cdecl; external A2KERNEL_DLL;

function AKIPastCostGetIntervalReaded: Double;
  cdecl; external A2KERNEL_DLL;

function AKIPastCostGetNbIntervalsReaded: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPastCostSetPastCost(
  ASectOrig: Integer;
  ASectSest: Integer;
  ATime: Double;
  AVehTypeID: Integer;
  ANewPastCost: Double;
  ANewPastOutCost: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIPastCostGetPastCost(
  ASectOrig: Integer;
  ASectSest: Integer;
  ATime: Double;
  AVehTypeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

function AKIPastCostGetPastOutputCost(
  ASectOrig: Integer;
  ASectSest: Integer;
  ATime: Double;
  AVehTypeID: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

//.........................................
// 21. Fleet Management
//........................................
const
  AKIFleetNotLoaded            = - 14001;
  AKIFleetVehUnknown           = - 14002;
  AKIFleetStopUnknown          = - 14003;
  AKIFleetVehNotSpace          = - 14005;
  AKIFleetVehUnFeasibleLane    = - 14006;
  AKIFleetSectUnknown          = - 14007;
  AKIFleetStopTypeUnknown      = - 14008;
  AKIFleetInvalidFleetID       = - 14009;
  AKIFleetRouteAlreadyAssigned = - 14010;
  AKIFleetSectNotConnected     = - 14011;
  AKIFleetRouteUnknown         = - 14012;
  AKIFleetFleetVehNotGenerated = - 14013;
  AKIFleetInvalidFirstSection  = - 14014;
  AKIFleetInvalidDistance      = - 14015;
  AKIFleetInvalidLane          = - 14016;

function AKIFleetGetNbFleet: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetFleetId: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetNbFleetStops: Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetFleetStopId(
  AIndex: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetNbFleetVehicles(
  AFleetID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetFleetVehicleName(
  AFleetID: Integer;
  AIndex: Integer
  ): PChar;
  cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleet(
  AID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleetStop(
  AID: Integer;
  AType: Integer;
  aSecttionID: Integer;
  ALaneID: Integer;
  ADistannce: Double;
  ALength: Double;
  aMaxVeh: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetModifyFleetStopTimeWindow(
  AID: Integer;
  AOpenTW: Double;
  ACloseTW: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleetAssignment(
  AFleetID: Integer;
  AFleetVehName: PChar;
  AVehTypePos: Integer;
  ADepartureTime: Double;
  ADeviation: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleetAssignmentRoute(
  AFleetID: Integer;
  AFleetVehName: PChar;
  ARouteID: Integer;
  ANumSect: Integer;
  var ASectionID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetAddFleetAssignmentStop(
  AFleetID: Integer;
  AFleetVehName: PChar;
  ANumStops: Integer;
  AStopsIDs: PInteger;
  var AAvgTime: Double;
  var ADevTime: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetIsFleetVehicleGenerated(
  AFleetID: Integer;
  AFleetVehID: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetCurrentSectionIDFleetVehicle(
  AFleetID: Integer;
  AFleetVehName: PChar
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetModifyRouteStopsFleetVehicle(
  AFleetID: Integer;
  AFleetVehName: PChar;
  ANumSect: Integer;
  var ASectID: Integer;
  ANumStops: Integer;
  AStopsIDs: PInteger;
  var AAvgTime: Double;
  var ADevTimeD: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetNbStopsFleetVeh(
  AFleetID: Integer;
  AFleetVehName: PChar
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetChangeStopTimeFleetVeh(
  AFleetID: Integer;
  AFleetVehName: PChar;
  AStopIndex: Integer;
  AServiceTime: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetNbStopsDoneFleetVeh(
  AFleetID: Integer;
  AFleetVehName: PChar
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetIsDoingStopFleetVeh(
  AFleetID: Integer;
  AFleetVehName: PChar
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIFleetGetStopTimeFleetVeh(
  AFleetID: Integer;
  AFleetVehName: PChar;
  AStopIndex: Integer
  ): Double;
  cdecl; external A2KERNEL_DLL;

//.........................................
// 22. Functions relative to path information
//.........................................
const
  AKIInfVehPathNotAvailable           = - 13001;
  AKIInfVehDestinationUnreachable     = - 13002;
  AKIInfVehInvalidDestinationCentroid = - 13003;

type
  PathInfVeh = record
    Report: Integer;
    VehID: Integer;
    Type_: Integer;
    EntranceSectionID: Integer;
    NumSectionsInPath: Integer;
    TotalDistance: Double;
  end;

function AKIVehInfPath(AVehID: Integer
  ): PathInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehInfPathSection(
  ASectionID: Integer;
  AVehIndex: Integer
  ): PathInfVeh;
  cdecl; external A2KERNEL_DLL;

function AKIVehInfPathGetNextSection(
  AVehID: Integer;
  AFromSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIVehInfPathGetNextSectionInSection(
  ASectionID: Integer;
  AVehIndex: Integer;
  AFromSection: Integer
  ): Integer;
  cdecl; external A2KERNEL_DLL;

//.........................................
// 23. Function relative to legion
//.........................................
function AKIGeneratePedestrians(
  AFromCentroid: Integer;
  AToCentroid: Integer;
  ARouteID: Integer;
  ANumPeds: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIGeneratePedestriansInTime(
  AFromCentroid: Integer;
  AToCentroid: Integer;
  ARouteID: Integer;
  ANumPeds: Double;
  ATimeInterval: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIGeneratePedestriansDefaultRoutes(
  AFromCentroid: Integer;
  AToCentroid: Integer;
  ANumPeds: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIGeneratePedestriansDefaultRoutesInTime(
  AFromCentroid: Integer;
  AToCentroid: Integer;
  ANumPeds: Double;
  ATimeInterval: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIConvertLatitudeLongitudeToXY(
  Latitude: Double;
  Longittude: Double;
  var X: Double;
  var Y: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

function AKIConvertXYToLatitudeLongitude(
  X: Double;
  Y: Double;
  var Latitude: Double;
  var Longittude: Double
  ): Integer;
  cdecl; external A2KERNEL_DLL;

implementation

procedure AKIPrintStringEx(AString: String);
begin
  var LAnsiStr := AnsiString(AString);
  AKIPrintString(PAnsiChar(LAnsiStr));
end;

end.
