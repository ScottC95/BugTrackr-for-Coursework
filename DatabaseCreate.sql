USE [scottCoursework]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/19/2016 17:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 07/19/2016 17:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nchar](50) NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bug]    Script Date: 07/19/2016 17:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bug](
	[BugID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Priority] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[OpenDate] [datetime] NULL,
	[AssignedUserID] [int] NULL,
	[SiteID] [int] NULL,
 CONSTRAINT [PK_Bugs] PRIMARY KEY CLUSTERED 
(
	[BugID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BugInfo]    Script Date: 07/19/2016 17:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BugInfo](
	[BugInfoID] [int] IDENTITY(1,1) NOT NULL,
	[BugID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BugInfo] PRIMARY KEY CLUSTERED 
(
	[BugInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Bug_Site]    Script Date: 07/19/2016 17:21:46 ******/
ALTER TABLE [dbo].[Bug]  WITH CHECK ADD  CONSTRAINT [FK_Bug_Site] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[Bug] CHECK CONSTRAINT [FK_Bug_Site]
GO
/****** Object:  ForeignKey [FK_Bug_User]    Script Date: 07/19/2016 17:21:46 ******/
ALTER TABLE [dbo].[Bug]  WITH CHECK ADD  CONSTRAINT [FK_Bug_User] FOREIGN KEY([SiteID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Bug] CHECK CONSTRAINT [FK_Bug_User]
GO
/****** Object:  ForeignKey [FK_BugInfo_Bug]    Script Date: 07/19/2016 17:21:46 ******/
ALTER TABLE [dbo].[BugInfo]  WITH CHECK ADD  CONSTRAINT [FK_BugInfo_Bug] FOREIGN KEY([BugID])
REFERENCES [dbo].[Bug] ([BugID])
GO
ALTER TABLE [dbo].[BugInfo] CHECK CONSTRAINT [FK_BugInfo_Bug]
GO
/****** Object:  ForeignKey [FK_BugInfo_User]    Script Date: 07/19/2016 17:21:46 ******/
ALTER TABLE [dbo].[BugInfo]  WITH CHECK ADD  CONSTRAINT [FK_BugInfo_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BugInfo] CHECK CONSTRAINT [FK_BugInfo_User]
GO
