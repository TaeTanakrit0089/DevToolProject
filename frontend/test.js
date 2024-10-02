fetch('http://backend:8000/api/endpoint')
  .then(response => response.json())
  .then(data => console.log(data));