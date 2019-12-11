# Aimsun-MicroApi
Aimsun MicroApi in Object Pascal - Aimsun MicroApi ported to Object Pascal. Supports up to the latest Aimsun version 8.4.

Aimsun MicroAPIs are the programming interface of Aimsun microscopic traffic simulator. As of the latest Aimsun version 8.4, these APIs provided 13 predefined call back hooks, together with various other utility functions.

MicroAPIs allow advanced users to implement sophisticated external logic, for example, non-standard ramp metering, advanced traffic management strategies, adaptive signal control etc. These are not readily available with standard off-the-shelf Aimsun features, but made possible with Aimsun MicroAPIs.

The Aimsun MicroAPIs will generate a Dynamic Link Library (DLL). The DLL is loaded by Aimsun host during run time before running a simulation replication, and unloaded after the simulation replication finishes. The supported programming language is C++ and Python, but a knowledgable develoer can easily port the development in other languages such as Delphi, C#, Java, Swift, Golang, and Fortran, to name just a few.

One nuance about Aimsun MicroAPIs programming  is the granular control level down to a single simulation step. This is no surprise since Aimsun Micro is a time-discretized space continuous simulator that all the simulation events have to be driven by incrementing simulation steps. However, this might pose some programming challenges or certain pitfalls when multi-threading is involved, or when a TCP/IP based client-server structure is employed.  The tricky point is that at the simulation step level,  the control of flow is transferred from Aimsun host to MicroAPI DLL,  while NOT until the call back finishes,  Aimsun host is  “blocked”. This could possibly counter-balance any benefits obtained from the multi-threaded code implemented inside the API logic.

From "event" perspective, Aimsun MiroAPIs can be categorized as:
 - Initialization Functions, which are to be fired once with each simulation replication by Aimsun host at the DLL initialization state.
    AAPILoad
    AAPIInit
 - Timestep-wise Functions, which are to be fired synchronously during simulation runtime by Aimsun host with each simulation step. The calling thread afinity is invariant.
    AAPIManage
    AAPIPostManage
 - Finialiation Functions, which are to be fired once with each simulation replication by Aimsun host at the DLL finalization stage.
    AAPIFinish
    AAPIUnLoad
 - Simulation Runtime Event Functions, which are to be fired asynchronously, whenever these events occur during simulation run time. The calling thread afinity is random.
    AAPIEnterVehicle
    AAPIExitVehicle
    AAPIEnterPedestrian

From in-process communiction (IPC) and data exchange perspective, Aimsun MicroAPIs include two types of functions:

    - Predefined DLL Exported Functions (call-back hooks to the Aimsun Host);
    - Utility Functions provided by the Aimsun Host to retrieve various run time information.

The utility functions can be further classified into three categories:

    - External Control Interface Functions for traffic signal control (ramp metering, intersection signal control etc). These functions are usually prefixed with ECI, for example, ECIChangeParametersFlowAlineaMeteringById;
    - Aimsun NG Objects Connection Interface Functions for accessing properties of Aimsun internal objects. These functions are usually prefixed with ANGConn, for example, ANGConnActivatePolicy;
    - Aimsun Kernel Interface Functions to retrieve other simulation run time information. These functions are usually prefixed with AKI, for example, AKIDetGetDensityAggregatedbyId.

To use the utility functions exported by the Aimsun host, “a2kernel8.lib” and "acontrol8.lib" must be specified for the linker as the import lib if you uses C++ compiler, this means the MicroAPI DLL will have dependence on a2kernel8.dll and acontrol8.dll.  However, for Delphi, there is no need to specify import lib, since these two dependent DLLs will be loaded implicitly.

Read more at my blog https://blog.wupingxin.net, feel free to leave your comments.
