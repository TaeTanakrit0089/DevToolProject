# REQUIRE PACKAGES
## Backend
### PHP INSTALL
```
sudo apt install php libapache2-mod-php
sudo apt install php-pgsql
sudo systemctl restart apache2.service 
```

## Frontend
### Vite + Tailwind INSTALL
```
cd frontend
npm install
npm run dev
npm run build
```