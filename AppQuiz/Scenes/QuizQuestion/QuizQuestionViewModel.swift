//
//  QuizQuestionViewModel.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import Foundation

//View Model
protocol QuizQuestionViewModelProtocol {
    var numberQuestions : Int { get }
    func getCurrentQuestion() -> Question
    var isFinishQuiz : Bool { get }
    var isLastQuestionQuiz : Bool { get }
    mutating func setCurrentPosition(currentPosition: Int)
    mutating func setSelectedOptionPosition(selectedOptionPosition: Int)
    mutating func resetIsSelectedAnswer()
    func isCorrectSelectedAnswer() -> Bool
    mutating func addCorrectScore()
    mutating func resetSelectedOptionPosition()
}

struct QuizQuestionViewModel {
    
    var mCurrentPosition: Int = 1
    var mQuestionList: [Question] = []
    var mSelectedOptionPosition: Int = 0
    var isSelectedAnswer: Bool = false
    var mUserName: String? = nil
    var mCorrectAnswer: Int = 0
    
    init(questions: [Question]) {
        self.mQuestionList = questions
        Constants.shared.TOTAL_QUESTIONS = "\(questions.count)"
    }
}

extension QuizQuestionViewModel : QuizQuestionViewModelProtocol {
    
    var numberQuestions : Int {
        return mQuestionList.count
    }
    
    func getCurrentQuestion() -> Question {
        let questionsList = mQuestionList
        let currentPosition = mCurrentPosition
        let question : Question = questionsList[currentPosition - 1]
        return question
    }
    
    var isFinishQuiz : Bool {
        Constants.shared.CORRECT_ANSWER = "\(mCorrectAnswer)"
        return mCurrentPosition > mQuestionList.count
    }
    
    mutating func setCurrentPosition(currentPosition: Int) {
        self.mCurrentPosition = currentPosition
    }
    
    mutating func setSelectedOptionPosition(selectedOptionPosition: Int) {
        self.mSelectedOptionPosition = selectedOptionPosition
        self.isSelectedAnswer = true
    }
    
    mutating func resetSelectedOptionPosition() {
        self.mSelectedOptionPosition = 0
    }
    
    mutating func resetIsSelectedAnswer() {
        self.isSelectedAnswer = false
    }
    
    func isCorrectSelectedAnswer() -> Bool {
        let question = getCurrentQuestion()
        return question.correctAnswer == mSelectedOptionPosition
    }
    
    mutating func addCorrectScore() {
        self.mCorrectAnswer += 1
    }
    
    var isLastQuestionQuiz : Bool {
        return mCurrentPosition == mQuestionList.count
    }
}
