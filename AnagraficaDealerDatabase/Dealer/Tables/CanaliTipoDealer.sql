CREATE TABLE [Dealer].[CanaliTipoDealer] (
    [IDCanale]     INT NOT NULL,
    [IDTipoDealer] INT NOT NULL,
    CONSTRAINT [PK_CanaliTipoDealer] PRIMARY KEY CLUSTERED ([IDCanale] ASC, [IDTipoDealer] ASC)
);

