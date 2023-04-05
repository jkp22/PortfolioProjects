--Create two tables: tblOMEmployee and tblOMDepartment
IF OBJECT_ID(N'[tblSCAMembership]') is NOT NULL
	DROP Table [tblSCAMembership];

CREATE TABLE [dbo].[tblSCAMembership](
	[MembershipID] [int] IDENTITY(1,1) NOT NULL Primary Key,
	[MembershipNumber] [int] NULL,
	[isCurrentMember] [bit] NULL,
	[MembershipTypeID] [int] NULL,
	[MembershipFeePaidDate] [Date] NULL
)

--Insert the data
SET IDENTITY_INSERT [dbo].[tblSCAMembership] ON 
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (49, 1628, 1, 22, '12/1/2017')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (50, 5806, 1, 22, '12/1/2017')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (51, 8131, 1, 22, '12/1/2017')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (52, 499, 1, 23, '12/1/2018')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (53, 3638, 1, 23, '12/1/2017')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (54, 5082, 1, 23, '12/1/2017')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (55, 6812, 0, 23, '12/1/2016')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (56, 9854, 0, 23, '12/1/2016')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (57, 410, 0, 24, '12/1/2016')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (58, 668, 0, 24, NULL)
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (59, 959, 0, 24, NULL)
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (60, 1345, 0, 24, NULL)
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (61, 1633, 0, 24, NULL)
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (62, 1949, 1, 24, '12/1/2019')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (63, 2226, 1, 24, '12/1/2019')
INSERT [dbo].[tblSCAMembership] ([MembershipID], [MembershipNumber], [isCurrentMember], [MembershipTypeID], [MembershipFeePaidDate]) VALUES (64, 2281, 1, 24, '12/1/2019')
SET IDENTITY_INSERT [dbo].[tblSCAMembership] OFF
