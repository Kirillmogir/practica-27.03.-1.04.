USE [master]
GO
/****** Object:  Database [MogirPR-30]    Script Date: 01.04.2023 13:26:18 ******/
CREATE DATABASE [MogirPR-30]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MogirPR-30', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MogirPR-30.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MogirPR-30_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MogirPR-30_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MogirPR-30] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MogirPR-30].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MogirPR-30] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MogirPR-30] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MogirPR-30] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MogirPR-30] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MogirPR-30] SET ARITHABORT OFF 
GO
ALTER DATABASE [MogirPR-30] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MogirPR-30] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MogirPR-30] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MogirPR-30] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MogirPR-30] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MogirPR-30] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MogirPR-30] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MogirPR-30] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MogirPR-30] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MogirPR-30] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MogirPR-30] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MogirPR-30] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MogirPR-30] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MogirPR-30] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MogirPR-30] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MogirPR-30] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MogirPR-30] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MogirPR-30] SET RECOVERY FULL 
GO
ALTER DATABASE [MogirPR-30] SET  MULTI_USER 
GO
ALTER DATABASE [MogirPR-30] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MogirPR-30] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MogirPR-30] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MogirPR-30] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MogirPR-30] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MogirPR-30] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MogirPR-30', N'ON'
GO
ALTER DATABASE [MogirPR-30] SET QUERY_STORE = OFF
GO
USE [MogirPR-30]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[id_заказа] [bigint] NOT NULL,
	[Состав] [nvarchar](max) NOT NULL,
	[Дата_заказа] [date] NOT NULL,
	[Дата_доставки] [date] NOT NULL,
	[ФИО_клиента] [nvarchar](100) NULL,
	[Код_для_получения] [int] NOT NULL,
	[id_пункта_выдачи] [bigint] NOT NULL,
	[id_статус_заказа] [bigint] NOT NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[id_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявки]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки](
	[id_заявки] [bigint] NOT NULL,
	[Приоритет] [nchar](10) NOT NULL,
	[Статус] [nchar](10) NOT NULL,
	[id_пользователя] [bigint] NOT NULL,
	[id_поставщика] [bigint] NOT NULL,
 CONSTRAINT [PK_Заявки] PRIMARY KEY CLUSTERED 
(
	[id_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категории_продукции]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категории_продукции](
	[id_категории_продукции] [bigint] NOT NULL,
	[Наименование_продукции] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Категории_продукции] PRIMARY KEY CLUSTERED 
(
	[id_категории_продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[id_пользователя] [bigint] NOT NULL,
	[ФИО] [nvarchar](100) NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[id_роли] [bigint] NOT NULL,
 CONSTRAINT [PK_Пользователи] PRIMARY KEY CLUSTERED 
(
	[id_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщик]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщик](
	[id_поставщика] [bigint] NOT NULL,
	[Название_компании] [nvarchar](50) NULL,
	[юр_адрес] [nvarchar](50) NULL,
	[ИНН] [bigint] NULL,
	[КПП] [bigint] NULL,
	[ФИО_директора] [nvarchar](100) NULL,
	[Телефон] [bigint] NULL,
	[Почта] [nvarchar](50) NULL,
 CONSTRAINT [PK_Поставщик] PRIMARY KEY CLUSTERED 
(
	[id_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукция]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукция](
	[id_продукции] [bigint] NOT NULL,
	[Артикул] [nchar](20) NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Единица_измерения] [nchar](10) NOT NULL,
	[Размер_максимальной_скидки_в_процентах] [int] NOT NULL,
	[Производитель] [nvarchar](50) NOT NULL,
	[id_категории_продукции] [bigint] NOT NULL,
	[Действущая_скидка_в_процентах] [int] NOT NULL,
	[Количество_на_складе] [int] NOT NULL,
	[Минимальный_остаток] [int] NOT NULL,
	[Описание] [nvarchar](max) NULL,
	[Изображение] [image] NULL,
	[id_заявки] [bigint] NOT NULL,
 CONSTRAINT [PK_Продукция] PRIMARY KEY CLUSTERED 
(
	[id_продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пункт_выдачи]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пункт_выдачи](
	[id_пункт_выдачи] [bigint] NOT NULL,
	[Индекс] [int] NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Пункт_выдачи] PRIMARY KEY CLUSTERED 
(
	[id_пункт_выдачи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[id_роли] [bigint] NOT NULL,
	[Доступ] [nvarchar](50) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Роли] PRIMARY KEY CLUSTERED 
(
	[id_роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Состав_заказа]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Состав_заказа](
	[id_состав] [bigint] NOT NULL,
	[id_продукции] [bigint] NOT NULL,
	[id_заказа] [bigint] NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Состав_заказа] PRIMARY KEY CLUSTERED 
(
	[id_состав] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус_заказа]    Script Date: 01.04.2023 13:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус_заказа](
	[id_статус_заказа] [bigint] NOT NULL,
	[Статус] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Статус_заказа] PRIMARY KEY CLUSTERED 
(
	[id_статус_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (1, N'Агафонова Лариса Михаиловна', N'loginDEiry2018', N'5zu7+}', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (2, N'Александров Владимир Дамирович', N'loginDEuuo2018', N'42XmH1', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (3, N'Алексеев Владислав Аркадьевич', N'loginDEbct2018', N'Qg3gff', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (4, N'Архипова Оливия Дмитриевна', N'1', N'1', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (5, N'Белов Роман Иринеевич', N'loginDEfbs2018', N'v90Rep', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (6, N'Бобылёва Юлия Егоровна', N'loginDEmvn2018', N'Mrr9e0', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (7, N'Борисова Анжелика Анатольевна', N'loginDEanv2018', N'Xiq}M3', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (8, N'Брагин Бронислав Георгьевич', N'loginDEfoj2018', N'nhGc+D', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (9, N'Брагина Алина Валерьевна', N'loginDEhuu2018', N'X31OEf', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (10, N'Васильев Серапион Макарович', N'loginDExix2018', N'hzxtnn', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (11, N'Волкова Алла Лукьевна', N'loginDEple2018', N'WlW+l8', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (12, N'Воронов Митрофан Антонович', N'loginDEvht2018', N'zMyS8Z', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (13, N'Галкина Олимпиада Владленовна', N'loginDEqrf2018', N'mI8n58', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (14, N'Герасимов Мстислав Дамирович', N'loginDEqon2018', N'YeFbh6', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (15, N'Горбачёв Пантелеймон Германович', N'loginDEpsu2018', N'Vx9cQ{', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (16, N'Горбунов Вячеслав Станиславович', N'loginDEtto2018', N'qXYDuu', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (17, N'Горшкова Агафья Онисимовна', N'loginDEpst2018', N'0CyGnX', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (18, N'Евсеев Игорь Донатович', N'loginDEmjb2018', N'5mm{ch', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (19, N'Ершова Иванна Максимовна', N'loginDEzqs2018', N'qM9p7i', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (20, N'Зуев Эдуард Пантелеймонович', N'loginDEsnh2018', N'', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (21, N'Калашникова Александра Владимировна', N'loginDEwoe2018', N'yOtw2F', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (22, N'Карпова Ольга Лукьевна', N'loginDEcor2018', N'2cIrC8', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (23, N'Кириллова Эмилия Федосеевна', N'loginDEfku2018', N'a1m+8c', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (24, N'Козлов Геласий Христофорович', N'loginDEvlf2018', N'O5mXc2', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (25, N'Колобова Елена Евгеньевна', N'loginDExxv2018', N'+daE|T', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (26, N'Котов Денис Мартынович', N'loginDEgyi2018', N'|7nYPc', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (27, N'Кошелева Кира Владиславовна', N'loginDEdal2018', N'cJWXL0', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (28, N'Кудрявцев Матвей Игоревич', N'loginDEdof2018', N'kD|LRU', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (29, N'Кудрявцева Таисия Игоревна', N'loginDEhhx2018', N'hmCHeQ', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (30, N'Куликов Андрей Святославович', N'loginDEfsp2018', N'&dtlI+', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (31, N'Маслов Мстислав Антонинович', N'loginDEeqo2018', N'l5CBqA', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (32, N'Медведьева Таисия Тихоновна', N'loginDExyu2018', N'7Fg}9p', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (33, N'Муравьёва Александра Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (34, N'Нестеров Агафон Георгьевич', N'loginDExcd2018', N'SZXZNL', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (35, N'Никонов Мэлс Лукьевич', N'loginDEuro2018', N'a1MIcO', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (36, N'Никонова Татьяна Захаровна', N'1', N'1', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (37, N'Новикова Лукия Ярославовна', N'loginDEwjv2018', N'ZfseKA', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (38, N'Носова Наина Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (39, N'Панфилова Марина Борисовна', N'loginDEbjs2018', N'Xap2ct', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (40, N'Рябова Диана Павловна', N'1', N'1', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (41, N'Савельева Евфросиния Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 1)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (42, N'Семёнова Октябрина Христофоровна', N'loginDEayn2018', N'Ka2Fok', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (43, N'Сергеева Агата Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (44, N'Ситников Николай Филатович', N'loginDEbto2018', N'b1iYMI', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (45, N'Смирнов Сергей Яковович', N'loginDEwld2018', N'y9HStF', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (46, N'Суворов Илья Евсеевич', N'loginDEdgp2018', N'1WfJjo', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (47, N'Суханов Станислав Фролович', N'loginDEzde2018', N'tlO3x&', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (48, N'Тетерина Феврония Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (49, N'Тимофеева Ксения Валерьевна', N'loginDEyfd2018', N'8aKdb0', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (50, N'Туров Денис Геласьевич', N'loginDEioe2018', N'yMPu&2', 3)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (51, N'Фокин Ириней Ростиславович', N'loginDEhsj2018', N's+jrMW', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (52, N'Щербаков Георгий Богданович', N'loginDExrf2018', N'mhpRIT', 2)
INSERT [dbo].[Пользователи] ([id_пользователя], [ФИО], [Логин], [Пароль], [id_роли]) VALUES (53, N'Яковлева Ксения Онисимовна', N'loginDEhlk2018', N'g0jSed', 2)
GO
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (1, 344288, N' г. Ковров, ул. Чехова,1')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (2, 614164, N' г.Ковров,  ул. Степная,30')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (3, 394242, N' г. Ковров, ул. Коммунистическая,43')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (4, 660540, N' г. Ковров, ул. Солнечная,25')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (5, 125837, N' г. Ковров, ул. Шоссейная,40')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (6, 125703, N' г. Ковров, ул. Партизанская,49')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (7, 625283, N' г. Ковров, ул. Победы,46')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (8, 614611, N' г. Ковров, ул. Молодежная,50')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (9, 454311, N' г.Ковров, ул. Новая,19')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (10, 660007, N' г.Ковров, ул. Октябрьская,19')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (11, 603036, N' г. Ковров, ул. Садовая,4')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (12, 450983, N' г.Ковров, ул. Комсомольская,26')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (13, 394782, N' г. Ковров, ул. Чехова,3')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (14, 603002, N' г. Ковров, ул. Дзержинского,28')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (15, 450558, N' г. Ковров, ул. Набережная,30')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (16, 394060, N' г.Ковров, ул. Фрунзе,43')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (17, 410661, N' г. Ковров, ул. Школьная,50')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (18, 625590, N' г. Ковров, ул. Коммунистическая,20')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (19, 625683, N' г. Ковров, ул. 8 Марта,')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (20, 400562, N' г. Ковров, ул. Зеленая,32')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (21, 614510, N' г. Ковров, ул. Маяковского,47')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (22, 410542, N' г. Ковров, ул. Светлая,46')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (23, 620839, N' г. Ковров, ул. Цветочная,8')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (24, 443890, N' г. Ковров, ул. Коммунистическая,1')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (25, 603379, N' г. Ковров, ул. Спортивная,46')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (26, 603721, N' г. Ковров, ул. Гоголя,41')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (27, 410172, N' г. Ковров, ул. Северная,13')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (28, 420151, N' г. Ковров, ул. Вишневая,32')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (29, 125061, N' г. Ковров, ул. Подгорная,8')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (30, 630370, N' г. Ковров, ул. Шоссейная,24')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (31, 614753, N' г. Ковров, ул. Полевая,35')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (32, 426030, N' г. Ковров, ул. Маяковского,44')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (33, 450375, N' г. Ковров, ул. Клубная,44')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (34, 625560, N' г. Ковров, ул. Некрасова,12')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (35, 630201, N' г. Ковров, ул. Комсомольская,17')
INSERT [dbo].[Пункт_выдачи] ([id_пункт_выдачи], [Индекс], [Адрес]) VALUES (36, 190949, N' г. Ковров, ул. Мичурина,26')
GO
INSERT [dbo].[Роли] ([id_роли], [Доступ], [Название]) VALUES (1, N'Полный', N'Администратор')
INSERT [dbo].[Роли] ([id_роли], [Доступ], [Название]) VALUES (2, N'Не_полный', N'Клиент')
INSERT [dbo].[Роли] ([id_роли], [Доступ], [Название]) VALUES (3, N'Частичный', N'Менеджер')
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Пункт_выдачи] FOREIGN KEY([id_пункта_выдачи])
REFERENCES [dbo].[Пункт_выдачи] ([id_пункт_выдачи])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Пункт_выдачи]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Статус_заказа] FOREIGN KEY([id_статус_заказа])
REFERENCES [dbo].[Статус_заказа] ([id_статус_заказа])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Статус_заказа]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Пользователи] FOREIGN KEY([id_пользователя])
REFERENCES [dbo].[Пользователи] ([id_пользователя])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Пользователи]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Поставщик] FOREIGN KEY([id_пользователя])
REFERENCES [dbo].[Поставщик] ([id_поставщика])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Поставщик]
GO
ALTER TABLE [dbo].[Пользователи]  WITH CHECK ADD  CONSTRAINT [FK_Пользователи_Роли] FOREIGN KEY([id_роли])
REFERENCES [dbo].[Роли] ([id_роли])
GO
ALTER TABLE [dbo].[Пользователи] CHECK CONSTRAINT [FK_Пользователи_Роли]
GO
ALTER TABLE [dbo].[Продукция]  WITH CHECK ADD  CONSTRAINT [FK_Продукция_Заявки] FOREIGN KEY([id_заявки])
REFERENCES [dbo].[Заявки] ([id_заявки])
GO
ALTER TABLE [dbo].[Продукция] CHECK CONSTRAINT [FK_Продукция_Заявки]
GO
ALTER TABLE [dbo].[Продукция]  WITH CHECK ADD  CONSTRAINT [FK_Продукция_Категории_продукции] FOREIGN KEY([id_категории_продукции])
REFERENCES [dbo].[Категории_продукции] ([id_категории_продукции])
GO
ALTER TABLE [dbo].[Продукция] CHECK CONSTRAINT [FK_Продукция_Категории_продукции]
GO
ALTER TABLE [dbo].[Состав_заказа]  WITH CHECK ADD  CONSTRAINT [FK_Состав_заказа_Заказы] FOREIGN KEY([id_заказа])
REFERENCES [dbo].[Заказы] ([id_заказа])
GO
ALTER TABLE [dbo].[Состав_заказа] CHECK CONSTRAINT [FK_Состав_заказа_Заказы]
GO
ALTER TABLE [dbo].[Состав_заказа]  WITH CHECK ADD  CONSTRAINT [FK_Состав_заказа_Продукция] FOREIGN KEY([id_продукции])
REFERENCES [dbo].[Продукция] ([id_продукции])
GO
ALTER TABLE [dbo].[Состав_заказа] CHECK CONSTRAINT [FK_Состав_заказа_Продукция]
GO
USE [master]
GO
ALTER DATABASE [MogirPR-30] SET  READ_WRITE 
GO
