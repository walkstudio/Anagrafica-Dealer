CREATE TABLE [Dealer].[TipoDealer] (
    [IDTipoDealer]   INT           IDENTITY (0, 1) NOT NULL,
    [NomeTipoDealer] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TipoDealer] PRIMARY KEY CLUSTERED ([IDTipoDealer] ASC)
);



