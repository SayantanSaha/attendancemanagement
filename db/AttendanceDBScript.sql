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
/****** Object:  Table [dbo].[AttendanceType]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[Login]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[Message]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[Report]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[Search]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 2022-09-20 2:42:26 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2022-09-20 2:42:26 PM ******/
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
