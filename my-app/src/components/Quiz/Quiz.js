import React, { useState } from 'react';
import Question from '../Question/Question';

const Quiz = () => {
    const [activeQuestion, setActiveQuestion] = useState(0);
    const [selectedAnswer, setSelectedAnswer] = useState('');
    const [result, setResult] = useState({
        score: 0,
        correctAnswers: 0,
        wrongAnswers: 0,
    });

    return (
        <div className="quiz-container">
            <h1>Quiz</h1>
            <Question/>
        </div>
    );
}

export default Quiz;