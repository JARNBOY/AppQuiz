//
//  ResultViewModel.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import Foundation


//View Model
protocol ResultViewModelProtocol {
    var result : Result { get }
    func clearConstantsDataScore()
}

struct ResultViewModel {
    var _result: Result
    
    init() {
        let name = Constants.shared.USER_NAME
        let totalScore = Constants.shared.CORRECT_ANSWER
        let totalQuestions = Constants.shared.TOTAL_QUESTIONS
        let result = Result(name: name, totalScore: totalScore, totalQuestions: totalQuestions)
        self._result = result
    }
}

extension ResultViewModel: ResultViewModelProtocol {
    
    var result : Result {
        return _result
    }
    
    func clearConstantsDataScore() {
        Constants.shared.USER_NAME  = ""
        Constants.shared.TOTAL_QUESTIONS  = ""
        Constants.shared.CORRECT_ANSWER  = ""
    }
}
