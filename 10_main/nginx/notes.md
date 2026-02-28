
=== ./nginx.conf ===
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
	# multi_accept on;
}

http {

	##
	# Basic Settings
	##

	sendfile on;
	tcp_nopush on;
	types_hash_max_size 2048;
	# server_tokens off;

	# server_names_hash_bucket_size 64;
	# server_name_in_redirect off;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	##
	# SSL Settings
	##

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
	ssl_prefer_server_ciphers on;

	##
	# Logging Settings
	##

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	##
	# Gzip Settings
	##

	gzip on;

	# gzip_vary on;
	# gzip_proxied any;
	# gzip_comp_level 6;
	# gzip_buffers 16 8k;
	# gzip_http_version 1.1;
	# gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

	##
	# Virtual Host Configs
	##

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}


#mail {
#	# See sample authentication script at:
#	# http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
#
#	# auth_http localhost/auth.php;
#	# pop3_capabilities "TOP" "USER";
#	# imap_capabilities "IMAP4rev1" "UIDPLUS";
#
#	server {
#		listen     localhost:110;
#		protocol   pop3;
#		proxy      on;
#	}
#
#	server {
#		listen     localhost:143;
#		protocol   imap;
#		proxy      on;
#	}
#}


=== ./sites-available/affine.leanderziehm.com ===
server {
    server_name affine.leanderziehm.com;

    location / {
        proxy_pass http://localhost:3010;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/affine.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/affine.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = affine.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name affine.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/anysync.leanderziehm.com ===
server {
    server_name anysync.leanderziehm.com;

    location / {
        proxy_pass http://localhost:9002;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/anysync.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/anysync.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = anysync.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name anysync.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/api.leanderziehm.com ===
server {
    server_name api.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5011;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/api.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/api.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = api.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name api.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/app.tandemexchange.de ===
server {
	        server_name app.tandemexchange.de;

		    location / {
			            proxy_pass http://localhost:5015;
				            proxy_http_version 1.1;
					            proxy_set_header Host $host;
						            proxy_set_header X-Real-IP $remote_addr;
							            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
								            proxy_set_header X-Forwarded-Proto $scheme;
									        }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/app.tandemexchange.de/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/app.tandemexchange.de/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = app.tandemexchange.de) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	    listen 80;
	        server_name app.tandemexchange.de;
    return 404; # managed by Certbot


}
=== ./sites-available/audiobooks.leanderziehm.com ===
server {
    listen 80;
    server_name audiobooks.leanderziehm.com;

    location / {
        proxy_pass http://130.61.81.42:5006;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

=== ./sites-available/bayern-hackathon-ai-form.leanderziehm.com ===
server {
    server_name bayern-hackathon-ai-form.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5012;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/bayern-hackathon-ai-form.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/bayern-hackathon-ai-form.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = bayern-hackathon-ai-form.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name bayern-hackathon-ai-form.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/bookmarks.leanderziehm.com ===
server {
    listen 80;
    server_name bookmarks.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5002;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}


=== ./sites-available/chatgpt-code-zip.leanderziehm.com ===
server {
    server_name chatgpt-code-zip.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5013;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/chatgpt-code-zip.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/chatgpt-code-zip.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


server {
    if ($host = chatgpt-code-zip.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name chatgpt-code-zip.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/default ===
##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# https://www.nginx.com/resources/wiki/start/
# https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/
# https://wiki.debian.org/Nginx/DirectoryStructure
#
# In most cases, administrators will remove this file from sites-enabled/ and
# leave it as reference inside of sites-available where it will continue to be
# updated by the nginx packaging team.
#
# This file will automatically load configuration files provided by other
# applications, such as Drupal or Wordpress. These applications will be made
# available underneath a path with that package name, such as /drupal8.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

# Default server configuration
#
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	# SSL configuration
	#
	# listen 443 ssl default_server;
	# listen [::]:443 ssl default_server;
	#
	# Note: You should disable gzip for SSL traffic.
	# See: https://bugs.debian.org/773332
	#
	# Read up on ssl_ciphers to ensure a secure configuration.
	# See: https://bugs.debian.org/765782
	#
	# Self signed certs generated by the ssl-cert package
	# Don't use them in a production server!
	#
	# include snippets/snakeoil.conf;

	root /var/www/html;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ @traefik;
		
	}
	location @traefik {
		proxy_pass http://127.0.0.1:8080;
		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
	        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme
	}	
	
	#
	#location ~ \.php$ {
	#	include snippets/fastcgi-php.conf;
	#
	#	# With php-fpm (or other unix sockets):
	#	fastcgi_pass unix:/run/php/php7.4-fpm.sock;
	#	# With php-cgi (or other tcp sockets):
	#	fastcgi_pass 127.0.0.1:9000;
	#}

	# deny access to .htaccess files, if Apache's document root
	# concurs with nginx's one
	#
	#location ~ /\.ht {
	#	deny all;
	#}
}


# Virtual Host configuration for example.com
#
# You can move that to a different file under sites-available/ and symlink that
# to sites-enabled/ to enable it.
#
#server {
#	listen 80;
#	listen [::]:80;
#
#	server_name example.com;
#
#	root /var/www/example.com;
#	index index.html;
#
#	location / {
#		try_files $uri $uri/ =404;
#	}
#}

=== ./sites-available/deploy.leanderziehm.com ===
server {
    server_name deploy.leanderziehm.com;

    location / {
        proxy_pass http://localhost:9001;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/deploy.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/deploy.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = deploy.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name deploy.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/docmost.leanderziehm.com ===
server {
    server_name docmost.leanderziehm.com;

    location / {
        proxy_pass http://localhost:3003;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/docmost.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/docmost.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = docmost.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name docmost.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/fastkoko.leanderziehm.com ===
server {
    server_name fastkoko.leanderziehm.com;

    location / {
        proxy_pass http://localhost:8880;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/fastkoko.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/fastkoko.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = fastkoko.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name fastkoko.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/grafana.leanderziehm.com ===
server {
    listen 80;
    server_name grafana.leanderziehm.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}


=== ./sites-available/home.leanderziehm.com ===
# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name home.leanderziehm.com;

    # Redirect all traffic to HTTPS
    location / {
        return 301 https://$host$request_uri;
    }

    # Certbot challenge location
    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }
}

# HTTPS server
server {
    listen 443 ssl http2;
    server_name home.leanderziehm.com;

    # SSL certificates managed by Certbot
    ssl_certificate /etc/letsencrypt/live/home.leanderziehm.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/home.leanderziehm.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    # Recommended security headers
    add_header X-Frame-Options "DENY";
    add_header X-Content-Type-Options "nosniff";
    add_header Referrer-Policy "no-referrer-when-downgrade";
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    # Proxy Home Assistant
    location / {
        proxy_pass http://localhost:8123;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # WebSocket support
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        # Optional timeouts
        proxy_read_timeout 900;
        proxy_send_timeout 900;
    }
}


=== ./sites-available/id.leanderziehm.com ===
server {
    server_name id.leanderziehm.com;

    location / {
        proxy_pass http://localhost:1411;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/id.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/id.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = id.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name id.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/image.leanderziehm.com ===
server {
    server_name image.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5014;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/image.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/image.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = image.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name image.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/leanderziehm.com ===
server {
    server_name leanderziehm.com www.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5001;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}

server {
    if ($host = www.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name leanderziehm.com www.leanderziehm.com;
    return 404; # managed by Certbot




}
=== ./sites-available/llmano ===
server {
    listen 80;
    server_name llmano.leanderziehm.com;
    # Allow up to 500MB file uploads
    client_max_body_size 500M;
    location / {
        proxy_pass http://127.0.0.1:5000;   # Assuming your app is running on port 5000 locally
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

=== ./sites-available/logseq.leanderziehm.com ===
server {
    server_name logseq.leanderziehm.com;

    location / {
        proxy_pass http://localhost:3002;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/logseq.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/logseq.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = logseq.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name logseq.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/lovelingo-chat.leanderziehm.com ===
server {
    server_name lovelingo-chat.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5010;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/lovelingo-chat.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/lovelingo-chat.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = lovelingo-chat.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name lovelingo-chat.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/lovelingo-game.leanderziehm.com ===
server {
    server_name lovelingo-game.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5173;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/lovelingo-game.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/lovelingo-game.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = lovelingo-game.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name lovelingo-game.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/lovelingo.leanderziehm.com ===
server {
    server_name lovelingo.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5009;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/lovelingo.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/lovelingo.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = lovelingo.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name lovelingo.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/matomo.leanderziehm.com ===
server {
    server_name matomo.leanderziehm.com;

    location / {
        proxy_pass http://localhost:8082;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/matomo.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/matomo.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = matomo.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name matomo.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/memos.leanderziehm.com ===
server {
    server_name memos.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5230;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/memos.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/memos.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = memos.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name memos.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/mindmap.leanderziehm.com ===
server {
    server_name mindmap.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5003;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/mindmap.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/mindmap.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = mindmap.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name mindmap.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/notes.leanderziehm.com ===
server {
    server_name notes.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5007;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/notes.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/notes.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = notes.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name notes.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/notification.leanderziehm.com ===
server {
    server_name notification.leanderziehm.com;

    location / {
        proxy_pass http://localhost:9000;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/notification.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/notification.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = notification.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name notification.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/outline.leanderziehm.com ===
server {
    server_name outline.leanderziehm.com;

    location / {
        proxy_pass http://localhost:3031;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/outline.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/outline.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = outline.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name outline.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/pdf.leanderziehm.com ===
server {
    server_name pdf.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5008;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/pdf.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/pdf.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = pdf.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name pdf.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/pgadmin.leanderziehm.com ===
server {
    server_name pgadmin.leanderziehm.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/pgadmin.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/pgadmin.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = pgadmin.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name pgadmin.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/plausible.leanderziehm.com ===
server {
    server_name plausible.leanderziehm.com;

    location / {
        proxy_pass http://localhost:9091;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/plausible.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/plausible.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = plausible.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name plausible.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/pocketid.leanderziehm.com.leanderziehm.com ===
server {
    server_name pocketid.leanderziehm.com.leanderziehm.com;

    location / {
        proxy_pass http://localhost:1411;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/pocketid.leanderziehm.com.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/pocketid.leanderziehm.com.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = pocketid.leanderziehm.com.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name pocketid.leanderziehm.com.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/portainer.leanderziehm.com ===
server {
    listen 80;
    server_name portainer.leanderziehm.com;

    location / {
        proxy_pass https://localhost:9443;
        proxy_ssl_verify off;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}


=== ./sites-available/siyuan.leanderziehm.com ===
server {
    listen 443 ssl http2;  # enable HTTP/2 for better performance
    server_name siyuan.leanderziehm.com;

    ssl_certificate /etc/letsencrypt/live/siyuan.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/siyuan.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    location / {
        proxy_pass http://localhost:6806;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # WebSocket support
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        # Optional timeouts for long-lived WebSocket connections
        proxy_read_timeout 86400;
        proxy_send_timeout 86400;
    }
}

server {
    listen 80;
    server_name siyuan.leanderziehm.com;

    # Redirect all HTTP traffic to HTTPS
    return 301 https://$host$request_uri;
}


=== ./sites-available/speaches.leanderziehm.com ===
server {
    server_name speaches.leanderziehm.com;

    location / {
        proxy_pass http://localhost:8321;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/speaches.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/speaches.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = speaches.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name speaches.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/speaktext.co ===
# Redirect HTTP to HTTPS
server {
    if ($host = www.speaktext.co) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = speaktext.co) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	    listen 80;
	        server_name speaktext.co www.speaktext.co;
		    return 301 https://speaktext.co$request_uri;




}

# HTTPS server block
server {
	    listen 443 ssl;
	        server_name speaktext.co www.speaktext.co;
    ssl_certificate /etc/letsencrypt/live/speaktext.co/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/speaktext.co/privkey.pem; # managed by Certbot
			    ssl_protocols TLSv1.2 TLSv1.3;
			        ssl_ciphers HIGH:!aNULL:!MD5;

				    location / {
					            proxy_pass http://localhost:7000;
						            proxy_http_version 1.1;
							            proxy_set_header Host $host;
								            proxy_set_header X-Real-IP $remote_addr;
									            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
										            proxy_set_header X-Forwarded-Proto $scheme;
											        }


}


=== ./sites-available/stt.leanderziehm.com ===
server {
    listen 80;
    server_name stt.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5007;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

=== ./sites-available/timetrack.leanderziehm.com ===
server {
    server_name timetrack.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5004;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/timetrack.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/timetrack.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = timetrack.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name timetrack.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/tts.leanderziehm.com ===
server {
    server_name tts.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5006;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/tts.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/tts.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


server {
    if ($host = tts.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name tts.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/umami.leanderziehm.com ===
server {
    server_name umami.leanderziehm.com;

    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/umami.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/umami.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = umami.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name umami.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/vault.leanderziehm.com ===
server {
    server_name vault.leanderziehm.com;

    location / {
        proxy_pass http://localhost:8001;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/vault.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/vault.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = vault.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name vault.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/w.leanderziehm.com ===
server {
    server_name w.leanderziehm.com;

    location / {
        proxy_pass http://localhost:9091;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

location /whisperlive/ {
    proxy_pass http://127.0.0.1:9091/;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/w.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/w.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = w.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name w.leanderziehm.com;
    return 404; # managed by Certbot


}

=== ./sites-available/web-change-tracker.leanderziehm.com ===
server {
    server_name web-change-tracker.leanderziehm.com;

    location / {
        proxy_pass http://localhost:5014;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/web-change-tracker.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/web-change-tracker.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = web-change-tracker.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name web-change-tracker.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/webhooks.leanderziehm.com ===
server {
    listen 80;
    server_name webhooks.leanderziehm.com;

    location / {
        proxy_pass http://130.61.81.42:5005;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

=== ./sites-available/xwiki.leanderziehm.com ===
server {
    server_name xwiki.leanderziehm.com;

    location / {
        proxy_pass http://localhost:8081;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/xwiki.leanderziehm.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/xwiki.leanderziehm.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = xwiki.leanderziehm.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name xwiki.leanderziehm.com;
    return 404; # managed by Certbot


}
=== ./sites-available/yt.leanderziehm.com ===
server {
    listen 80;
    server_name yt.leanderziehm.com;

    location / {
        proxy_pass http://127.0.0.1:5003;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
