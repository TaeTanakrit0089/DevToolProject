fetch('http://backend:8000/test.php')
    .then(response => response.json())
    .then(data => console.log(data));