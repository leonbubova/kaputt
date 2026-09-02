CRLF line endings — shebang becomes `/bin/bash\r`.
    sed -i 's/\r$//' /usr/local/bin/report
