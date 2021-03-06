USE [solarpaces]
GO
/****** Object:  Table [dbo].[data_users]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[data_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[email] [varchar](100) NOT NULL,
	[old_pwd] [char](40) NULL,
	[password] [char](40) NULL,
	[level_name] [varchar](50) NOT NULL,
	[level_id] [int] NOT NULL,
	[reset] [bit] NOT NULL,
	[attempts] [int] NOT NULL,
	[expires] [datetime] NOT NULL,
	[last_login] [datetime] NULL,
	[organization] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataDishes]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataDishes](
	[ProjectID] [int] NOT NULL,
	[NumberDishes] [int] NULL,
	[DishApertureArea] [smallint] NULL,
	[DishApertureAreaUnits] [varchar](10) NULL,
	[DishManufacturer1] [varchar](255) NULL,
	[DishModel1] [varchar](255) NULL,
	[DishDescription1] [varchar](255) NULL,
	[DishManufacturer2] [varchar](255) NULL,
	[DishModel2] [varchar](255) NULL,
	[DishDescription2] [varchar](255) NULL,
	[DishMirrorManufacturer1] [varchar](255) NULL,
	[DishMirrorModel1] [varchar](255) NULL,
	[DishMirrorManufacturer2] [varchar](255) NULL,
	[DishMirrorModel2] [varchar](255) NULL,
	[EngineManufacturer1] [varchar](255) NULL,
	[EngineModel1] [varchar](255) NULL,
	[EngineType1] [varchar](255) NULL,
	[EngineManufacturer2] [varchar](255) NULL,
	[EngineModel2] [varchar](255) NULL,
	[EngineType2] [varchar](255) NULL,
	[EngineOperatingTemperature] [smallint] NULL,
	[EngineOperatingTemperatureUnits] [varchar](10) NULL,
 CONSTRAINT [PK_dataDishes] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataFresnel]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataFresnel](
	[ProjectID] [int] NULL,
	[NumberLines] [int] NULL,
	[SolarFieldAperture] [int] NULL,
	[SolarFieldApertureUnits] [varchar](10) NULL,
	[LineLength] [int] NULL,
	[LineLengthUnits] [varchar](10) NULL,
	[WidthMirrorsInLine] [smallint] NULL,
	[WidthMirrorsUnits] [varchar](10) NULL,
	[NumberMirrorsAcrossLine] [smallint] NULL,
	[CollectorManufacturer1] [varchar](255) NULL,
	[CollectorModel1] [varchar](255) NULL,
	[CollectorDescription1] [varchar](255) NULL,
	[CollectorManufacturer2] [varchar](255) NULL,
	[CollectorModel2] [varchar](255) NULL,
	[CollectorDescription2] [varchar](255) NULL,
	[LFRMirrorManufacturer1] [varchar](255) NULL,
	[LFRMirrorModel1] [varchar](255) NULL,
	[LFRMirrorManufacturer2] [varchar](255) NULL,
	[LFRMirrorModel2] [varchar](255) NULL,
	[LFRReceiverManufacturer1] [varchar](255) NULL,
	[LFRReceiverModel1] [varchar](255) NULL,
	[LFRReceiverType1] [varchar](255) NULL,
	[ReceiverLength1] [smallint] NULL,
	[ReceiverLengthUnits1] [varchar](10) NULL,
	[LFRReceiverManufacturer2] [varchar](255) NULL,
	[LFRReceiverModel2] [varchar](255) NULL,
	[LFRReceiverType2] [varchar](255) NULL,
	[ReceiverLength2] [smallint] NULL,
	[ReceiverLengthUnits2] [varchar](10) NULL,
	[SolarFieldInletTemperature] [smallint] NULL,
	[SolarFieldOutletTemperature] [smallint] NULL,
	[SolarFieldTemperatureUnits] [varchar](10) NULL,
	[SolarFieldTemperatureDifference] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataGenerationOfftakers]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataGenerationOfftakers](
	[ProjectID] [int] NOT NULL,
	[GenerationOfftaker] [varchar](255) NOT NULL,
 CONSTRAINT [PK_dataCustomers] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[GenerationOfftaker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataHCEs]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataHCEs](
	[ProjectID] [int] NOT NULL,
	[HCEManufacturer] [varchar](255) NOT NULL,
	[HCEModel] [varchar](255) NULL,
	[NumberHCEs] [int] NULL,
	[HCEType] [varchar](25) NULL,
	[HCELength] [tinyint] NULL,
	[HCELengthTubeUnits] [varchar](5) NULL,
 CONSTRAINT [PK_dataHCEs] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[HCEManufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataIncentives]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataIncentives](
	[ProjectID] [int] NOT NULL,
	[Incentive] [varchar](500) NOT NULL,
 CONSTRAINT [PK_dataIncentives] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[Incentive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataOwners]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataOwners](
	[ProjectID] [int] NOT NULL,
	[Owner] [varchar](255) NOT NULL,
	[OwnerPercent] [tinyint] NULL,
 CONSTRAINT [PK_dataOwners] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataPowerTowers]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataPowerTowers](
	[ProjectID] [int] NOT NULL,
	[HeliostatFieldArea] [int] NULL,
	[HeliostatFieldAreaUnits] [varchar](10) NULL,
	[NumberofHeliostats] [int] NULL,
	[HeliostatArea] [real] NULL,
	[HeliostatAreaUnits] [varchar](10) NULL,
	[HeliostatManufacturer1] [varchar](255) NULL,
	[HeliostatModel1] [varchar](255) NULL,
	[HeliostatDescription1] [varchar](255) NULL,
	[HeliostatManufacturer2] [varchar](255) NULL,
	[HeliostatModel2] [varchar](255) NULL,
	[HeliostatDescription2] [varchar](255) NULL,
	[TowerHeight] [smallint] NULL,
	[TowerHeightUnits] [varchar](3) NULL,
	[ReceiverManufacturer1] [varchar](255) NULL,
	[ReceiverType1] [varchar](50) NULL,
	[ReceiverManufacturer2] [varchar](255) NULL,
	[ReceiverType2] [varchar](50) NULL,
	[PanelHeight] [smallint] NULL,
	[PanelHeightUnits] [varchar](10) NULL,
	[ReceiverDiameter] [smallint] NULL,
	[ReceiverDiameterUnits] [varchar](10) NULL,
	[ApertureHeight] [smallint] NULL,
	[ApertureHeightUnits] [varchar](10) NULL,
	[ApertureWidth] [smallint] NULL,
	[ApertureWidthUnits] [varchar](10) NULL,
	[ReceiverInletTemperature] [smallint] NULL,
	[ReceiverOutletTemperature] [varchar](50) NULL,
	[ReceiverOutletTemperatureUnits] [varchar](10) NULL,
	[ReceiverOutletPressure] [int] NULL,
	[ReceiverTemperatureDifference] [int] NULL,
 CONSTRAINT [PK_dataPowerTowers] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataProjects]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataProjects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](255) NULL,
	[ShortName] [nvarchar](255) NULL,
	[Country] [char](2) NULL,
	[State] [char](2) NULL,
	[Region] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[County] [varchar](255) NULL,
	[LatitudeDegrees] [smallint] NULL,
	[LatitudeMinutes] [smallint] NULL,
	[LatitudeSeconds] [real] NULL,
	[LatitudeDirection] [varchar](25) NULL,
	[LongitudeDegrees] [smallint] NULL,
	[LongitudeMinutes] [smallint] NULL,
	[LongitudeSeconds] [real] NULL,
	[LongitudeDirection] [varchar](25) NULL,
	[Technology] [varchar](255) NULL,
	[Status] [varchar](50) NULL,
	[StatusDate] [datetime] NULL CONSTRAINT [DF_dataProjects_StatusDate]  DEFAULT (getdate()),
	[PPADateMonth] [varchar](25) NULL,
	[PPADateDay] [tinyint] NULL,
	[PPADateYear] [smallint] NULL,
	[FeedInTariffType] [varchar](255) NULL,
	[TariffRate] [real] NULL,
	[TariffRateUnit] [varchar](255) NULL,
	[TariffYears] [varchar](255) NULL,
	[TariffInfo] [varchar](500) NULL,
	[BreakGroundMonth] [varchar](25) NULL,
	[BreakGroundDay] [tinyint] NULL,
	[BreakGroundYear] [smallint] NULL,
	[ProductionStartMonth] [varchar](25) NULL,
	[ProductionStartDay] [tinyint] NULL,
	[ProductionStartYear] [smallint] NULL,
	[SiteSolarResource] [float] NULL,
	[SiteSolarResourceDataSource] [nvarchar](500) NULL,
	[ProjectType] [varchar](1000) NULL,
	[Cost] [float] NULL,
	[CostCurrency] [varchar](25) NULL,
	[CostInfoSource] [varchar](500) NULL,
	[ElectricityGeneration] [float] NULL,
	[ElectricityGenerationBasis] [varchar](255) NULL,
	[ElectricityGenerationExplanation] [varchar](1000) NULL,
	[ContactCompany] [nvarchar](255) NULL,
	[ContactWebSite] [varchar](255) NULL,
	[Contact1] [nvarchar](255) NULL,
	[Contact1Email] [varchar](255) NULL,
	[ContactCompany2] [nvarchar](255) NULL,
	[ContactWebSite2] [varchar](255) NULL,
	[Contact2] [nvarchar](255) NULL,
	[Contact2Email] [varchar](255) NULL,
	[ConstructionJobYears] [varchar](25) NULL,
	[AnnualOperationsJobs] [varchar](25) NULL,
	[Developer1] [nvarchar](255) NULL,
	[Developer2] [nvarchar](255) NULL,
	[Operator1] [nvarchar](255) NULL,
	[Operator2] [nvarchar](255) NULL,
	[EPCContractor] [nvarchar](255) NULL,
	[EPCContractorTask] [nvarchar](1500) NULL,
	[LandArea] [int] NULL,
	[LandAreaUnits] [varchar](255) NULL,
	[DriveManufacturer1] [varchar](255) NULL,
	[DriveManufacturer2] [varchar](255) NULL,
	[HeatTransferFluidType] [varchar](255) NULL,
	[HeatTransferFluidCompany] [varchar](255) NULL,
	[GrossTurbineCapacity] [real] NULL,
	[NetCapacity] [real] NULL,
	[OtherTurbineCapacity] [varchar](500) NULL,
	[CapacityUnit] [char](2) NULL,
	[TurbineThermodynamicCycleType] [varchar](255) NULL,
	[PowerCyclePressure] [real] NULL,
	[PowerCyclePressureUnits] [varchar](255) NULL,
	[TurbineSupplier] [varchar](500) NULL,
	[TurbineSupplierCountry] [varchar](50) NULL,
	[CoolingMethod] [varchar](50) NULL,
	[CoolingMethodDescription] [varchar](500) NULL,
	[TurbineEfficiency] [float] NULL,
	[DesignPointSolarElectricEfficiency] [float] NULL,
	[DesignPointConditions] [varchar](500) NULL,
	[AnnualSolarElectricEfficiency] [float] NULL,
	[BackupType] [varchar](255) NULL,
	[BackupPercent] [tinyint] NULL,
	[StorageType] [varchar](255) NULL,
	[StorageCapacity] [float] NULL,
	[StorageCapacityUnit] [varchar](10) NULL,
	[StorageDescription] [nvarchar](1000) NULL,
	[LongDescription] [nvarchar](4000) NULL,
	[Photo] [varchar](255) NULL,
	[AltText] [nvarchar](1000) NULL,
	[Caption] [nvarchar](1000) NULL,
	[Credit] [nvarchar](500) NULL,
	[PublishStatus] [varchar](10) NULL,
	[DraftID] [int] NULL,
	[Deleted] [bit] NULL CONSTRAINT [DF_dataProjects_Deleted]  DEFAULT (0),
 CONSTRAINT [PK_dataProjects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataReferenceDocs]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataReferenceDocs](
	[ProjectID] [int] NOT NULL,
	[ReferenceDoc] [varchar](500) NOT NULL,
	[Type] [varchar](50) NULL,
	[Pdf] [bit] NULL CONSTRAINT [DF_dataReferenceDocs_Pdf]  DEFAULT (0),
 CONSTRAINT [PK_dataReferenceDocs] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[ReferenceDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataTroughs]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataTroughs](
	[ProjectID] [int] NOT NULL,
	[NumberSCAs] [int] NULL,
	[NumberLoops] [smallint] NULL,
	[SolarFieldApertureArea] [int] NULL,
	[SolarFieldApertureAreaUnits] [varchar](10) NULL,
	[SCAArea] [int] NULL,
	[SCAAreaUnits] [varchar](10) NULL,
	[SCAManufacturer1] [varchar](255) NULL,
	[SCAModel1] [varchar](255) NULL,
	[SCADescription1] [varchar](255) NULL,
	[SCAManufacturer2] [varchar](255) NULL,
	[SCAModel2] [varchar](255) NULL,
	[SCADescription2] [varchar](255) NULL,
	[SCAMirrorManufacturer1] [varchar](255) NULL,
	[SCAMirrorModel1] [varchar](255) NULL,
	[SCAMirrorManufacturer2] [varchar](255) NULL,
	[SCAMirrorModel2] [varchar](255) NULL,
	[SCALength] [real] NULL,
	[SCALengthUnits] [varchar](10) NULL,
	[NumberModulesPerSCA] [varchar](50) NULL,
	[NumberSCAsPerLoop] [tinyint] NULL,
	[TotalLoops] [smallint] NULL,
	[SolarFieldInletTemperature] [smallint] NULL,
	[SolarFieldOutletTemperature] [smallint] NULL,
	[SolarFieldTemperatureUnits] [varchar](10) NULL,
	[SolarFieldTemperatureDifference] [smallint] NULL,
 CONSTRAINT [PK_dataTroughs] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[join_users_projects]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_users_projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[project_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lookupCountryCodes]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lookupCountryCodes](
	[CountryCode] [char](2) NOT NULL,
	[Country] [varchar](255) NULL,
 CONSTRAINT [PK_lookupCountryCodes] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lookupStates]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lookupStates](
	[state_abbrev] [char](2) NOT NULL,
	[state] [varchar](50) NULL,
 CONSTRAINT [PK_lookupStates] PRIMARY KEY CLUSTERED 
(
	[state_abbrev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [solarpaces].[dataProjectsSave]    Script Date: 6/16/2017 8:10:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [solarpaces].[dataProjectsSave](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](255) NULL,
	[ShortName] [varchar](255) NULL,
	[Country] [char](2) NULL,
	[State] [char](2) NULL,
	[Region] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[County] [varchar](255) NULL,
	[LatitudeDegrees] [smallint] NULL,
	[LatitudeMinutes] [smallint] NULL,
	[LatitudeSeconds] [real] NULL,
	[LatitudeDirection] [varchar](25) NULL,
	[LongitudeDegrees] [smallint] NULL,
	[LongitudeMinutes] [smallint] NULL,
	[LongitudeSeconds] [real] NULL,
	[LongitudeDirection] [varchar](25) NULL,
	[Technology] [varchar](255) NULL,
	[Status] [varchar](50) NULL,
	[StatusDate] [datetime] NULL,
	[PPADateMonth] [varchar](25) NULL,
	[PPADateDay] [tinyint] NULL,
	[PPADateYear] [smallint] NULL,
	[FeedInTariffType] [varchar](255) NULL,
	[TariffRate] [real] NULL,
	[TariffRateUnit] [varchar](255) NULL,
	[TariffYears] [varchar](255) NULL,
	[TariffInfo] [varchar](500) NULL,
	[BreakGroundMonth] [varchar](25) NULL,
	[BreakGroundDay] [tinyint] NULL,
	[BreakGroundYear] [smallint] NULL,
	[ProductionStartMonth] [varchar](25) NULL,
	[ProductionStartDay] [tinyint] NULL,
	[ProductionStartYear] [smallint] NULL,
	[SiteSolarResource] [float] NULL,
	[SiteSolarResourceDataSource] [varchar](500) NULL,
	[ProjectType] [varchar](1000) NULL,
	[Cost] [float] NULL,
	[CostCurrency] [varchar](25) NULL,
	[CostInfoSource] [varchar](500) NULL,
	[ElectricityGeneration] [float] NULL,
	[ElectricityGenerationBasis] [varchar](255) NULL,
	[ElectricityGenerationExplanation] [varchar](1000) NULL,
	[ContactCompany] [nvarchar](255) NULL,
	[ContactWebSite] [varchar](255) NULL,
	[Contact1] [varchar](255) NULL,
	[Contact1Email] [varchar](255) NULL,
	[ContactCompany2] [varchar](255) NULL,
	[ContactWebSite2] [varchar](255) NULL,
	[Contact2] [varchar](255) NULL,
	[Contact2Email] [varchar](255) NULL,
	[ConstructionJobYears] [varchar](25) NULL,
	[AnnualOperationsJobs] [varchar](25) NULL,
	[Developer1] [varchar](255) NULL,
	[Developer2] [varchar](255) NULL,
	[Operator1] [varchar](255) NULL,
	[Operator2] [varchar](255) NULL,
	[EPCContractor] [varchar](255) NULL,
	[EPCContractorTask] [varchar](1500) NULL,
	[LandArea] [int] NULL,
	[LandAreaUnits] [varchar](255) NULL,
	[DriveManufacturer1] [varchar](255) NULL,
	[DriveManufacturer2] [varchar](255) NULL,
	[HeatTransferFluidType] [varchar](255) NULL,
	[HeatTransferFluidCompany] [varchar](255) NULL,
	[GrossTurbineCapacity] [real] NULL,
	[NetCapacity] [real] NULL,
	[OtherTurbineCapacity] [varchar](500) NULL,
	[CapacityUnit] [char](2) NULL,
	[TurbineThermodynamicCycleType] [varchar](255) NULL,
	[PowerCyclePressure] [real] NULL,
	[PowerCyclePressureUnits] [varchar](255) NULL,
	[TurbineSupplier] [varchar](500) NULL,
	[TurbineSupplierCountry] [varchar](50) NULL,
	[CoolingMethod] [varchar](50) NULL,
	[CoolingMethodDescription] [varchar](500) NULL,
	[TurbineEfficiency] [float] NULL,
	[DesignPointSolarElectricEfficiency] [float] NULL,
	[DesignPointConditions] [varchar](500) NULL,
	[AnnualSolarElectricEfficiency] [float] NULL,
	[BackupType] [varchar](255) NULL,
	[BackupPercent] [tinyint] NULL,
	[StorageType] [varchar](255) NULL,
	[StorageCapacity] [float] NULL,
	[StorageCapacityUnit] [varchar](10) NULL,
	[StorageDescription] [varchar](1000) NULL,
	[LongDescription] [varchar](4000) NULL,
	[Photo] [varchar](255) NULL,
	[AltText] [varchar](1000) NULL,
	[Caption] [varchar](1000) NULL,
	[Credit] [varchar](500) NULL,
	[PublishStatus] [varchar](10) NULL,
	[DraftID] [int] NULL,
	[Deleted] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[dataDishes]  WITH NOCHECK ADD  CONSTRAINT [FK_dataDishes_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataDishes] CHECK CONSTRAINT [FK_dataDishes_dataProjects]
GO
ALTER TABLE [dbo].[dataFresnel]  WITH NOCHECK ADD  CONSTRAINT [FK_dataFresnel_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataFresnel] CHECK CONSTRAINT [FK_dataFresnel_dataProjects]
GO
ALTER TABLE [dbo].[dataGenerationOfftakers]  WITH NOCHECK ADD  CONSTRAINT [FK_dataCustomers_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataGenerationOfftakers] CHECK CONSTRAINT [FK_dataCustomers_dataProjects]
GO
ALTER TABLE [dbo].[dataHCEs]  WITH NOCHECK ADD  CONSTRAINT [FK_dataHCEs_dataTroughs] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataTroughs] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataHCEs] CHECK CONSTRAINT [FK_dataHCEs_dataTroughs]
GO
ALTER TABLE [dbo].[dataIncentives]  WITH NOCHECK ADD  CONSTRAINT [FK_dataIncentives_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataIncentives] CHECK CONSTRAINT [FK_dataIncentives_dataProjects]
GO
ALTER TABLE [dbo].[dataOwners]  WITH NOCHECK ADD  CONSTRAINT [FK_dataOwners_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataOwners] CHECK CONSTRAINT [FK_dataOwners_dataProjects]
GO
ALTER TABLE [dbo].[dataPowerTowers]  WITH NOCHECK ADD  CONSTRAINT [FK_dataPowerTowers_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataPowerTowers] CHECK CONSTRAINT [FK_dataPowerTowers_dataProjects]
GO
ALTER TABLE [dbo].[dataProjects]  WITH NOCHECK ADD  CONSTRAINT [FK_dataProjects_lookupCountryCodes] FOREIGN KEY([Country])
REFERENCES [dbo].[lookupCountryCodes] ([CountryCode])
GO
ALTER TABLE [dbo].[dataProjects] CHECK CONSTRAINT [FK_dataProjects_lookupCountryCodes]
GO
ALTER TABLE [dbo].[dataReferenceDocs]  WITH NOCHECK ADD  CONSTRAINT [FK_dataReferenceDocs_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataReferenceDocs] CHECK CONSTRAINT [FK_dataReferenceDocs_dataProjects]
GO
ALTER TABLE [dbo].[dataTroughs]  WITH NOCHECK ADD  CONSTRAINT [FK_dataTroughs_dataProjects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[dataProjects] ([ProjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dataTroughs] CHECK CONSTRAINT [FK_dataTroughs_dataProjects]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers', @level2type=N'COLUMN',@level2name=N'GenerationOfftaker'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers', @level2type=N'COLUMN',@level2name=N'GenerationOfftaker'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2925 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers', @level2type=N'COLUMN',@level2name=N'GenerationOfftaker'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataGenerationOfftakers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'Owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'Owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4200 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'Owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'OwnerPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'OwnerPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1410 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners', @level2type=N'COLUMN',@level2name=N'OwnerPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataOwners'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Technology'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Technology'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Technology'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1815 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'SiteSolarResource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'SiteSolarResource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'SiteSolarResource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ElectricityGeneration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ElectricityGeneration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ElectricityGeneration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ContactCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ContactCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'ContactCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Contact1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Contact1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Contact1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Contact1Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Contact1Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Contact1Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Developer1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Developer1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Developer1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'LandArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'LandArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'LandArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'HeatTransferFluidType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'HeatTransferFluidType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'HeatTransferFluidType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'GrossTurbineCapacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'GrossTurbineCapacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'GrossTurbineCapacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'TurbineThermodynamicCycleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'TurbineThermodynamicCycleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'TurbineThermodynamicCycleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'PowerCyclePressure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'PowerCyclePressure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'PowerCyclePressure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'TurbineEfficiency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'TurbineEfficiency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'TurbineEfficiency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'BackupType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'BackupType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'BackupType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'BackupPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'BackupPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'BackupPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'StorageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'StorageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'StorageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'StorageCapacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'StorageCapacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'StorageCapacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'LongDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'LongDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'LongDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'AltText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'AltText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects', @level2type=N'COLUMN',@level2name=N'AltText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dataProjects'
GO
