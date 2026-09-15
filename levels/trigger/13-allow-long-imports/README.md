# ticket: big CSV imports need 10 minutes
"Enterprise customers upload CSVs that take up to 10 minutes to import; today `import-csv` is cut off by the project-wide 5-minute cap. Allow `import-csv` to run **10 minutes**. Every other task keeps the 5-minute cap." Goal: exactly that, on the task.
