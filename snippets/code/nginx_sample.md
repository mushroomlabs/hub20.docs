```
upstream hub20_app {
        server 127.0.0.1:5000;
    }

server {
    listen 443 ssl http2;
    server_name <your domain name>;

    ssl_certificate <path/to/certbot/fullchain.pem>;
    ssl_certificate_key <path/to/certbot/privkey.pem>;

    ssl on;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
    ssl_ecdh_curve secp384r1;
    ssl_session_cache shared:SSL:10m;
    ssl_session_tickets off;
    ssl_stapling on;
    ssl_stapling_verify on;

    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;

    location / {

        proxy_redirect off;
        proxy_buffering off;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;

        proxy_pass http://hub20_app;
        proxy_http_version 1.1;
    }
    location /ws {

        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;

        proxy_pass http://hub20_app;
        proxy_http_version 1.1;
    }
    location /static/ {

        alias /srv/hub20/static/;
        autoindex off;

    }
}
```
