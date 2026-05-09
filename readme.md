# A&E Database & Analytics Project

Database project for IOT552U

Analyses a synthetic Accident & Emergency (A&E) Department (patient flow, performance, and KPIs) using real NHS data as assumptions for synthetic data generation.

## Project Overview

- **NHS Data**: Processes and analyses monthly A&E attendance data from NHS England (2025-2026)
- **Synthetic Data Generation**: Creates realistic patient-level data based on NHS statistical baselines
- **Database Design**: PostgreSQL schema with relationships, constraints, and custom types - hosted on Neon
- **Interactive Reporting**: Jupyter notebooks with SQL analysis and Plotly charts\

## Key Features

| Feature                        | Description                                             |
| ------------------------------ | ------------------------------------------------------- |
| **Patient Journey**            | Tracks average time through A&E by triage category      |
| **Departure Monitoring**       | Analyses patients who leave before treatment completion |
| **Workload Analytics**         | Calculates departmental hours by triage category        |
| **Interactive Visualisations** | HTML-based charts                                       |

## Project Structure

```
ae-database-project/
├── data/
│   ├── raw/                    # NHS monthly CSV files (2025-2026)
│   ├── synthetic/              # Synthetic patient data
│   └── readme.md               # Data source documentation
├── notebooks/
│   ├── ae_reporting_analysis.ipynb    # Reorting & visualisations
│   ├── nhs_admission_analysis.ipynb   # NHS data cleaning & analysis
│   └── synthetic_data_gen.ipynb       # Synthetic data generation
├── sql_queries/
│   └── schema/                 # PostgreSQL database schema files
├── visualisations/
│   ├── *.html                  # Interactive Plotly charts
│   └── *_static.png            # Static PNG exports
├── requirements.txt             # Python dependencies
```

## Database Schema

The PostgreSQL database consists of the following tables:

| Table             | Description                                                |
| ----------------- | ---------------------------------------------------------- |
| `patient`         | Patient demographics (name, DOB, sex, postcode)            |
| `visit`           | Core attendance records with timestamps and journey stages |
| `triage_category` | NHS-standard triage levels (1-5) with descriptions         |
| `arrival_method`  | Patient arrival modes (ambulance, walk-in, etc.)           |
| `department`      | Department information                                     |
| `outcome`         | Visit outcomes (admitted, discharged, etc)                 |

## How to View This Project

### Option 1: GitHub Jupyter Viewer

1. Navigate to any `.ipynb` file in the `notebooks/` directory
2. Click the file to view it rendered directly on GitHub
3. _Note: Interactive outputs won't display, but all code and markdown will be visible. Interactive charts are linked_

### Option 3: Run Locally (Full Interactivity)

#### Prerequisites

- Python 3.10+
- PostgreSQL database (I hosted mine on Neon), with the same schema in `sql_queries/schema`

#### Setup

```bash
# Clone the repository
git clone <repository-url>
cd ae-database-project

# Create virtual environment
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Configure database connection
# Create a .env file with the PostgreSQL connection string:
# DB_URL=postgresql://user:password@host:port/database
```

## VIsualisations

All visualisations are available in the `visualisations/` folder in two formats:

| Format         | Description                                         |
| -------------- | --------------------------------------------------- |
| `*.html`       | Interactive Plotly charts - open in any web browser |
| `*_static.png` | Static                                              |

### Available Charts

1. **Patient Journey Analysis** (`patient_journey.*`)
   - Stacked bar chart showing average time spent during A&E phases
   - Broken down by triage category

2. **Left Early Analysis** (`left_early.*`)
   - Combined bar/line chart showing volume and percentage of patients leaving before treatment
   - Highlights at-risk triage categories

3. **Departmental Workload** (`departmental_hours.*`)
   - Treemap showing total department hours by triage category
   - Resource allocation

## Stack

| Category            | Technology                      |
| ------------------- | ------------------------------- |
| **Database**        | PostgreSQL (Neon), SQLAlchemy   |
| **Data Processing** | Pandas, NumPy                   |
| **Visualisation**   | Plotly, Matplotlib              |
| **Development**     | Jupyter Notebooks, Python 3.10+ |

## Data Sources

### NHS England A&E Data

- **Source**: [NHS England A&E Attendances and Emergency Admissions 2025-26](https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/ae-attendances-and-emergency-admissions-2025-26/)
- **Coverage**: Multiple NHS trusts across England
- **Metrics**: Attendances by type, 4-hour breaches, emergency admissions, waiting times

### Synthetic Data

- Generated based on NHS statistical baselines and academic reports
- 100,000+ realistic patient records
