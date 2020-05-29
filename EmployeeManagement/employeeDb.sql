USE [master]
GO
/****** Object:  Database [EmployeeDb]    Script Date: 5/28/2020 11:19:41 PM ******/
CREATE DATABASE [EmployeeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.RYKAMOL\MSSQL\DATA\EmployeeDb.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.RYKAMOL\MSSQL\DATA\EmployeeDb_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EmployeeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDb] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/28/2020 11:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/28/2020 11:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Designation] [nvarchar](max) NULL,
	[JoinDate] [datetime] NOT NULL,
	[CurrentSalary] [float] NOT NULL,
	[Department] [nvarchar](max) NULL,
	[NextReviewDate] [datetime] NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Gender] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202005280849248_addingEmployeeModel', N'EmployeeManagement.Migrations.Configuration', 0x1F8B0800000000000400CD58DB6EE336107D2FD07F10F4D402592B979736907791B593226D6E88B2FB4E4B639B2845AA2495DADFB60FFDA4FE4287BA529493C8970D0ABFC824E7CC45C33933FAF7DB3FE1A755CABC67908A0A3EF64F46C7BE073C1609E58BB19FEBF9875FFC4F1F7FFC21BC4CD295F7B53E7766CEA12457637FA975761E042A5E424AD428A5B1144ACCF52816694012119C1E1FFF1A9C9C0480103E62795EF898734D5328FEE0DF89E031643A27EC5624C054B58E3B5181EADD911454466218FB9769C6C41AE09670B28014B81EA1B88695F6BD0B46095A14019BFB1EE15C68A2D1DEF32F0A222D055F44192E10F6B4CE00CFCD095350F971DE1E1FEAD2F1A9712968056BA838575AA45B029E9C55310A5CF19D22ED3731C4285E62B4F5DA785D44B20DA2EFB9CACE274C9A831B035DBE9D51BD73E4F5CF1C354982B9647E47DE24673A9730E6906B49D891F790CF188DFF80F593F813F898E78CD9E6A2C1B8D759C0A5072932907AFD08F3CA89EBC4F782AE5CE00A3662964CE9DE35D767A7BE7787CAC98C41930D5628222D24FC061C24D1903C10AD41728301453C7BDA1D5D57542A6D1E6B95988378AD7CEF96AC6E802FF472ECE3A3EF5DD11524F54A65C6174EF116A2909639BCA5E99626098377517543DEC9A72928BAE0D505F8CEBA7E17944FF11DD78ACCF313354EF6D2E375A0492E252647441891EB064D60BE6F8F35858C486DEED477F7FF0EABE7233C53F8FB20513082F7F3CF54EAE5DE5878FD1290078E4018B415B15F270D9D108AB7DE2996D3594334BDAA890C53154E5529EC7A552247A01D4CE57BAD2925738DDAE2BCC9E6C6BA96248392256B360D5EA0D3F096641986CFA2D76AC58B4A6E9D7C88B6279BB4C40862B581731A6B1B4D5853912A9C5D548D961605133385CC8879819324ED1DEBBF8B17E25CEB73C3EDD24A1BFD5AC23C77A5FAAD46FB8E1CBC36A657E8A611293C86C62E8B7B7BA245BF634AC706D29A0896A7FC25E27B4DDAA2211BC45A1E8E65138D0D66AF0F476BB9C4C66A57872375C8C206EB6C0CC76B09C1066B578723398C60C3395BDB78DB3243D7D9767D389A5BFC6D44776F0B1B6D0EE818696F0CC7AB79C086AAD7FA2861E0DC42F7DA07BD7BEF34926E2179AD12BB471AED4D45762A6F5855C1B7A79D5E592C8FF81E86E79926A624466BA5211D9903A3E82F3661B44880FA00162F3A07A5CB5EDBC741E3D41994FE3F434BA054C2064E2EEF3E305013D53747822DDB9BDE8CC09F898C9744FE9492D5CF36DC6E73C05E706EAFBF17D8867E7E2F3CB7674FF0591FAC679F3341F4015AF6BD5CDCDC96EFECE886B67C67AC6E5BBE8597DBB5DEFDAE70585BFD6A575D9650747E26D081D250AB1FDFB1E9EE97F430B03F7385E5056820CC472F0EB1B90F2D687DE69ACF451D71F4CEB6A83EE25E7DD004DF26B9909ACE49AC713B06A58A69E92B6179E1E30C926B7E9FEB2CD7174A413A639DBE230C5ED75F4C165D9BC3FBCCFC53877001CDA42621EFF9E79CB2A4B1FBAA9F902F41987CA9AA335A85D322C22DD60DD29DE00381AAF0E1853689CEF51360822098BAE71179865D6CC311F10616245ED7CCFC32C8DB2FA21BF6704AC94292545518ADBCF9741B986FB71FFF039B07B6E7ED150000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202005281037546_removeMiddleNamePropFromEmployeeModel', N'EmployeeManagement.Migrations.Configuration', 0x1F8B0800000000000400CD58CD6EE33610BE17E83B083A6D81AC959F4B1BC8BBC8DA4991368E8328BB775A1ADB4429522529D77EB63DF491FA0A1DEA5F94EDC88E77B1F0452667BEF9E1F09B91FEFBFAAFFF711D3367055251C187EEC5E0DC75808722A27C3174533D7FFFABFBF1C3CF3FF9B751BC76BE947257460E35B91ABA4BAD936BCF53E11262A206310DA55062AE07A1883D1209EFF2FCFC37EFE2C203847011CB71FCE7946B1A43F607FF8E040F21D1296113110153C53AEE0419AAF3486250090961E8DEC609131B8009E1640131703D40750D6BED3A378C12F4280036771DC2B9D044A3BFD79F15045A0ABE08125C20EC659300CACD095350C4715D8BF70DE9FCD284E4D58A2554982A2DE203012FAE8A1C79B6FA519976AB1C62166F31DB7A63A2CE325927D1756C63D723268DE0D644E7A7332877CE9CAECC595524584BE677E68C52A65309430EA996849D394FE98CD1F04FD8BC88BF800F79CA58D35D7418F75A0BB8F4244502526F9E615E04711FB98ED7D6F36CC54AADA1938777CFF5D5A5EB3CA271326350554323158116127E070E9268889E88D620B9C1802C9F1DEB96AD3B2A95368FA549AC41BC56AE3321EB07E00BBD1CBAF8E83A77740D51B952B8F19953BC85A8A4650AAF597A20DFC9D018145DF0A22ABFB1AD3F04E5634C7C69C83CBF501364E7CCF6038D5229F1C402C288DC5468028BF070AC3124446A53E8DF3CFE47A4B4675851F8E72459308AD3F9272AF5F2CD587827229027CE80EFD534D5252FC3F184E255B4186C3CABD8BF436548FB059BA9C2603BAA1C39006D612AD7A95DC9DBC9A066CC6D3E57DED59DCBCB5B57D9E2BC1D3DCE9F9024C1F4357A5EB1E20479C31BBD0F0EEF00718EE1856A4B23A8BCAD2C21D1217F5BBB681A3DCD580C2B85CC8839C0511477C4BA67B123CFA53D3BDD36D7D7D92F35CC735BABDBFFEB33B2F0EA9CDE619846258B182ABF1A0DB1A39A0D21863AB67492916069CC7775A37DDA8DDED004692CF7C7AAD9BF0955AFF6476AD17B13ACB5D11FAFA6F02658BDDA1FC9E2F0269CB57548B43597B783ADD7FBA3D974DD44B4F70EF0B1C9DA2D279B1BFDF14AE66E42956B5D14DFB3EE8D7D51BDCE4DB5E631FBEAEFE34E5BA4B25E71A8C5957EC15BAFBF3474882C17711D4CCF8A4686C4828DD2100F8CC020F89B8D18CD0AA01440BAA173503A1F595D9CD72FADF78D1F67F6F7948A58CF1780EF3E775393D55727EB030792CEA8CD5744864B22DFC564FD4B13EE9871FA4D605B46E637E1D9637184CFFA6463F19C09A24F3015BF29C4ED93EFD1816E997C8FC66A4FBE074479D874DB1DBCFA4DAE7B07D79CF330F899C00072471B23EF91736D97837DAFF979C7CF2F4005613EF67008CD7DA8414B997B3E1765C631BAA647A588752013D0044F93DC484DE724D4B81D8252D90BC917C2D22CC61944F77C9AEA24D5374A413C63AD41C1F7F6DBCF86F7B6CFFE3431FFD429424037A929C829FF945216557EDF750B721784A997824ED12B7C2143B8C5A6427A14BC2750913EBCD0A6D0B97E012C100453531E90151CE31BBE853DC082849BB295EE0679FD20DA69F7C7942C2489558151EB9B4F969EF966F9E17F6BFB59CCE5140000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202005281551221_addingEmployeeModel', N'EmployeeManagement.Migrations.Configuration', 0x1F8B0800000000000400CD58CD6EE33610BE17E83B083A6D81AC959F4B1BC8BBC8DA4991368E8328BB775A1ADB4429522529D77EB63DF491FA0A1DEA5F94EDC88E77B1F0452667BEF9E1F09B91FEFBFAAFFF711D3367055251C187EEC5E0DC75808722A27C3174533D7FFFABFBF1C3CF3FF9B751BC76BE947257460E35B91ABA4BAD936BCF53E11262A206310DA55062AE07A1883D1209EFF2FCFC37EFE2C203847011CB71FCE7946B1A43F607FF8E040F21D1296113110153C53AEE0419AAF3486250090961E8DEC609131B8009E1640131703D40750D6BED3A378C12F4280036771DC2B9D044A3BFD79F15045A0ABE08125C20EC659300CACD095350C4715D8BF70DE9FCD284E4D58A2554982A2DE203012FAE8A1C79B6FA519976AB1C62166F31DB7A63A2CE325927D1756C63D723268DE0D644E7A7332877CE9CAECC595524584BE677E68C52A65309430EA996849D394FE98CD1F04FD8BC88BF800F79CA58D35D7418F75A0BB8F4244502526F9E615E04711FB98ED7D6F36CC54AADA1938777CFF5D5A5EB3CA271326350554323158116127E070E9268889E88D620B9C1802C9F1DEB96AD3B2A95368FA549AC41BC56AE3321EB07E00BBD1CBAF8E83A77740D51B952B8F19953BC85A8A4650AAF597A20DFC9D018145DF0A22ABFB1AD3F04E5634C7C69C83CBF501364E7CCF6038D5229F1C402C288DC5468028BF070AC3124446A53E8DF3CFE47A4B4675851F8E72459308AD3F9272AF5F2CD587827229027CE80EFD534D5252FC3F184E255B4186C3CABD8BF436548FB059BA9C2603BAA1C39006D612AD7A95DC9DBC9A066CC6D3E57DED59DCBCB5B57D9E2BC1D3DCE9F9024C1F4357A5EB1E20479C31BBD0F0EEF00718EE1856A4B23A8BCAD2C21D1217F5BBB681A3DCD580C2B85CC8839C0511477C4BA67B123CFA53D3BDD36D7D7D92F35CC735BABDBFFEB33B2F0EA9CDE619846258B182ABF1A0DB1A39A0D21863AB67492916069CC7775A37DDA8DDED004692CF7C7AAD9BF0955AFF6476AD17B13ACB5D11FAFA6F02658BDDA1FC9E2F0269CB57548B43597B783ADD7FBA3D974DD44B4F70EF0B1C9DA2D279B1BFDF14AE66E42956B5D14DFB3EE8D7D51BDCE4DB5E631FBEAEFE34E5BA4B25E71A8C5957EC15BAFBF3474882C17711D4CCF8A4686C4828DD2100F8CC020F89B8D18CD0AA01440BAA173503A1F595D9CD72FADF78D1F67F6F7948A58CF1780EF3E775393D55727EB030792CEA8CD5744864B22DFC564FD4B13EE9871FA4D605B46E637E1D9637184CFFA6463F19C09A24F3015BF29C4ED93EFD1816E997C8FC66A4FBE074479D874DB1DBCFA4DAE7B07D79CF330F899C00072471B23EF91736D97837DAFF979C7CF2F4005613EF67008CD7DA8414B997B3E1765C631BAA647A588752013D0044F93DC484DE724D4B81D8252D90BC917C2D22CC61944F77C9AEA24D5374A413C63AD41C1F7F6DBCF86F7B6CFFE3431FFD429424037A929C829FF945216557EDF750B721784A997824ED12B7C2143B8C5A6427A14BC2750913EBCD0A6D0B97E012C100453531E90151CE31BBE853DC082849BB295EE0679FD20DA69F7C7942C2489558151EB9B4F969EF966F9E17F6BFB59CCE5140000, N'6.4.4')
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (23, N'kamrujjaman', N'Nai', N'Android Developer', CAST(0x0000ABB400000000 AS DateTime), 234, N'IT', CAST(0x0000ABCB00000000 AS DateTime), CAST(0x0000ABC400000000 AS DateTime), N'male')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (35, N'Jhon', N'Doe', N'Developer', CAST(0x0000ABD100000000 AS DateTime), 50000, N'IT', CAST(0x0000ABCB00000000 AS DateTime), CAST(0x0000ABCB00000000 AS DateTime), N'male')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (38, N'smith', N'steve', N'HR Head', CAST(0x0000ABCA00000000 AS DateTime), 232, N'HR', CAST(0x0000ABCB00000000 AS DateTime), CAST(0x0000ABC400000000 AS DateTime), N'male')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (39, N'Jesika', N'Rahman', N'Front Executive', CAST(0x0000ABCB00000000 AS DateTime), 23423, N'HR', CAST(0x0000ABBD00000000 AS DateTime), CAST(0x0000ABBD00000000 AS DateTime), N'female')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (43, N'james', N'fdas', N'adf', CAST(0x0000ABCB00000000 AS DateTime), 23423, N'ADF', CAST(0x0000ABBD00000000 AS DateTime), CAST(0x0000ABBD00000000 AS DateTime), N'male')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (44, N'Albina', N'Annesley', N'QA Engineer', CAST(0x0000ABCA00000000 AS DateTime), 50000, N'IT', CAST(0x0000ABCB00000000 AS DateTime), CAST(0x0000ABCB00000000 AS DateTime), N'female')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (45, N'Devid', N'Warner', N'Software Engineer', CAST(0x0000ABCA00000000 AS DateTime), 50000, N'IT', CAST(0x0000ABCB00000000 AS DateTime), CAST(0x0000ABCB00000000 AS DateTime), N'male')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (46, N'ADSF', N'roy', NULL, CAST(0x0000ABC900000000 AS DateTime), 50000, NULL, CAST(0x0000ABD200000000 AS DateTime), CAST(0x0000ABD200000000 AS DateTime), N'kamol')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (47, N'ADSF', N'roy', NULL, CAST(0x0000ABC900000000 AS DateTime), 50000, NULL, CAST(0x0000ABD200000000 AS DateTime), CAST(0x0000ABD200000000 AS DateTime), N'kamol')
INSERT [dbo].[Employees] ([Id], [FirstName], [LastName], [Designation], [JoinDate], [CurrentSalary], [Department], [NextReviewDate], [DateOfBirth], [Gender]) VALUES (48, N'Kori ', N'Anderson', N'ADSF', CAST(0x0000ABAE00000000 AS DateTime), 50000, N'ADF', CAST(0x0000ABCA00000000 AS DateTime), CAST(0x0000ABCB00000000 AS DateTime), N'male')
SET IDENTITY_INSERT [dbo].[Employees] OFF
USE [master]
GO
ALTER DATABASE [EmployeeDb] SET  READ_WRITE 
GO
