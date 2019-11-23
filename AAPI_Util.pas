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

unit AAPI_Util;

interface

{$IFDEF MSWINDOWS}
{$IFDEF AIMSUN8}
const
  A2KERNEL_DLL = 'a2kernel8.dll';

const
  ACONTROL_DLL = 'acontrol8.dll';
{$ELSE}
{$IFDEF AIMSUN7}

const
  A2KERNEL_DLL = 'a2kernel7.dll';

const
  ACONTROL_DLL = 'a2kernel7.dll';
{$ELSE}
{$MESSAGE FATAL 'Aimsun version not supported.'}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$IFDEF MACOS}
{$ENDIF}
{$IFDEF LINUX}
{$ENDIF}

implementation

end.
