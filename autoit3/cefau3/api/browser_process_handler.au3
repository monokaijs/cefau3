#cs
	file: api/browser_process_handler.au3
	author: wuuyi123
#ce

#include-once

; CefBrowserProcessHandler
; ==================================================

global $tag_CefBrowserProcessHandler = ( _
    $tag_CefBase 			& _
    'ptr[5];' 				& _
    'char __OCI[100];' 		& _ ;on_context_initialized
    'char __OBCPL[100];' 	& _ ;on_before_child_process_launch
    'char __ORPTC[100];' 	& _ ;on_render_process_thread_created
    'char __GPH[100];' 		& _ ;get_print_handler
    'char __OSMPW[100];' 	_ 	;on_schedule_message_pump_work
)

global $__CefBrowserProcessHandler__OCI 	= Cef_CallbackRegister(__CefBrowserProcessHandler__OCI, 	'none', 'ptr')
global $__CefBrowserProcessHandler__OBCPL 	= Cef_CallbackRegister(__CefBrowserProcessHandler__OBCPL, 	'none', 'ptr;ptr')
global $__CefBrowserProcessHandler__ORPTC 	= Cef_CallbackRegister(__CefBrowserProcessHandler__ORPTC, 	'none', 'ptr;ptr')
global $__CefBrowserProcessHandler__GPH 	= Cef_CallbackRegister(__CefBrowserProcessHandler__GPH, 	'ptr', 	'ptr')
global $__CefBrowserProcessHandler__OSMPW 	= Cef_CallbackRegister(__CefBrowserProcessHandler__OSMPW, 	'none', 'ptr;int64')

; ==================================================

func CefBrowserProcessHandler_Create($ptr = null)
	local $struct = CefStruct_Create($tag_CefBrowserProcessHandler, 'CefBrowserProcessHandler', $ptr)
	$struct.size = $struct.__size__;

	CefStruct_AddMethod($struct, 'OnContextInitialized', 			'__CefBrowserProcessHandler_OCI')
	CefStruct_AddMethod($struct, 'OnBeforeChildProcessLaunch', 		'__CefBrowserProcessHandler_OBCPL')
	CefStruct_AddMethod($struct, 'OnRenderProcessThreadCreated',	'__CefBrowserProcessHandler_ORPTC')
	CefStruct_AddMethod($struct, 'GetPrintHandler', 				'__CefBrowserProcessHandler_GPH')
	CefStruct_AddMethod($struct, 'OnScheduleNessagePumpWork', 		'__CefBrowserProcessHandler_OSMPW')

	return $struct
endfunc

func __CefBrowserProcessHandler_OCI($self, $func = null)
	if @NumParams == 1 then return $self.__OCI

	$self.__OCI = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnContextInitialized', 'ptr', $self.__pointer__, 'ptr', $__CefBrowserProcessHandler__OCI)
endfunc

func __CefBrowserProcessHandler_OBCPL($self, $func = null)
	if @NumParams == 1 then return $self.__OBCPL

	$self.__OBCPL = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnBeforeChildProcessLaunch', 'ptr', $self.__pointer__, 'ptr', $__CefBrowserProcessHandler__OBCPL)
endfunc

func __CefBrowserProcessHandler_ORPTC($self, $func = null)
	if @NumParams == 1 then return $self.__ORPTC

	$self.__ORPTC = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnRenderProcessThreadCreated', 'ptr', $self.__pointer__, 'ptr', $__CefBrowserProcessHandler__ORPTC)
endfunc

func __CefBrowserProcessHandler_GPH($self, $func = null)
	if @NumParams == 1 then return $self.__GPH

	$self.__GPH = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_GetPrintHandler', 'ptr', $self.__pointer__, 'ptr', $__CefBrowserProcessHandler__GPH)
endfunc

func __CefBrowserProcessHandler_OSMPW($self, $func = null)
	if @NumParams == 1 then return $self.__OSMPW

	$self.__OSMPW = funcname($func)
	dllcall($__Cefau3Dll__, 'none:cdecl', 'CefBrowserProcessHandler_OnScheduleMessagePumpWork', 'ptr', $self.__pointer__, 'ptr', $__CefBrowserProcessHandler__OSMPW)
endfunc

; ==================================================

func __CefBrowserProcessHandler__OCI($self)
	$self = CefBrowserProcessHandler_Create($self)

	call($self.__OCI, $self)
endfunc

func __CefBrowserProcessHandler__OBCPL($self, $command_line)
	$self = CefBrowserProcessHandler_Create($self)
	;$command_line = CefCommandLine_Create($command_line)

	call($self.__OBCPL, $self, $command_line)
endfunc

func __CefBrowserProcessHandler__ORPTC($self, $extra_info)
	$self = CefBrowserProcessHandler_Create($self)
	;$extra_info = CefListValue_Create($extra_info)

	call($self.__ORPTC, $self, $extra_info)
endfunc

func __CefBrowserProcessHandler__GPH($self)
	$self = CefBrowserProcessHandler_Create($self)

	return call($self.__GPH, $self)
endfunc

func __CefBrowserProcessHandler__OSMPW($self, $delay_ms)
	$self = CefBrowserProcessHandler_Create($self)

	call($self.__OSMPW, $self, $delay_ms)
endfunc