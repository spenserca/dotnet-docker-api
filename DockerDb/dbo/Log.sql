CREATE TABLE [dbo].[Log]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[Source] VARCHAR(64) NOT NULL,
	[OccurredOn] DATETIME NOT NULL DEFAULT GETUTCDATE(),
	[Message] VARCHAR(MAX) NOT NULL
)
