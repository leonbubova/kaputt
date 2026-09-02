# calls to http://api.internal:8080 time out, but the API is healthy locally
The API answers on 127.0.0.1:8080, yet `curl http://api.internal:8080` hangs.
The name resolves to the wrong address. Point api.internal at the right IP.
