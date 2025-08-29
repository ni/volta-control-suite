<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="23008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Libraries" Type="Folder" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Libraries">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="SubVIs" Type="Folder" URL="../SubVIs">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Support Files" Type="Folder" URL="../Support Files">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="HPS-17000-PowerModule.lvlib" Type="Library" URL="../HPS-17000-PowerModule.lvlib"/>
		<Item Name="NHR-9300-PowerModule.lvlib" Type="Library" URL="../NHR-9300-PowerModule.lvlib"/>
		<Item Name="PowerModuleInterface.lvlibp" Type="LVLibp" URL="../../builds/PowerModuleInterface/PowerModuleInterface.lvlibp">
			<Item Name="PowerModuleInterface.lvclass" Type="LVClass" URL="../../builds/PowerModuleInterface/PowerModuleInterface.lvlibp/Classes/PowerModule_interface/PowerModuleInterface.lvclass"/>
		</Item>
		<Item Name="Simulated-PowerModule.lvlib" Type="Library" URL="../Simulated-PowerModule.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="HPS-17000.lvclass" Type="LVClass" URL="/&lt;instrlib&gt;/HPS-17000/HPS-17000.lvclass"/>
				<Item Name="niSync Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Close.vi"/>
				<Item Name="niSync Initialize (Default).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Initialize (Default).vi"/>
				<Item Name="niSync Initialize (IVI).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Initialize (IVI).vi"/>
				<Item Name="niSync Initialize (String).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Initialize (String).vi"/>
				<Item Name="niSync Initialize.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Initialize.vi"/>
				<Item Name="niSync IVI Error Converter.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync IVI Error Converter.vi"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="CEH Actions.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/CEH/CEH Actions.ctl"/>
				<Item Name="Classify Error.vi" Type="VI" URL="/&lt;userlib&gt;/_SEH/Classify Error.vi"/>
				<Item Name="De-Classify Error.vi" Type="VI" URL="/&lt;userlib&gt;/_SEH/De-Classify Error.vi"/>
				<Item Name="openg_application_control.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/appcontrol/appcontrol.llb/openg_application_control.lvlib"/>
				<Item Name="openg_array.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/array/array.llb/openg_array.lvlib"/>
				<Item Name="openg_error.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/error/error.llb/openg_error.lvlib"/>
				<Item Name="openg_file.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/file/file.llb/openg_file.lvlib"/>
				<Item Name="openg_variant.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/openg_variant.lvlib"/>
				<Item Name="SEH Error Display Options.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/SEH/SEH Error Display Options.ctl"/>
				<Item Name="SEH Error Notification Command.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/Shared/SEH Error Notification Command.ctl"/>
				<Item Name="SEH Error Notification Config.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/Shared/SEH Error Notification Config.ctl"/>
				<Item Name="SEH Error Notification Data.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/SEH/SEH Error Notification Data.ctl"/>
				<Item Name="SEH Error Notification.vi" Type="VI" URL="/&lt;userlib&gt;/_SEH/Support VIs/SEH/SEH Error Notification.vi"/>
				<Item Name="SEH Error Options.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/SEH/SEH Error Options.ctl"/>
				<Item Name="SEH Error Processor.vi" Type="VI" URL="/&lt;userlib&gt;/_SEH/Support VIs/SEH/SEH Error Processor.vi"/>
				<Item Name="SEH Execute Error Handling Code.vi" Type="VI" URL="/&lt;userlib&gt;/_SEH/Support VIs/SEH/SEH Execute Error Handling Code.vi"/>
				<Item Name="SEH Get Next Error.vi" Type="VI" URL="/&lt;userlib&gt;/_SEH/SEH Get Next Error.vi"/>
				<Item Name="SEH Init.vi" Type="VI" URL="/&lt;userlib&gt;/_SEH/SEH Init.vi"/>
				<Item Name="SEH Notification Info.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/Shared/SEH Notification Info.ctl"/>
				<Item Name="SEH Shared Error Options.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/SEH/SEH Shared Error Options.ctl"/>
				<Item Name="SEH Transmit Error Function.ctl" Type="VI" URL="/&lt;userlib&gt;/_SEH/Controls/Shared/SEH Transmit Error Function.ctl"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="1D String Array to Delimited String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/1D String Array to Delimited String.vi"/>
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="Add State(s) to Queue__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Add State(s) to Queue__jki_lib_state_machine.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Async Interface.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Async Interface.lvclass"/>
				<Item Name="Async Process Wrapper.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Async Process Wrapper.lvclass"/>
				<Item Name="Async Runner.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Async Runner.lvclass"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Conditional State String__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Conditional State String__jki_lib_state_machine.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Create Directory Recursive.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Create Directory Recursive.vi"/>
				<Item Name="Create File and Containing Folders.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Create File and Containing Folders.vi"/>
				<Item Name="Cycler Diagnostics Reader.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Cycler Diagnostics Reader.lvclass"/>
				<Item Name="Cycler.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Cycler.lvclass"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="Escape String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Escape String.vi"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Fake Network Sync.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Fake Network Sync.lvclass"/>
				<Item Name="Faults Data.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Faults Data.lvclass"/>
				<Item Name="Faults Monitor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Faults Monitor.lvclass"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Get File System Separator.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysinfo.llb/Get File System Separator.vi"/>
				<Item Name="Get LV Class Default Value By Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value By Name.vi"/>
				<Item Name="Get LV Class Default Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Get VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get VI Library File Info.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="grpc-lvsupport-release.lvlib" Type="Library" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/grpc-lvsupport-release.lvlib"/>
				<Item Name="Has LLB Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Has LLB Extension.vi"/>
				<Item Name="Heartbeat Core.lvlib" Type="Library" URL="/&lt;vilib&gt;/HPS-17000/Heartbeat Core.lvlib"/>
				<Item Name="Heartbeat Data.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Heartbeat Data.lvclass"/>
				<Item Name="Heartbeat Monitor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Heartbeat Monitor.lvclass"/>
				<Item Name="Heartbeat.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Heartbeat.lvclass"/>
				<Item Name="High Resolution Polling Wait.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Polling Wait.vi"/>
				<Item Name="HPS Utilities.lvlib" Type="Library" URL="/&lt;vilib&gt;/HPS-17000/HPS Utilities.lvlib"/>
				<Item Name="Is Path and Not Empty.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Is Path and Not Empty.vi"/>
				<Item Name="IVI Error Message Builder.vi" Type="VI" URL="/&lt;vilib&gt;/errclust.llb/IVI Error Message Builder.vi"/>
				<Item Name="JKI JSON Serialization.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI.lib/Serialization/JSON/JKI JSON Serialization.lvlib"/>
				<Item Name="JKI Serialization.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI.lib/Serialization/Core/JKI Serialization.lvlib"/>
				<Item Name="JKI Unicode.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI.lib/Unicode/JKI Unicode.lvlib"/>
				<Item Name="Librarian File Info In.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info In.ctl"/>
				<Item Name="Librarian File Info Out.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info Out.ctl"/>
				<Item Name="Librarian File List.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File List.ctl"/>
				<Item Name="Librarian Get Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Get Info.vi"/>
				<Item Name="Librarian Path Location.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Path Location.vi"/>
				<Item Name="Librarian Set Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Set Info.vi"/>
				<Item Name="Librarian.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian.vi"/>
				<Item Name="Logger Library.lvlib" Type="Library" URL="/&lt;vilib&gt;/HPS-17000/Logger Library.lvlib"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LV70DateRecToTimeStamp.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/LV70DateRecToTimeStamp.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVDateTimeRec.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVDateTimeRec.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Network Sync Data.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Network Sync Data.lvclass"/>
				<Item Name="Network Sync Monitor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Network Sync Monitor.lvclass"/>
				<Item Name="Network Sync.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Network Sync.lvclass"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_BC_client.lvlib" Type="Library" URL="/&lt;vilib&gt;/HPS-17000/NI_BC_client.lvlib"/>
				<Item Name="NI_Bytestream.lvlib" Type="Library" URL="/&lt;vilib&gt;/Array/Bytestream/NI_Bytestream.lvlib"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="NI_Deadline.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Deadline/NI_Deadline.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_SSH.lvlib" Type="Library" URL="/&lt;vilib&gt;/net/SSH/NI_SSH.lvlib"/>
				<Item Name="NI_Subprocess.lvlib" Type="Library" URL="/&lt;vilib&gt;/Subprocess/NI_Subprocess.lvlib"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="niceiplib.lvlib" Type="Library" URL="/&lt;vilib&gt;/UDC/niceiplib.lvlib"/>
				<Item Name="nisyscfg.lvlib" Type="Library" URL="/&lt;vilib&gt;/nisyscfg/nisyscfg.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Parse State Queue__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Parse State Queue__jki_lib_state_machine.vi"/>
				<Item Name="Periodic State String__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Periodic State String__jki_lib_state_machine.vi"/>
				<Item Name="Periodic Trigger__ogtk__JKI-SM__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Periodic Trigger__ogtk__JKI-SM__jki_lib_state_machine.vi"/>
				<Item Name="Qualified Name Array To Single String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Qualified Name Array To Single String.vi"/>
				<Item Name="Random Number (Range) DBL.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) DBL.vi"/>
				<Item Name="Random Number (Range) I64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) I64.vi"/>
				<Item Name="Random Number (Range) U64.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range) U64.vi"/>
				<Item Name="Random Number (Range).vi" Type="VI" URL="/&lt;vilib&gt;/numeric/Random Number (Range).vi"/>
				<Item Name="Range Limits for Type.vim" Type="VI" URL="/&lt;vilib&gt;/numeric/Range Limits for Type.vim"/>
				<Item Name="Remove Duplicates From 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Remove Duplicates From 1D Array.vim"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Busy.vi"/>
				<Item Name="Set Cursor (Cursor ID).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Cursor ID).vi"/>
				<Item Name="Set Cursor (Icon Pict).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Icon Pict).vi"/>
				<Item Name="Set Cursor.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Set VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Set VI Library File Info.vi"/>
				<Item Name="Setpoint Status Data.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Setpoint Status Data.lvclass"/>
				<Item Name="Setpoint Status Monitor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Setpoint Status Monitor.lvclass"/>
				<Item Name="Simulated Cycler.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Simulated Cycler.lvclass"/>
				<Item Name="Simulated Multicast Reader.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Simulated Multicast Reader.lvclass"/>
				<Item Name="Simulated Multicast Writer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Simulated Multicast Writer.lvclass"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="Stream Reader.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Stream Reader.lvclass"/>
				<Item Name="Stream Writer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Stream Writer.lvclass"/>
				<Item Name="Stream.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Stream.lvclass"/>
				<Item Name="sub_Random U32.vi" Type="VI" URL="/&lt;vilib&gt;/numeric/sub_Random U32.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace One-Sided.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace One-Sided.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="UDP Multicast Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Open.vi"/>
				<Item Name="UDP Multicast Read-Only Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Read-Only Open.vi"/>
				<Item Name="UDP Multicast Read-Write Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Read-Write Open.vi"/>
				<Item Name="UDP Multicast Reader.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/UDP Multicast Reader.lvclass"/>
				<Item Name="UDP Multicast Write-Only Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Write-Only Open.vi"/>
				<Item Name="UDP Multicast Writer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/UDP Multicast Writer.lvclass"/>
				<Item Name="UDP Standard Reader.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/UDP Standard Reader.lvclass"/>
				<Item Name="Unset Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Unset Busy.vi"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="Wait for All Path Events.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/HPS-17000/Wait for All Path Events.lvclass"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="lviosrg.dll" Type="Document" URL="lviosrg.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nisync.dll" Type="Document" URL="nisync.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nisyscfg.dll" Type="Document" URL="nisyscfg.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Power Function.ctl" Type="VI" URL="../Types/Power Function.ctl"/>
			<Item Name="Range.ctl" Type="VI" URL="../Types/Range.ctl"/>
			<Item Name="Setpoints.ctl" Type="VI" URL="../Types/Setpoints.ctl"/>
			<Item Name="systemLogging.dll" Type="Document" URL="systemLogging.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="HPS-17000-PowerModule" Type="Packed Library">
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{E3BADF12-5D10-47D7-82B6-071306FCB8C8}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">HPS-17000-PowerModule</Property>
				<Property Name="Bld_excludeDependentPPLs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/Power Modules</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/SubVIs/PPL Version Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{31A75332-2DEA-4579-8F68-D18A26C55B8E}</Property>
				<Property Name="Bld_version.build" Type="Int">99</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">HPS-17000-PowerModule.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/Power Modules/HPS-17000-PowerModule.lvlibp</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/Power Modules</Property>
				<Property Name="Destination[2].destName" Type="Str">gRPC Libraries</Property>
				<Property Name="Destination[2].path" Type="Path">../builds/Power Modules/Libraries</Property>
				<Property Name="Destination[2].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="DestinationCount" Type="Int">3</Property>
				<Property Name="PackedLib_callersAdapt" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">{13D9F822-B766-4ABF-BDCB-0A2CF8564724}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/HPS-17000-PowerModule.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="Source[2].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[2].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">2</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Libraries</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">NI</Property>
				<Property Name="TgtF_fileDescription" Type="Str">HPS-17000-PowerModule</Property>
				<Property Name="TgtF_internalName" Type="Str">HPS-17000-PowerModule</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 NI</Property>
				<Property Name="TgtF_productName" Type="Str">HPS-17000-PowerModule</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{AEADAC52-72EC-4193-BCEB-3B7621D4C5A1}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">HPS-17000-PowerModule.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Power Modules Package" Type="{E661DAE2-7517-431F-AC41-30807A3BDA38}">
				<Property Name="NIPKG_addToFeed" Type="Bool">false</Property>
				<Property Name="NIPKG_allDependenciesToFeed" Type="Bool">false</Property>
				<Property Name="NIPKG_allDependenciesToSystemLink" Type="Bool">false</Property>
				<Property Name="NIPKG_certificates" Type="Bool">true</Property>
				<Property Name="NIPKG_createInstaller" Type="Bool">false</Property>
				<Property Name="NIPKG_feedLocation" Type="Path">../builds/NI_AB_PROJECTNAME/Power Modules Package/Feed</Property>
				<Property Name="NIPKG_feedLocation.Type" Type="Str">relativeToCommon</Property>
				<Property Name="NIPKG_installerArtifacts" Type="Str">Install.exe|InstallCHS.dll|InstallDEU.dll|InstallFRA.dll|InstallJPN.dll|InstallKOR.dll|bin|feeds|pool|system-packages
</Property>
				<Property Name="NIPKG_installerBuiltBefore" Type="Bool">true</Property>
				<Property Name="NIPKG_installerDestination" Type="Path">../builds/Package Installers</Property>
				<Property Name="NIPKG_installerDestination.Type" Type="Str">relativeToCommon</Property>
				<Property Name="NIPKG_lastBuiltPackage" Type="Str">volta-control-suite-power-modules_1.0.0-19_windows_x64.nipkg</Property>
				<Property Name="NIPKG_license" Type="Ref"></Property>
				<Property Name="NIPKG_packageVersion" Type="Bool">false</Property>
				<Property Name="NIPKG_releaseNotes" Type="Str"></Property>
				<Property Name="NIPKG_storeProduct" Type="Bool">false</Property>
				<Property Name="NIPKG_VisibleForRuntimeDeployment" Type="Bool">false</Property>
				<Property Name="PKG_actions.Count" Type="Int">1</Property>
				<Property Name="PKG_actions[0].Arguments" Type="Str"></Property>
				<Property Name="PKG_actions[0].NIPKG.HideConsole" Type="Bool">false</Property>
				<Property Name="PKG_actions[0].NIPKG.IgnoreErrors" Type="Bool">false</Property>
				<Property Name="PKG_actions[0].NIPKG.Schedule" Type="Str">post</Property>
				<Property Name="PKG_actions[0].NIPKG.Step" Type="Str">install</Property>
				<Property Name="PKG_actions[0].NIPKG.Target.Child" Type="Str"></Property>
				<Property Name="PKG_actions[0].NIPKG.Target.Destination" Type="Str">root_7</Property>
				<Property Name="PKG_actions[0].NIPKG.Target.Source" Type="Ref">/My Computer/Support Files/Install-PuTTY.bat</Property>
				<Property Name="PKG_actions[0].NIPKG.Wait" Type="Bool">true</Property>
				<Property Name="PKG_actions[0].Type" Type="Str">NIPKG.Batch</Property>
				<Property Name="PKG_actions[1].Arguments" Type="Str"></Property>
				<Property Name="PKG_actions[1].NIPKG.HideConsole" Type="Bool">false</Property>
				<Property Name="PKG_actions[1].NIPKG.IgnoreErrors" Type="Bool">false</Property>
				<Property Name="PKG_actions[1].NIPKG.Schedule" Type="Str">post</Property>
				<Property Name="PKG_actions[1].NIPKG.Step" Type="Str">install</Property>
				<Property Name="PKG_actions[1].NIPKG.Target.Child" Type="Str"></Property>
				<Property Name="PKG_actions[1].NIPKG.Target.Destination" Type="Str">{8E3B8B59-93E7-4247-980E-E88A57FB3E94}</Property>
				<Property Name="PKG_actions[1].NIPKG.Target.Source" Type="Ref">/My Computer/Support Files/Config-ProgramData.bat</Property>
				<Property Name="PKG_actions[1].NIPKG.Wait" Type="Bool">true</Property>
				<Property Name="PKG_actions[1].Type" Type="Str">NIPKG.Batch</Property>
				<Property Name="PKG_autoIncrementBuild" Type="Bool">true</Property>
				<Property Name="PKG_autoSelectDeps" Type="Bool">false</Property>
				<Property Name="PKG_buildNumber" Type="Int">20</Property>
				<Property Name="PKG_buildSpecName" Type="Str">Power Modules Package</Property>
				<Property Name="PKG_dependencies.Count" Type="Int">5</Property>
				<Property Name="PKG_dependencies[0].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[0].MaxVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[0].MaxVersionInclusive" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[0].MinVersion" Type="Str">23.3.7.49156-0+f4</Property>
				<Property Name="PKG_dependencies[0].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[0].NIPKG.DisplayName" Type="Str">LabVIEW Runtime (64-bit)</Property>
				<Property Name="PKG_dependencies[0].Package.Name" Type="Str">ni-labview-2023-runtime-engine</Property>
				<Property Name="PKG_dependencies[0].Package.Section" Type="Str">Programming Environments</Property>
				<Property Name="PKG_dependencies[0].Package.Synopsis" Type="Str">The LabVIEW Runtime is a software add-on that enables engineers to run executables on a nondevelopment machine.</Property>
				<Property Name="PKG_dependencies[0].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[0].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_dependencies[1].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[1].MaxVersion" Type="Str">24.8.0.49262-0+f110</Property>
				<Property Name="PKG_dependencies[1].MaxVersionInclusive" Type="Bool">true</Property>
				<Property Name="PKG_dependencies[1].MinVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[1].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[1].NIPKG.DisplayName" Type="Str">NI-Sync Runtime Support for Embedded Controllers</Property>
				<Property Name="PKG_dependencies[1].Package.Name" Type="Str">ni-sync-api-support</Property>
				<Property Name="PKG_dependencies[1].Package.Section" Type="Str">Runtime</Property>
				<Property Name="PKG_dependencies[1].Package.Synopsis" Type="Str">Provides runtime components required to deploy applications using NI-Sync to synchronize embedded controllers.</Property>
				<Property Name="PKG_dependencies[1].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[1].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_dependencies[2].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[2].MaxVersion" Type="Str">24.8.0.49261-0+f109</Property>
				<Property Name="PKG_dependencies[2].MaxVersionInclusive" Type="Bool">true</Property>
				<Property Name="PKG_dependencies[2].MinVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[2].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[2].NIPKG.DisplayName" Type="Str">NI-Sync Runtime Support for PXI Synchronization Modules</Property>
				<Property Name="PKG_dependencies[2].Package.Name" Type="Str">ni-sync-runtime</Property>
				<Property Name="PKG_dependencies[2].Package.Section" Type="Str">Drivers</Property>
				<Property Name="PKG_dependencies[2].Package.Synopsis" Type="Str">Provides runtime components required to deploy applications using NI-Sync PXI Synchronization Modules.</Property>
				<Property Name="PKG_dependencies[2].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[2].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_dependencies[3].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[3].MaxVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[3].MaxVersionInclusive" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[3].MinVersion" Type="Str">25.0.0.49281-0+f129</Property>
				<Property Name="PKG_dependencies[3].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[3].NIPKG.DisplayName" Type="Str">NI System Configuration Runtime</Property>
				<Property Name="PKG_dependencies[3].Package.Name" Type="Str">ni-syscfg-runtime</Property>
				<Property Name="PKG_dependencies[3].Package.Section" Type="Str">Runtime</Property>
				<Property Name="PKG_dependencies[3].Package.Synopsis" Type="Str">Run-time components required to deploy applications that use the NI System Configuration API.</Property>
				<Property Name="PKG_dependencies[3].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[3].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_dependencies[4].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[4].MaxVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[4].MaxVersionInclusive" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[4].MinVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[4].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[4].NIPKG.DisplayName" Type="Str">Volta Control Suite</Property>
				<Property Name="PKG_dependencies[4].Package.Name" Type="Str">volta-control-suite</Property>
				<Property Name="PKG_dependencies[4].Package.Section" Type="Str">Application Software</Property>
				<Property Name="PKG_dependencies[4].Package.Synopsis" Type="Str">Modular application for controlling NI power electronics</Property>
				<Property Name="PKG_dependencies[4].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[4].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_description" Type="Str">Requires Volta Control Suite to work.  Installs the default power modules for control in VCS.</Property>
				<Property Name="PKG_destinations.Count" Type="Int">2</Property>
				<Property Name="PKG_destinations[0].ID" Type="Str">{2D8E7533-5787-42AE-99EB-9E22B267B972}</Property>
				<Property Name="PKG_destinations[0].Subdir.Directory" Type="Str">Power Modules</Property>
				<Property Name="PKG_destinations[0].Subdir.Parent" Type="Str">{8ECD7847-A529-4539-A3A6-3F4D71DD9281}</Property>
				<Property Name="PKG_destinations[0].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_destinations[1].ID" Type="Str">{8ECD7847-A529-4539-A3A6-3F4D71DD9281}</Property>
				<Property Name="PKG_destinations[1].Subdir.Directory" Type="Str">Volta Control Suite</Property>
				<Property Name="PKG_destinations[1].Subdir.Parent" Type="Str">root_5</Property>
				<Property Name="PKG_destinations[1].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_destinations[2].ID" Type="Str">{8ECD7847-A529-4539-A3A6-3F4D71DD9281}</Property>
				<Property Name="PKG_destinations[2].Subdir.Directory" Type="Str">Volta Control Suite</Property>
				<Property Name="PKG_destinations[2].Subdir.Parent" Type="Str">root_5</Property>
				<Property Name="PKG_destinations[2].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_displayName" Type="Str">Volta Control Suite - Power Modules</Property>
				<Property Name="PKG_displayVersion" Type="Str"></Property>
				<Property Name="PKG_feedDescription" Type="Str"></Property>
				<Property Name="PKG_feedName" Type="Str"></Property>
				<Property Name="PKG_homepage" Type="Str">https://github.com/ni/volta-control-suite</Property>
				<Property Name="PKG_hostname" Type="Str"></Property>
				<Property Name="PKG_maintainer" Type="Str">Brandon Jones &lt;bjones@emerson.com&gt;</Property>
				<Property Name="PKG_output" Type="Path">../builds/Packages</Property>
				<Property Name="PKG_output.Type" Type="Str">relativeToCommon</Property>
				<Property Name="PKG_packageName" Type="Str">volta-control-suite-power-modules</Property>
				<Property Name="PKG_publishToSystemLink" Type="Bool">false</Property>
				<Property Name="PKG_section" Type="Str">Application Software</Property>
				<Property Name="PKG_shortcuts.Count" Type="Int">0</Property>
				<Property Name="PKG_sources.Count" Type="Int">3</Property>
				<Property Name="PKG_sources[0].Destination" Type="Str">{2D8E7533-5787-42AE-99EB-9E22B267B972}</Property>
				<Property Name="PKG_sources[0].ID" Type="Ref">/My Computer/Build Specifications/HPS-17000-PowerModule</Property>
				<Property Name="PKG_sources[0].Type" Type="Str">Build</Property>
				<Property Name="PKG_sources[1].Destination" Type="Str">{2D8E7533-5787-42AE-99EB-9E22B267B972}</Property>
				<Property Name="PKG_sources[1].ID" Type="Ref">/My Computer/Build Specifications/Simulated-PowerModule</Property>
				<Property Name="PKG_sources[1].Type" Type="Str">Build</Property>
				<Property Name="PKG_sources[2].Destination" Type="Str">root_7</Property>
				<Property Name="PKG_sources[2].ID" Type="Ref">/My Computer/Support Files/Install-PuTTY.bat</Property>
				<Property Name="PKG_sources[2].Type" Type="Str">File</Property>
				<Property Name="PKG_sources[3].Destination" Type="Str">{8E3B8B59-93E7-4247-980E-E88A57FB3E94}</Property>
				<Property Name="PKG_sources[3].ID" Type="Ref">/My Computer/Support Files/Config-ProgramData.bat</Property>
				<Property Name="PKG_sources[3].Type" Type="Str">File</Property>
				<Property Name="PKG_synopsis" Type="Str">Power Module plugins for Volta Control Suite application</Property>
				<Property Name="PKG_version" Type="Str">1.0.0</Property>
			</Item>
			<Item Name="Simulated-PowerModule" Type="Packed Library">
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{71AFE1B4-25D7-493C-96F7-2FED7C670E5D}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Simulated-PowerModule</Property>
				<Property Name="Bld_excludeDependentPPLs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/Power Modules</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/SubVIs/PPL Version Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{3D7B62BB-DE2B-44B1-8337-1EBAD43E5DDA}</Property>
				<Property Name="Bld_version.build" Type="Int">32</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Simulated-PowerModule.lvlibp</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/Power Modules/Simulated-PowerModule.lvlibp</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/Power Modules</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="PackedLib_callersAdapt" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">{D001330E-B1DC-4319-A6ED-EB53E29302A0}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Simulated-PowerModule.lvlib</Property>
				<Property Name="Source[1].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[1].Library.atomicCopy" Type="Bool">true</Property>
				<Property Name="Source[1].Library.LVLIBPtopLevel" Type="Bool">true</Property>
				<Property Name="Source[1].preventRename" Type="Bool">true</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">Library</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">NI</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Simulated-PowerModule</Property>
				<Property Name="TgtF_internalName" Type="Str">Simulated-PowerModule</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 NI</Property>
				<Property Name="TgtF_productName" Type="Str">Simulated-PowerModule</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{A4F31EC3-DD7C-4BDB-948C-EC50CE6E707D}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Simulated-PowerModule.lvlibp</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
