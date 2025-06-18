-- Clean staging model for Air Traffic Accidents

WITH base AS (
  SELECT
    NtsbNo,
    EventType,
    Mkey,
    -- Raw EventDate may have mixed formats: try ISO first, fallback to MM/DD/YYYY
    COALESCE(
      SAFE.PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S%Ez', EventDate),
      SAFE.PARSE_TIMESTAMP('%m/%d/%Y %H:%M', EventDate)
    ) AS EventDate_parsed,

    City,
    State,
    Country,
    ReportNo,
    N,
    HasSafetyRec,
    ReportType,
    OriginalPublishDate,

    -- DocketPublishDate in MM/DD/YYYY HH:MM
    SAFE.PARSE_TIMESTAMP('%m/%d/%Y %H:%M', DocketPublishDate) AS DocketPublishDate_parsed,

    HighestInjuryLevel,
    SAFE_CAST(FatalInjuryCount AS INT64) AS FatalInjuryCount,
    SAFE_CAST(SeriousInjuryCount AS INT64) AS SeriousInjuryCount,
    SAFE_CAST(MinorInjuryCount AS INT64) AS MinorInjuryCount,
    ProbableCause,
    EventID,
    SAFE_CAST(Latitude AS FLOAT64) AS Latitude,
    SAFE_CAST(Longitude AS FLOAT64) AS Longitude,
    Make,
    Model,
    AirCraftCategory,
    AirportID,
    AirportName,
    AmateurBuilt,
    SAFE_CAST(NumberOfEngines AS INT64) AS NumberOfEngines,
    Scheduled,
    PurposeOfFlight,
    FAR,
    AirCraftDamage,
    WeatherCondition,
    Operator,
    ReportStatus,
    RepGenFlag,
    DocketUrl
  FROM 
    `air-traffic-analysis-463315.airTrafficdata.accidents`
)

SELECT
  *,
  -- Flags for QA
  IF(EventDate_parsed IS NULL, TRUE, FALSE) AS EventDate_parse_error,
  IF(DocketPublishDate_parsed IS NULL, TRUE, FALSE) AS DocketPublishDate_parse_error
FROM 
  base
