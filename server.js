const express = require('express');
const mysql = require('mysql');
const path = require('path');
const app = express();
const port = 3000;

// Serve the static files from the "public" folder in the React app
app.use(express.static(path.join(__dirname, 'build')));

// Create a MySQL database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'pinnacle',
    database: 'lexiquiz'
});

// Connect to the MySQL database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to MySQL database');
});

// Define API endpoints for quiz operations
app.get('/quiz/:id', (req, res) => {
   const quizId = req.params.id;
   // Retrieve quiz details from the database based on the quiz ID
    db.query('SELECT * FROM QuizSession WHERE QuizID = ?', [quizId], (err, results) => {
        if (err) {
            res.status(500).send('Error fetching quiz details');
        } else {
            res.json(results);
        }
    });
});

// Add more API endpoints for user participation, scoring, leaderboard updates, etc.
app.get('/', (req, res) => {
   res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start the server
app.listen(port, () => {
   console.log(`Backend server is running on port ${port}`);
});