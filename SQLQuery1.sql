CREATE TABLE [dbo].[Admin] (
    [Admin_ID]       VARCHAR (50) NOT NULL,
    [Admin_Name]     VARCHAR (50) NOT NULL,
    [Admin_Password] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Admin_ID] ASC)
);

CREATE TABLE [dbo].[Customer] (
    [Cust_ID]   NVARCHAR (50) NOT NULL,
    [Cust_Name] VARCHAR (50)  NOT NULL,
    [Email]     VARCHAR (50)  NOT NULL,
    [Password]  VARCHAR (50)  NOT NULL,
    [Gender]    VARCHAR (50)  NOT NULL,
    [Hp]        VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Cust_ID] ASC)
);

CREATE TABLE [dbo].[Message_Information] (
    [Message_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [Message_Content] VARCHAR (MAX) NULL,
    [Message_Role]    VARCHAR (10)  NOT NULL,
    [UserID] VARCHAR(50) NULL, 
    PRIMARY KEY CLUSTERED ([Message_ID] ASC)
);


CREATE TABLE [dbo].[Subscriptions] (
    [Sub_ID]     INT             IDENTITY (1, 1) NOT NULL,
    [Sub_Type]   VARCHAR (50)    NOT NULL,
    [Sub_Desc]   VARCHAR (MAX)   NOT NULL,
    [Sub_Image]  VARCHAR (50)    NOT NULL,
    [Sub_Price]  DECIMAL (18, 2) NOT NULL,
    [Sub_Status] VARCHAR (10)    DEFAULT ('Active') NOT NULL,
    PRIMARY KEY CLUSTERED ([Sub_ID] ASC)
);

CREATE TABLE [dbo].[UserAccount] (
    [UserID]      VARCHAR (50) NOT NULL,
    [FirstName]   VARCHAR (50) NOT NULL,
    [LastName]    VARCHAR (50) NOT NULL,
    [Email]       VARCHAR (50) NOT NULL,
    [PhoneNumber] INT          NOT NULL,
    [Gender]      VARCHAR (50) NOT NULL,
    [Password]    VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);


CREATE TABLE [dbo].[Questions] (
    [QuestionID]   INT           IDENTITY (1, 1) NOT NULL,
    [QuestionText] VARCHAR (MAX) NULL,
    [Category]     NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([QuestionID] ASC)
);

CREATE TABLE [dbo].[ChatbotInfo] (
    [ChatbotID]     INT           IDENTITY (1, 1) NOT NULL,
    [ChatbotName]   VARCHAR (MAX) NOT NULL,
    [ChatbotPrompt] VARCHAR (MAX) NULL,
    [UserID]        VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([ChatbotID] ASC),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserAccount] ([UserID])
);

CREATE TABLE [dbo].[UserSubscriptionn]
(
	[UserSub_ID]     INT             IDENTITY (1, 1) NOT NULL,
    [UserID]   VARCHAR (50)    NOT NULL,
	[UserName]   VARCHAR (50)   NOT NULL,
    [Sub_Duration]   VARCHAR (50)   NOT NULL,
    [UserSubDate]  VARCHAR (50)    NOT NULL,
    PRIMARY KEY CLUSTERED (UserSub_ID ASC)
);


CREATE TABLE [dbo].[ContactUs] (
    [FirstName] VARCHAR (50) NOT NULL,
    [LastName]  VARCHAR (50) NOT NULL,
    [Email]     VARCHAR (50) NOT NULL,
    [Message]   VARCHAR (50) NOT NULL
);

CREATE TABLE [dbo].[Products] (
    [Product_ID]    VARCHAR (50)    NOT NULL,
    [Product_Name]  VARCHAR (50)    NOT NULL,
    [Product_Desc]  VARCHAR (MAX)   NOT NULL,
    [Unit_Price]    DECIMAL (18, 2) NOT NULL,
    [Product_Image] VARCHAR (50)    NOT NULL,
    [Stock_Level]   INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Product_ID] ASC)
);