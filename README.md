# Keboola Telemetry

## Block Overview
This Block connects to the model of Keboola Connection telemetry data which are provided via Telemetry Data extractor. Its purpose is to provide customers with information about usage of their projects. It focuses on consumption of projects & components and warns about potential limit breaches. If you need help with setting up the Keboola data feed, please contact us [here](https://get.keboola.com/lookerblocks?block=keboola_telemetry).

## Data and Block Structure
This block is built above data obtained from Keboola Connection Telemetry Data extractor. Model consits from these tables:

*  Contract Limit Monthly
*  KBC Component Configuration
*  KBC Job
*  KBC Organization
*  KBC Project
*  KBC Snowflake Stats
*  KBC Usage Metrics Values
*  Usage Metric

You'll be provided with set of tables in one of your Keboola Connection projects. All you need to do is set up Database Writer and set it up based on our documentation and then set up the connection to the database in Looker and add it to the Looker model.


-----
