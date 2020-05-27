# AimsunMicroApi4D
AimsunMicroApi4D - Cross-platform Object Pascal bindings for Aimsun MicroApi on Windows, Linux and MacOS. Supports the latest Aimsun version 8.4.

## Purpose
This repo provides cross-platform Onject Pascal (Delphi) bindings for Aimsun MicroApi. Support up to Delphi version 10.4 Sydney.

## In a Nutshell
Aimsun MicroApi is the programming interface of Aimsun microscopic traffic simulator developed by Aimsun Inc. While the officially supported programming languages are C/C++ and Python, AimsunMicroApi4D provides an additional cross-platform option using the Object Pascal (i.e., Delphi) language.

Aimsun MicroApi includes a total 13 predefined call-back hooks, together with various other utility functions. The Api enables advanced users to implement sophisticated external logic, for example, non-standard ramp metering, advanced traffic management strategies, adaptive signal control etc. These are not readily available with the standard Aimsun features, but rendered possible only with Aimsun MicroApi.

An Aimsun MicroApi project will generate a Dynamic Link Library (Dll) on Windows platform. The Dll is loaded by the Aimsun host during runtime before a simulation replication starts, and unloaded after a simulation replication finishes. As noted above, the offically-supported programming languages are C++ and Python, but that doesn't prevent other programming languages such as Delphi, C#, Java, Swift, Golang, and Fortran, as long as the compiler is capable of generating native Dynamic Link Libraries.

## Caveates
Aimsun MicroApi has the granular level of control being a single simulation step. This is no surprise since Aimsun Micro Simulatir is a time-discretized space-continuous environment where all simulation events have to be driven by incrementing simulation steps. This nontheless poses some programming challenges for developments involving multi-threading or a TCP/IP based client-server structure.  To be sure, at the simulation step level, the control flow is transferred from the Aimsun host to the MicroApi Dll,  meaning the Aimsun host will be  “blocked” until the control flow returns from the Dll. This could possibly counter-balance any benefits obtained from the multi-threaded code implemented inside the API logic. Also keep in mind that Aimsun calling-back the Dll exported functions asynchronously; when the Aimsun host spawns multiple threads there is no garanttee of fixed thread affinity for calling back those exported functions.

## Perspectives
From the "event" perspective, Aimsun MiroApi can be categorized as:
  - Initialization Functions, which are fired once with each simulation replication by Aimsun host at the DLL initialization state.
    AAPILoad
    AAPIInit
 - Timestep-wise Functions, which are fired synchronously during simulation runtime by Aimsun host with each simulation step. The calling thread afinity is invariant.
    AAPIManage
    AAPIPostManage
 - Finialiation Functions, which are fired once with each simulation replication by Aimsun host at the DLL finalization stage.
    AAPIFinish
    AAPIUnLoad
 - Simulation Runtime Event Functions, which are fired asynchronously, whenever these events occur during simulation run time. The calling thread afinity is random.
    AAPIEnterVehicle
    AAPIExitVehicle
    AAPIEnterPedestrian

On the other hand, from in-process communiction (IPC) and data exchange perspective, Aimsun MicroApi includes two types of functions:
 - Predefined Dll Exported Functions (call-back hooks to the Aimsun Host);
 - Utility Functions provided by the Aimsun Host to retrieve various run time information.

The utility functions can be further classified into three categories:
 - External Control Interface Functions for traffic signal control (ramp metering, intersection signal control etc). These functions are usually prefixed with ECI, for example, ECIChangeParametersFlowAlineaMeteringById;
 - Aimsun NG Objects Connection Interface Functions for accessing properties of Aimsun internal objects. These functions are usually prefixed with ANGConn, for example, ANGConnActivatePolicy;
 - Aimsun Kernel Interface Functions to retrieve other simulation run time information. These functions are usually prefixed with AKI, for example, AKIDetGetDensityAggregatedbyId.

## Dependencies
To use the utility functions exported by the Aimsun host, “a2kernel8.lib” and "acontrol8.lib" must be specified for the linker as the import lib should you use a C++ compiler. This means the MicroApi Dll will have an external dependency on both a2kernel8.dll and acontrol8.dll. However, for Delphi there is no need to specify import libs like in C/C++, since these two dependent Dlls will be loaded implicitly.

## Feedbacks
AimsunMicroApi4D is developed by Wuping Xin. Read more at my blog https://blog.wupingxin.net, feel free to leave comments.

## Examples
Various samples are included in /Examples folder.  More will be added when I have more spare time, or upon request.
