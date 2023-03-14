//
//  Constants.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import Foundation

class Constants{
    
    static let shared = Constants()
    
    init(){}
    
    var USER_NAME: String = "user_name"
    var TOTAL_QUESTIONS: String = "total_questions"
    var CORRECT_ANSWER: String = "correct_answers"
    var MAX_PROGRESS_VALUE = 10
    
    // TODO (STEP 6: Create a list of questions using the Question data model class. And add all the flag images to the drawable folder to add it in the list.)
    // START
    func getQuestions() -> [Question] {
        var questionsList = [Question]()
        
        // 1
        let que1 = Question(
            id: 1, question: "What country does this flag belong to?",
            image: "ic_flag_of_argentina",
            optionOne: "Argentina", optionTwo: "Australia",
            optionThree: "Armenia", optionFour: "Austria", correctAnswer: 1
        )
        
        questionsList.append(que1)
        
        // 2
        let que2 = Question(
            id: 2, question: "What country does this flag belong to?",
            image: "ic_flag_of_australia",
            optionOne: "Angola", optionTwo: "Austria",
            optionThree: "Australia", optionFour: "Armenia", correctAnswer: 3
        )
        
        questionsList.append(que2)
        
        // 3
        let que3 = Question(
            id: 3, question: "What country does this flag belong to?",
            image: "ic_flag_of_brazil",
            optionOne: "Belarus", optionTwo: "Belize",
            optionThree: "Brunei", optionFour: "Brazil", correctAnswer: 4
        )
        
        questionsList.append(que3)
        
        // 4
        let que4 = Question(
            id: 4, question: "What country does this flag belong to?",
            image: "ic_flag_of_belgium",
            optionOne: "Bahamas", optionTwo: "Belgium",
            optionThree: "Barbados", optionFour: "Belize", correctAnswer: 2
        )
        
        questionsList.append(que4)
        
        // 5
        let que5 = Question(
            id: 5, question: "What country does this flag belong to?",
            image: "ic_flag_of_fiji",
            optionOne: "Gabon", optionTwo: "France",
            optionThree: "Fiji", optionFour: "Finland", correctAnswer: 3
        )
        
        questionsList.append(que5)
        
        // 6
        let que6 = Question(
            id: 6, question: "What country does this flag belong to?",
            image: "ic_flag_of_germany",
            optionOne: "Germany", optionTwo: "Georgia",
            optionThree: "Greece", optionFour: "none of these", correctAnswer: 1
        )
        
        questionsList.append(que6)
        
        // 7
        let que7 = Question(
            id: 7, question: "What country does this flag belong to?",
            image: "ic_flag_of_denmark",
            optionOne: "Dominica", optionTwo: "Egypt",
            optionThree: "Denmark", optionFour: "Ethiopia", correctAnswer: 3
        )
        
        questionsList.append(que7)
        
        // 8
        let que8 = Question(
            id: 8, question: "What country does this flag belong to?",
            image: "ic_flag_of_india",
            optionOne: "Ireland", optionTwo: "Iran",
            optionThree: "Hungary", optionFour: "India", correctAnswer: 4
        )
        
        questionsList.append(que8)
        
        // 9
        let que9 = Question(
            id: 9, question: "What country does this flag belong to?",
            image: "ic_flag_of_new_zealand",
            optionOne: "Australia", optionTwo: "New Zealand",
            optionThree: "Tuvalu", optionFour: "United States of America", correctAnswer: 2
        )
        
        questionsList.append(que9)
        
        // 10
        let que10 = Question(
            id: 10, question: "What country does this flag belong to?",
            image: "ic_flag_of_kuwait",
            optionOne: "Kuwait", optionTwo: "Jordan",
            optionThree: "Sudan", optionFour: "Palestine", correctAnswer: 1
        )
        
        questionsList.append(que10)
        
        return questionsList
    }
    // END
    
    
}
