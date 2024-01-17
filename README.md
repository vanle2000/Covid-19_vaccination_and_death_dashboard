# Covid-19 Vaccinations and Deaths Data Exploration with SQL and Tableau


This project focuses on exploring COVID data using SQL and creating a dashboard that visualizes COVID deaths and infection rates. The project involves two main tasks: separating COVID data into deaths and vaccinations, and using the data to create an interactive dashboard using Tableau.
Create an interactive dashboard using Tableau to visualize COVID deaths and infection rates. The dashboard provides a user-friendly interface for exploring key insights.

## Getting Started
1. Data Cleaning
The first task involves extracting and separating COVID data into two distinct datasets: COVID deaths and COVID vaccinations. This step allows us to analyze and visualize specific aspects of the COVID pandemic.

3. Setup Databases
- Load your COVID-19 data into a SQL database.

4. Explore Data with SQL
- Utilize SQL to extract the necessary data for visualization.The process involves a series of SQL operations such as selecting relevant columns, applying filters, performing aggregations, and joining tables to acquire specific data needed for our dashboard.
- Find the SQL queries used for data extraction in the [covid_queries.sql] file. These queries encapsulate the tailored approach to obtaining data that aligns with the goals of our project.
  
5. Create Tableau Dashboard
Open the Tableau workbook provided in the project and connect Tableau to your SQL database. My dashboard includes these graphs:
- Global Statistics: This graph will present an overview of global COVID statistics, such as total deaths, total vaccinations, and infection rates.
- Total Deaths per Continent: This graph will showcase the total number of deaths per continent, allowing for regional comparison.
- Percent Population Infected per Country: This graph will display the percentage of the population infected by COVID in each country, offering a country-wise perspective.
- Projected Percent Population Infected: This graph will provide a projection of the percentage of the population that might be infected by COVID in the future, based on the available data.
  
4. Here is the link to my Tableau dashboard:
   <!--- https://tabsoft.co/3QBRbuZ>
     
## Dependencies
The following dependencies are required to run this project:
- SQL database management system (e.g., MySQL, PostgreSQL)
- Tableau (latest version)
Make sure you have these dependencies installed and properly configured before running the project.

## Resources
The project uses the following resources:
- https://data.who.int/dashboards/covid19/data?n=c
