USE [BDDInfirmerie]
GO
/****** Object:  Table [dbo].[medicament]    Script Date: 11/27/2017 13:29:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medicament](
	[id_med] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_medicament] PRIMARY KEY CLUSTERED 
(
	[id_med] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[classe]    Script Date: 11/27/2017 13:29:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[classe](
	[id_classe] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_classe] PRIMARY KEY CLUSTERED 
(
	[id_classe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/27/2017 13:29:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 11/27/2017 13:29:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[id_eleve] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](50) NOT NULL,
	[id_classe] [int] NOT NULL,
	[datenaissance] [varchar](50) NOT NULL,
	[sante] [varchar](50) NULL,
	[telparent] [varchar](50) NULL,
	[teleleve] [varchar](50) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id_eleve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[visite]    Script Date: 11/27/2017 13:29:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[visite](
	[id_visite] [int] IDENTITY(1,1) NOT NULL,
	[id_eleve] [int] NOT NULL,
	[heure_arr] [varchar](50) NOT NULL,
	[heure_dep] [varchar](50) NOT NULL,
	[motif] [varchar](50) NOT NULL,
	[comm] [varchar](50) NOT NULL,
	[pouls] [int] NULL,
	[id_med] [int] NOT NULL,
	[qte] [int] NOT NULL,
	[retour_dom] [tinyint] NOT NULL,
	[hopital] [tinyint] NOT NULL,
	[parents] [tinyint] NOT NULL,
 CONSTRAINT [PK_visite] PRIMARY KEY CLUSTERED 
(
	[id_visite] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_student_classe]    Script Date: 11/27/2017 13:29:34 ******/
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_classe] FOREIGN KEY([id_classe])
REFERENCES [dbo].[classe] ([id_classe])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_classe]
GO
/****** Object:  ForeignKey [FK_student_visite]    Script Date: 11/27/2017 13:29:34 ******/
ALTER TABLE [dbo].[visite]  WITH CHECK ADD  CONSTRAINT [FK_student_visite] FOREIGN KEY([id_eleve])
REFERENCES [dbo].[student] ([id_eleve])
GO
ALTER TABLE [dbo].[visite] CHECK CONSTRAINT [FK_student_visite]
GO
/****** Object:  ForeignKey [FK_visite_medicament]    Script Date: 11/27/2017 13:29:34 ******/
ALTER TABLE [dbo].[visite]  WITH CHECK ADD  CONSTRAINT [FK_visite_medicament] FOREIGN KEY([id_med])
REFERENCES [dbo].[medicament] ([id_med])
GO
ALTER TABLE [dbo].[visite] CHECK CONSTRAINT [FK_visite_medicament]
GO
