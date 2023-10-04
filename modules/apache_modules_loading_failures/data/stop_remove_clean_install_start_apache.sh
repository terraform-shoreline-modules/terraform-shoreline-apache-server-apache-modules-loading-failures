
#!/bin/bash

# Stop Apache server

sudo systemctl stop apache2

# Remove Apache server package

sudo yum  remove apache2

# Clean residual dependencies

sudo yum autoremove

# Install latest version of Apache server package

sudo yum install apache2

# Start Apache server

sudo systemctl start apache2