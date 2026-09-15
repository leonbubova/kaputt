# ticket: 1 GB of RAM for the monthly report
"`generate-report` loads a whole month of orders into memory; finance measured ~800 MB at peak. Run it on a machine with **at least 1 GB** RAM. Cheap tasks like `send-welcome-email` stay on the small default." Goal: exactly that, on the task.
