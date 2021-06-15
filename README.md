# wordpress

A better title might have been "wordpress for kubernetes" as this grants easy persistence in a kubernetes environment.

This is designed to function as a full WP install based on alpine linux, it was designed for deployment into kubernetes, specifically k3s. It will, if it detects no wp-admin directory in /var/www/wordpress, unpack a local copy into that location, it will then expect the following environment configuration:

```
WP_DB_HOST: <The ip, hostname, or service name of the sql database>
WP_DB_USER: <The preconfigured user that wordpress is to connect as>
WP_DB_NAME: <The name of the database that wordpress will use>
WP_DB_PASS: <The password for the user above>
```

