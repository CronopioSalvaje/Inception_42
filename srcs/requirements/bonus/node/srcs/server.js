const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, 'app')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'app', 'index.html'));
});

app.use((req, res) => {
  res.status(404).sendFile(path.join(__dirname, 'app', '404.html'));
});

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`);
  });


//     /var/www/html