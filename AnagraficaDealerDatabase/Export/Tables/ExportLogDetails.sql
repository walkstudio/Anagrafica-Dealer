CREATE TABLE [Export].[ExportLogDetails] (
    [IDLog]             INT              IDENTITY (1, 1) NOT NULL,
    [PkgName]           VARCHAR (50)     NULL,
    [LogInsertTime]     DATETIME         CONSTRAINT [DF_PkgExecutionLog_LogInsertTime] DEFAULT (getdate()) NOT NULL,
    [EventType]         VARCHAR (30)     NOT NULL,
    [TaskName]          VARCHAR (50)     NOT NULL,
    [EventCode]         INT              NULL,
    [EventDescription]  VARCHAR (1000)   NULL,
    [PkgDuration]       INT              NULL,
    [ContainerDuration] INT              NULL,
    [VariableName]      VARCHAR (50)     NULL,
    [VariableValue]     VARCHAR (255)    NULL,
    [Host]              VARCHAR (50)     NOT NULL,
    [ExecutionGUID]     UNIQUEIDENTIFIER NOT NULL,
    [ExecutionID]       BIGINT           NOT NULL,
    CONSTRAINT [PK_ExecutionLogDetails] PRIMARY KEY CLUSTERED ([IDLog] ASC)
);



