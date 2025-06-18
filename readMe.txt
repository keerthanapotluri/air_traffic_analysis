# ✈️ Air Traffic Analysis

This repository contains the complete semantic model, data pipeline, and interactive dashboard for analyzing global air traffic accidents.

## 📊 **Project Overview**

- **Objective:** To clean, model, and analyze air traffic accident data (1925–2025) to identify trends, fatality counts, and root causes.
- **Data Source:** https://www.ntsb.gov/Pages/ResultsV2.aspx?queryId=eb5ab859-b807-438f-8901-379fcf9ca5fb
- **Visualization:** Looker Studio Dashboard (while Looker (Core) quota is pending).


## ✅ **What’s Included**

| Folder | Purpose |
|--------|---------|
| `models/` | dbt SQL model (`stg_accidents.sql`) to parse timestamps, cast injury counts |
| `views/` | LookML view file describing clean dimensions & measures |
| `explores/` | LookML explore file to define user-friendly querying |
