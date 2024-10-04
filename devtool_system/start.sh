\python manage.py makemigrations --no-input
python manage.py migrate --no-input
npm install

python manage.py runserver 8000 & npm run start &