CREATE TABLE [Negozio].[UsaModelloVendita] (
    [IDDealer]         INT NOT NULL,
    [IDModelloVendita] INT NOT NULL,
    CONSTRAINT [PK_Usa_2] PRIMARY KEY CLUSTERED ([IDDealer] ASC, [IDModelloVendita] ASC),
    CONSTRAINT [FK_Usa_ModelloVendita] FOREIGN KEY ([IDModelloVendita]) REFERENCES [Negozio].[ModelloVendita] ([IDModelloVendita]),
    CONSTRAINT [FK_UsaModelloVendita_NegozioAgenti] FOREIGN KEY ([IDDealer]) REFERENCES [Negozio].[NegozioAgenti] ([IDDealer])
);

