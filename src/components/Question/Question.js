import React, { useState } from 'react';
import Answer from '../Answer/Answer';

const Question = () => {
    // Question component logic and state management

    return (
      <div className="question-container">
          <h2>Question title</h2>
          <ul>
              <Answer text="Option 1"/>
              <Answer text="Option 2"/>
          </ul>
      </div>
    );
}

export default Question;