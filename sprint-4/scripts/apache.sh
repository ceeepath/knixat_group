#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

sudo chmod 777 -R /var/www/html/index.html
# Query the private IP address
private_ip=$(hostname -I)

# Use cat and EOF to update the HTML file
cat > /var/www/html/index.html <<EOF
<html>
  <body>
    <h1>The IP Address of this server is: $private_ip</h1>
  </body>
</html>
EOF

sudo systemctl restart apache2