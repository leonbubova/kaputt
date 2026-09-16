Wrong type and no expiry; recreate as a string with a TTL.
    DEL cache:home; SET cache:home '<html>home</html>' EX 300
