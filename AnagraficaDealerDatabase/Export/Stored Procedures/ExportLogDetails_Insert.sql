﻿



CREATE PROCEDURE [Export].[ExportLogDetails_Insert] (
			@PkgName varchar(50),
			@EventType varchar(20),
			@TaskName varchar(50),
			@EventCode int,
			@EventDescription varchar(1000),
			@PkgDuration int,
			@ContainerDuration int,
			@VariableName varchar(50),
			@VariableValue varchar(255),
			@Host varchar(50),
			@ExecutionGUID uniqueidentifier,
			@ExecutionID bigint) AS


insert into Export.ExportLogDetails 
			(PkgName,
			EventType,
			TaskName,
			EventCode,
			EventDescription,
			PkgDuration,
			ContainerDuration,
			VariableName,
			VariableValue,
			Host,
			ExecutionGUID,
			ExecutionID)
	values (@PkgName,
			@EventType,
			@TaskName,
			@EventCode,
			@EventDescription,
			@PkgDuration,
			@ContainerDuration,
			@VariableName,
			@VariableValue,
			@Host,
			@ExecutionGUID,
			@ExecutionID)