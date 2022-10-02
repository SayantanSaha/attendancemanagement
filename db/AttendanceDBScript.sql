USE [master]
GO
CREATE DATABASE [SchoolAttendanceDB]
GO
USE [SchoolAttendanceDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[att_id] [int] NOT NULL,
	[att_stud_id] [int] NOT NULL,
	[att_type_id] [int] NOT NULL,
	[att_time_stamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[att_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceType]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceType](
	[att_type_id] [int] NOT NULL,
	[att_type_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[att_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stu_id] [int] NOT NULL,
	[stu_first_name] [varchar](50) NOT NULL,
	[stu_last_name] [varchar](50) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[nationality] [varchar](50) NOT NULL,
	[ed_level] [varchar](50) NOT NULL,
	[grade] [varchar](50) NOT NULL,
	[section] [varchar](10) NOT NULL,
	[semester] [varchar](50) NOT NULL,
	[stu_contact] [varchar](50) NOT NULL,
	[date_of_birth] [datetime] NOT NULL,
	[admission_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_attendance]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_attendance]
AS
SELECT 
	a.att_time_stamp	AS [Date],
	c.att_type_name		AS [AttendanceType],
	COUNT(CASE WHEN c.att_type_id = 1 THEN 1 ELSE 0 END) AS PresentCount,
	COUNT(CASE WHEN c.att_type_id = 2 THEN 1 ELSE 0 END) AS AbsenseCount,
	COUNT(CASE WHEN c.att_type_id = 4 THEN 1 ELSE 0 END) AS FieldCount 
FROM dbo.Attendance a
JOIN dbo.Student b ON a.att_stud_id = b.stu_id
JOIN dbo.AttendanceType c ON c.att_type_id = a.att_type_id
GROUP BY a.att_time_stamp,c.att_type_name
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[login_id] [int] NOT NULL,
	[login_username] [varchar](50) NOT NULL,
	[login_user_pwd] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[msg_id] [int] NOT NULL,
	[msg_text] [varchar](2000) NOT NULL,
	[time_stamp] [datetime] NOT NULL,
	[to] [varchar](1000) NOT NULL,
	[cc] [varchar](1000) NULL,
	[bcc] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[msg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[per_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[per_topic] [varchar](50) NOT NULL,
	[per_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[per_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[rpt_id] [int] NOT NULL,
	[rpt_type] [varchar](50) NOT NULL,
	[rpt_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rpt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](50) NOT NULL,
	[role_description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Search]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Search](
	[search_id] [int] NOT NULL,
	[search_typ] [varchar](50) NOT NULL,
	[search_description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[search_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2022-10-01 11:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] NOT NULL,
	[user_name] [varchar](100) NOT NULL,
	[user_email] [varchar](50) NOT NULL,
	[user_mobile] [varchar](50) NOT NULL,
	[login_id] [int] NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (1, 1, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (2, 2, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (3, 3, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (4, 4, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (5, 5, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (6, 6, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (7, 7, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (8, 8, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (9, 9, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (10, 10, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (11, 11, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (12, 12, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (13, 13, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (14, 14, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (15, 15, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (16, 16, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (17, 17, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (18, 18, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (19, 19, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (20, 20, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (21, 21, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (22, 22, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (23, 23, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (24, 24, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (25, 25, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (26, 26, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (27, 27, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (28, 28, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (29, 29, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (30, 30, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (31, 31, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (32, 32, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (33, 33, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (34, 34, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (35, 35, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (36, 36, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (37, 37, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (38, 38, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (39, 39, 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (40, 40, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (41, 41, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (42, 42, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (43, 43, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (44, 44, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (45, 45, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (46, 46, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (47, 47, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (48, 48, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (49, 49, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (50, 50, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (51, 51, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (52, 52, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (53, 53, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (54, 54, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (55, 55, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (56, 56, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (57, 57, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (58, 58, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (59, 59, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (60, 60, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (61, 61, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (62, 62, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (63, 63, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (64, 64, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (65, 65, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (66, 66, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (67, 67, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (68, 68, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (69, 69, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (70, 70, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (71, 71, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (72, 72, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (73, 73, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (74, 74, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (75, 75, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (76, 76, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (77, 77, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (78, 78, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (79, 79, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (80, 80, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (81, 81, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (82, 82, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (83, 83, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (84, 84, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (85, 85, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (86, 86, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (87, 87, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (88, 88, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (89, 89, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (90, 90, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (91, 91, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (92, 92, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (93, 93, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (94, 94, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (95, 95, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (96, 96, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (97, 97, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (98, 98, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (99, 99, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (100, 100, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (101, 101, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (102, 102, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (103, 103, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (104, 104, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (105, 105, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (106, 106, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (107, 107, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (108, 108, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (109, 109, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (110, 110, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (111, 111, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (112, 112, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (113, 113, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (114, 114, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (115, 115, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (116, 116, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (117, 117, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (118, 118, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (119, 119, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (120, 120, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (121, 121, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (122, 122, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (123, 123, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (124, 124, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (125, 125, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (126, 126, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (127, 127, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (128, 128, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (129, 129, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (130, 130, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (131, 131, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (132, 132, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (133, 133, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (134, 134, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (135, 135, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (136, 136, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (137, 137, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (138, 138, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (139, 139, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (140, 140, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (141, 141, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (142, 142, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (143, 143, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (144, 144, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (145, 145, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (146, 146, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (147, 147, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (148, 148, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (149, 149, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (150, 150, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (151, 151, 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (152, 152, 4, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (153, 153, 4, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (154, 154, 4, CAST(N'2022-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (155, 1, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (156, 2, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (157, 3, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (158, 4, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (159, 5, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (160, 6, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (161, 7, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (162, 8, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (163, 9, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (164, 10, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (165, 11, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (166, 12, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (167, 13, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (168, 14, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (169, 15, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (170, 16, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (171, 17, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (172, 18, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (173, 19, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (174, 20, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (175, 21, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (176, 22, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (177, 23, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (178, 24, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (179, 25, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (180, 26, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (181, 27, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (182, 28, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (183, 29, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (184, 30, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (185, 31, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (186, 32, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (187, 33, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (188, 34, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (189, 35, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (190, 36, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (191, 37, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (192, 38, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (193, 39, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (194, 40, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (195, 41, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (196, 42, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (197, 43, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (198, 44, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (199, 45, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (200, 46, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (201, 47, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (202, 48, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (203, 49, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (204, 50, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (205, 51, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (206, 52, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (207, 53, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (208, 54, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (209, 55, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (210, 56, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (211, 57, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (212, 58, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (213, 59, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (214, 60, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (215, 61, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (216, 62, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (217, 63, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (218, 64, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (219, 65, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (220, 66, 2, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (221, 67, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (222, 68, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (223, 69, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (224, 70, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (225, 71, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (226, 72, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (227, 73, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (228, 74, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (229, 75, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (230, 76, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (231, 77, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (232, 78, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (233, 79, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (234, 80, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (235, 81, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (236, 82, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (237, 83, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (238, 84, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (239, 85, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (240, 86, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (241, 87, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (242, 88, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (243, 89, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (244, 90, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (245, 91, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (246, 92, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (247, 93, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (248, 94, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (249, 95, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (250, 96, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (251, 97, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (252, 98, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (253, 99, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (254, 100, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (255, 101, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (256, 102, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (257, 103, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (258, 104, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (259, 105, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (260, 106, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (261, 107, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (262, 108, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (263, 109, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (264, 110, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (265, 111, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (266, 112, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (267, 113, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (268, 114, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (269, 115, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (270, 116, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (271, 117, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (272, 118, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (273, 119, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (274, 120, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (275, 121, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (276, 122, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (277, 123, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (278, 124, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (279, 125, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (280, 126, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (281, 127, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (282, 128, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (283, 129, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (284, 130, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (285, 131, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (286, 132, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (287, 133, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (288, 134, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (289, 135, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (290, 136, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (291, 137, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (292, 138, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (293, 139, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (294, 140, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (295, 141, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (296, 142, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (297, 143, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (298, 144, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (299, 145, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (300, 146, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (301, 147, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (302, 148, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (303, 149, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (304, 150, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (305, 151, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (306, 152, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (307, 153, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (308, 154, 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (309, 1, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (310, 2, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (311, 3, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (312, 4, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (313, 5, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (314, 6, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (315, 7, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (316, 8, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (317, 9, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (318, 10, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (319, 11, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (320, 12, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (321, 13, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (322, 14, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (323, 15, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (324, 16, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (325, 17, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (326, 18, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (327, 19, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (328, 20, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (329, 21, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (330, 22, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (331, 23, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (332, 24, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (333, 25, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (334, 26, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (335, 27, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (336, 28, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (337, 29, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (338, 30, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (339, 31, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (340, 32, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (341, 33, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (342, 34, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (343, 35, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (344, 36, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (345, 37, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (346, 38, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (347, 39, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (348, 40, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (349, 41, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (350, 42, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (351, 43, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (352, 44, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (353, 45, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (354, 46, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (355, 47, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (356, 48, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (357, 49, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (358, 50, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (359, 51, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (360, 52, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (361, 53, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (362, 54, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (363, 55, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (364, 56, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (365, 57, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (366, 58, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (367, 59, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (368, 60, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (369, 61, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (370, 62, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (371, 63, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (372, 64, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (373, 65, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (374, 66, 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (375, 67, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (376, 68, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (377, 69, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (378, 70, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (379, 71, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (380, 72, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (381, 73, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (382, 74, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (383, 75, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (384, 76, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (385, 77, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (386, 78, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (387, 79, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (388, 80, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (389, 81, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (390, 82, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (391, 83, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (392, 84, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (393, 85, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (394, 86, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (395, 87, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (396, 88, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (397, 89, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (398, 90, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (399, 91, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (400, 92, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (401, 93, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (402, 94, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (403, 95, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (404, 96, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (405, 97, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (406, 98, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (407, 99, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (408, 100, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (409, 101, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (410, 102, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (411, 103, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (412, 104, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (413, 105, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (414, 106, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (415, 107, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (416, 108, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (417, 109, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (418, 110, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (419, 111, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (420, 112, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (421, 113, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (422, 114, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (423, 115, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (424, 116, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (425, 117, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (426, 118, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (427, 119, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (428, 120, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (429, 121, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (430, 122, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (431, 123, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (432, 124, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (433, 125, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (434, 126, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (435, 127, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (436, 128, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (437, 129, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (438, 130, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (439, 131, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (440, 132, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (441, 133, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (442, 134, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (443, 135, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (444, 136, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (445, 137, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (446, 138, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (447, 139, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (448, 140, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (449, 141, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (450, 142, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (451, 143, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (452, 144, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (453, 145, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (454, 146, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (455, 147, 4, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (456, 148, 4, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (457, 149, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (458, 150, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (459, 151, 4, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (460, 152, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (461, 153, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Attendance] ([att_id], [att_stud_id], [att_type_id], [att_time_stamp]) VALUES (462, 154, 1, CAST(N'2022-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[AttendanceType] ([att_type_id], [att_type_name]) VALUES (1, N'Present')
GO
INSERT [dbo].[AttendanceType] ([att_type_id], [att_type_name]) VALUES (2, N'Absent')
GO
INSERT [dbo].[AttendanceType] ([att_type_id], [att_type_name]) VALUES (3, N'Half Day Present')
GO
INSERT [dbo].[AttendanceType] ([att_type_id], [att_type_name]) VALUES (4, N'Outdoor Events')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (1, N'admin_user', N'admin@123')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (2, N'Ashrith', N'as@123')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (3, N'Susmitha', N'su@567')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (4, N'Vinod', N'vi@765')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (5, N'Rahul', N'ra@123')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (6, N'Dipya', N'di@165')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (7, N'Abhay', N'ab@183')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (8, N'Karan', N'ka@193')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (9, N'Usman', N'us@183')
GO
INSERT [dbo].[Login] ([login_id], [login_username], [login_user_pwd]) VALUES (10, N'Kunal', N'ku@133')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (1, N'Fee of amount INR 100 is due by 2022-01-15', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'student1@email.com;student2@email.com', N'finance@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (2, N'Semester 2 exam starts on 2022-06-01', CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'students-2021@email.com', N'exams@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (3, N'Semester 1 Results are out', CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'students-2021@email.com', N'exams@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (4, N'No classes on 2022-10-02', CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'students-all@email.com;faculties-all@email.com', N'exams@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (5, N'Admissions for 2023 have started', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'faculties-all@email.com', N'admissions@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (6, N'Hands on Training Programme on CNC Programming and Machining', CAST(N'2022-10-21T00:00:00.000' AS DateTime), N'students-all@email.com', N'coe@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (7, N'One-day Workshop on "Entrepreneurship & Business opportunities in 3D Printing Industries"', CAST(N'2022-09-09T00:00:00.000' AS DateTime), N'students-all@email.com', N'coe@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (8, N'Up-Skilling program in IoT Technologies in collaboration with C-DAC', CAST(N'2022-10-25T00:00:00.000' AS DateTime), N'students-all@email.com', N'coe@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (9, N'College Fest on 2022-12-20', CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'students-all@email.com;faculties-all@email.com', N'admin@email.com', N'admin@email.com')
GO
INSERT [dbo].[Message] ([msg_id], [msg_text], [time_stamp], [to], [cc], [bcc]) VALUES (10, N'Farewell for 2020 Batch', CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'students-2023@email.com;faculties-all@email.com', N'coe@email.com', N'admin@email.com')
GO
INSERT [dbo].[Report] ([rpt_id], [rpt_type], [rpt_name]) VALUES (1, N'Excel', N'Monthly Attendance Report')
GO
INSERT [dbo].[Report] ([rpt_id], [rpt_type], [rpt_name]) VALUES (2, N'Excel', N'Monthly absense percentage report')
GO
INSERT [dbo].[Report] ([rpt_id], [rpt_type], [rpt_name]) VALUES (3, N'Excel', N'Quartely Attendance Report')
GO
INSERT [dbo].[Report] ([rpt_id], [rpt_type], [rpt_name]) VALUES (4, N'Excel', N'Quartely absense percentage report')
GO
INSERT [dbo].[Report] ([rpt_id], [rpt_type], [rpt_name]) VALUES (5, N'Excel', N'Annual Attendance Report')
GO
INSERT [dbo].[Report] ([rpt_id], [rpt_type], [rpt_name]) VALUES (6, N'Excel', N'Annual absense percentage report')
GO
INSERT [dbo].[Role] ([role_id], [role_name], [role_description]) VALUES (1, N'Admin', N'Admin role')
GO
INSERT [dbo].[Role] ([role_id], [role_name], [role_description]) VALUES (2, N'Teacher', N'Teacher Role')
GO
INSERT [dbo].[Role] ([role_id], [role_name], [role_description]) VALUES (3, N'Student', N'Student Role')
GO
INSERT [dbo].[Role] ([role_id], [role_name], [role_description]) VALUES (4, N'Parent', N'Parent Role')
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (1, N'Rahul', N'Singh', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456789', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (2, N'Dipya', N'Kumari', N'F', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911211456780', CAST(N'1995-03-04T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (3, N'Karan', N'Khemka', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456781', CAST(N'1995-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (4, N'Anuj', N'Raheja', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456782', CAST(N'1995-02-23T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (5, N'Depali', N'Pant', N'F', N'Indian', N'lowerlevel', N'G-06', N'C', N'First', N'911230456783', CAST(N'1995-03-03T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (6, N'Renu', N'Pathak', N'F', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456784', CAST(N'1994-12-12T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (7, N'Abhay', N'Joshi', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456785', CAST(N'1995-01-13T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (8, N'Vinod', N'Charan', N'M', N'Indian', N'lowerlevel', N'G-02', N'D', N'First', N'911230456786', CAST(N'1995-07-17T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (9, N'Ketaki', N'Patel', N'F', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456787', CAST(N'1995-08-12T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (10, N'Usman', N'Khan', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456788', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (11, N'Rahul1', N'Singh1', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456789', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (12, N'Rahul2', N'Singh2', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456790', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (13, N'Rahul3', N'Singh3', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456791', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (14, N'Rahul4', N'Singh4', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456792', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (15, N'Rahul5', N'Singh5', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456793', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (16, N'Rahul6', N'Singh6', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456794', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (17, N'Rahul7', N'Singh7', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456795', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (18, N'Rahul8', N'Singh8', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456796', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (19, N'Rahul9', N'Singh9', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456797', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (20, N'Rahul10', N'Singh10', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456798', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (21, N'Rahul11', N'Singh11', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456799', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (22, N'Rahul12', N'Singh12', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456800', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (23, N'Rahul13', N'Singh13', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456801', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (24, N'Rahul14', N'Singh14', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456802', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (25, N'Rahul15', N'Singh15', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456803', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (26, N'Rahul16', N'Singh16', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456804', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (27, N'Rahul17', N'Singh17', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456805', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (28, N'Rahul18', N'Singh18', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456806', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (29, N'Rahul19', N'Singh19', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456807', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (30, N'Rahul20', N'Singh20', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456808', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (31, N'Rahul21', N'Singh21', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456809', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (32, N'Rahul22', N'Singh22', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456810', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (33, N'Rahul23', N'Singh23', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456811', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (34, N'Rahul24', N'Singh24', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456812', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (35, N'Rahul25', N'Singh25', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456813', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (36, N'Rahul26', N'Singh26', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456814', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (37, N'Rahul27', N'Singh27', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456815', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (38, N'Rahul28', N'Singh28', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456816', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (39, N'Rahul29', N'Singh29', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456817', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (40, N'Rahul30', N'Singh30', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456818', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (41, N'Rahul31', N'Singh31', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456819', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (42, N'Rahul32', N'Singh32', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456820', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (43, N'Rahul33', N'Singh33', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456821', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (44, N'Rahul34', N'Singh34', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456822', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (45, N'Rahul35', N'Singh35', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456823', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (46, N'Rahul36', N'Singh36', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456824', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (47, N'Rahul37', N'Singh37', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456825', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (48, N'Rahul38', N'Singh38', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456826', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (49, N'Rahul39', N'Singh39', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456827', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (50, N'Rahul40', N'Singh40', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456828', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (51, N'Rahul41', N'Singh41', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456829', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (52, N'Rahul42', N'Singh42', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456830', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (53, N'Rahul43', N'Singh43', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456831', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (54, N'Rahul44', N'Singh44', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456832', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (55, N'Rahul45', N'Singh45', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456833', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (56, N'Rahul46', N'Singh46', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456834', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (57, N'Rahul47', N'Singh47', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456835', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (58, N'Rahul48', N'Singh48', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456836', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (59, N'Rahul49', N'Singh49', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456837', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (60, N'Rahul50', N'Singh50', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456838', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (61, N'Rahul51', N'Singh51', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456839', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (62, N'Rahul52', N'Singh52', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456840', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (63, N'Rahul53', N'Singh53', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456841', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (64, N'Rahul54', N'Singh54', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456842', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (65, N'Rahul55', N'Singh55', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456843', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (66, N'Rahul56', N'Singh56', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456844', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (67, N'Rahul57', N'Singh57', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456845', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (68, N'Rahul58', N'Singh58', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456846', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (69, N'Rahul59', N'Singh59', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456847', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (70, N'Rahul60', N'Singh60', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456848', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (71, N'Rahul61', N'Singh61', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456849', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (72, N'Rahul62', N'Singh62', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456850', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (73, N'Rahul63', N'Singh63', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456851', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (74, N'Rahul64', N'Singh64', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456852', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (75, N'Rahul65', N'Singh65', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456853', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (76, N'Rahul66', N'Singh66', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456854', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (77, N'Rahul67', N'Singh67', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456855', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (78, N'Rahul68', N'Singh68', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456856', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (79, N'Rahul69', N'Singh69', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456857', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (80, N'Rahul70', N'Singh70', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456858', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (81, N'Rahul71', N'Singh71', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456859', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (82, N'Rahul72', N'Singh72', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456860', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (83, N'Rahul73', N'Singh73', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456861', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (84, N'Rahul74', N'Singh74', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456862', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (85, N'Rahul75', N'Singh75', N'M', N'Indian', N'lowerlevel', N'G-06', N'A', N'First', N'911230456863', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (86, N'Rahul76', N'Singh76', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456864', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (87, N'Rahul77', N'Singh77', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456865', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (88, N'Rahul78', N'Singh78', N'M', N'Indian', N'lowerlevel', N'G-02', N'A', N'First', N'911230456866', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (89, N'Rahul79', N'Singh79', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456867', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (90, N'Rahul80', N'Singh80', N'M', N'Indian', N'lowerlevel', N'G-01', N'A', N'First', N'911230456868', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (91, N'Rahul81', N'Singh81', N'M', N'Indian', N'lowerlevel', N'G-05', N'A', N'First', N'911230456869', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (92, N'Rahul82', N'Singh82', N'M', N'Indian', N'lowerlevel', N'G-07', N'A', N'First', N'911230456870', CAST(N'1995-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (93, N'Usman1', N'Khan2', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456788', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (94, N'Usman2', N'Khan3', N'M', N'Indian', N'lowerlevel', N'G-02', N'B', N'First', N'911230456789', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (95, N'Usman3', N'Khan4', N'M', N'Indian', N'lowerlevel', N'G-03', N'B', N'First', N'911230456790', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (96, N'Usman4', N'Khan5', N'M', N'Indian', N'lowerlevel', N'G-04', N'B', N'First', N'911230456791', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (97, N'Usman5', N'Khan6', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456792', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (98, N'Usman6', N'Khan7', N'M', N'Indian', N'lowerlevel', N'G-06', N'B', N'First', N'911230456793', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (99, N'Usman7', N'Khan8', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456794', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (100, N'Usman8', N'Khan9', N'M', N'Indian', N'lowerlevel', N'G-08', N'B', N'First', N'911230456795', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (101, N'Usman9', N'Khan10', N'M', N'Indian', N'lowerlevel', N'G-09', N'B', N'First', N'911230456796', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (102, N'Usman10', N'Khan11', N'M', N'Indian', N'lowerlevel', N'G-10', N'B', N'First', N'911230456797', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (103, N'Usman11', N'Khan12', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456798', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (104, N'Usman12', N'Khan13', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456799', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (105, N'Usman13', N'Khan14', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456800', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (106, N'Usman14', N'Khan15', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456801', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (107, N'Usman15', N'Khan16', N'M', N'Indian', N'lowerlevel', N'G-06', N'B', N'First', N'911230456802', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (108, N'Usman16', N'Khan17', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456803', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (109, N'Usman17', N'Khan18', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456804', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (110, N'Usman18', N'Khan19', N'M', N'Indian', N'lowerlevel', N'G-02', N'B', N'First', N'911230456805', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (111, N'Usman19', N'Khan20', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456806', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (112, N'Usman20', N'Khan21', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456807', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (113, N'Usman21', N'Khan22', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456808', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (114, N'Usman22', N'Khan23', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456809', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (115, N'Usman23', N'Khan24', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456810', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (116, N'Usman24', N'Khan25', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456811', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (117, N'Usman25', N'Khan26', N'M', N'Indian', N'lowerlevel', N'G-06', N'B', N'First', N'911230456812', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (118, N'Usman26', N'Khan27', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456813', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (119, N'Usman27', N'Khan28', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456814', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (120, N'Usman28', N'Khan29', N'M', N'Indian', N'lowerlevel', N'G-02', N'B', N'First', N'911230456815', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (121, N'Usman29', N'Khan30', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456816', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (122, N'Usman30', N'Khan31', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456817', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (123, N'Usman31', N'Khan32', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456818', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (124, N'Usman32', N'Khan33', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456819', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (125, N'Usman33', N'Khan34', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456820', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (126, N'Usman34', N'Khan35', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456821', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (127, N'Usman35', N'Khan36', N'M', N'Indian', N'lowerlevel', N'G-06', N'B', N'First', N'911230456822', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (128, N'Usman36', N'Khan37', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456823', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (129, N'Usman37', N'Khan38', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456824', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (130, N'Usman38', N'Khan39', N'M', N'Indian', N'lowerlevel', N'G-02', N'B', N'First', N'911230456825', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (131, N'Usman39', N'Khan40', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456826', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (132, N'Usman40', N'Khan41', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456827', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (133, N'Usman41', N'Khan42', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456828', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (134, N'Usman42', N'Khan43', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456829', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (135, N'Usman43', N'Khan44', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456830', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (136, N'Usman44', N'Khan45', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456831', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (137, N'Usman45', N'Khan46', N'M', N'Indian', N'lowerlevel', N'G-06', N'B', N'First', N'911230456832', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (138, N'Usman46', N'Khan47', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456833', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (139, N'Usman47', N'Khan48', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456834', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (140, N'Usman48', N'Khan49', N'M', N'Indian', N'lowerlevel', N'G-02', N'B', N'First', N'911230456835', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (141, N'Usman49', N'Khan50', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456836', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (142, N'Usman50', N'Khan51', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456837', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (143, N'Usman51', N'Khan52', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456838', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (144, N'Usman52', N'Khan53', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456839', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (145, N'Usman53', N'Khan54', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456840', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (146, N'Usman54', N'Khan55', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456841', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (147, N'Usman55', N'Khan56', N'M', N'Indian', N'lowerlevel', N'G-06', N'B', N'First', N'911230456842', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (148, N'Usman56', N'Khan57', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456843', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (149, N'Usman57', N'Khan58', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456844', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (150, N'Usman58', N'Khan59', N'M', N'Indian', N'lowerlevel', N'G-02', N'B', N'First', N'911230456845', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (151, N'Usman59', N'Khan60', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456846', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (152, N'Usman60', N'Khan61', N'M', N'Indian', N'lowerlevel', N'G-01', N'B', N'First', N'911230456847', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (153, N'Usman61', N'Khan62', N'M', N'Indian', N'lowerlevel', N'G-05', N'B', N'First', N'911230456848', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([stu_id], [stu_first_name], [stu_last_name], [gender], [nationality], [ed_level], [grade], [section], [semester], [stu_contact], [date_of_birth], [admission_date]) VALUES (154, N'Usman62', N'Khan63', N'M', N'Indian', N'lowerlevel', N'G-07', N'B', N'First', N'911230456849', CAST(N'1995-09-19T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (1, N'Ashrith', N'ashrith01@email.com', N'+91 9876545210', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (2, N'Bharath', N'bharath@email.com', N'+91 9876543674', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (3, N'Susmitha', N'susmitha@email.com', N'+91 7896543456', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (4, N'Rahul Singh', N'rahul@email.com', N'+91 9896794345', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (5, N'Dipya Kumari', N'dipya@email.com', N'+91 6898573456', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (6, N'Karan Khemka', N'karan@email.com', N'+91 9845593456', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (7, N'Abhay Joshi', N'abhay@email.com', N'+91 8868573457', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (8, N'vinod Charan', N'vinod@email.com', N'+91 7898573456', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (9, N'Usman Khan', N'usman@email.com', N'+91 9896573456', NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_mobile], [login_id], [role_id]) VALUES (10, N'Kunal Mehatha', N'karan@email.com', N'+91 8898583456', NULL, NULL)
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_AttendanceType] FOREIGN KEY([att_type_id])
REFERENCES [dbo].[AttendanceType] ([att_type_id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_AttendanceType]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([att_stud_id])
REFERENCES [dbo].[Student] ([stu_id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Login] FOREIGN KEY([login_id])
REFERENCES [dbo].[Login] ([login_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Login]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [SchoolAttendanceDB] SET  READ_WRITE 
GO
