CREATE TABLE [Utenti].[CampoDati] (
    [IDCampoDati]          INT           IDENTITY (1, 1) NOT NULL,
    [NomeCampo]            NVARCHAR (50) NOT NULL,
    [NomeTabella]          NVARCHAR (50) NOT NULL,
    [PermessoModificabile] BIT           NOT NULL,
    [PermessoDiDefault]    INT           NOT NULL,
    [TipoWebControl]       NVARCHAR (50) NOT NULL,
    [NomeCampoFrontEnd]    NVARCHAR (50) NULL,
    [LunghezzaMassima]     INT           NOT NULL,
    [TipoDato]             NVARCHAR (50) NOT NULL,
    [Ordinamento]          INT           NOT NULL,
    CONSTRAINT [PK_CampoDati] PRIMARY KEY CLUSTERED ([IDCampoDati] ASC)
);











