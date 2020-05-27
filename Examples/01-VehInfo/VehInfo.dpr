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

library VehInfo;

uses
  AAPI_Util,
  AKIProxie,
  ANGConProxie,
  CIProxie,
  AAPI_User in 'AAPI_User.pas'; // Rename AAPI to AAPI_User and add it to user project.

{$R *.res}

exports
  AAPIEnterPedestrian,
  AAPIEnterVehicle,
  AAPIEnterVehicleSection,
  AAPIExitPedestrian,
  AAPIExitVehicle,
  AAPIExitVehicleSection,
  AAPIFinish,
  AAPIInit,
  AAPILoad,
  AAPIManage,
  AAPIPostManage,
  AAPIPreRouteChoiceCalculation,
  AAPIUnLoad;

begin
 //
end.
