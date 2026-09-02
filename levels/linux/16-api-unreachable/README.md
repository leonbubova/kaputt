# api.internal times out from this box only
"The mock API on this host answers on `http://127.0.0.1:9100/`, but the app uses the name `api.internal` and every call hangs. DNS team says the name is fine everywhere else."
Goal: `curl http://api.internal:9100/` from inside the box prints `api ok`.
