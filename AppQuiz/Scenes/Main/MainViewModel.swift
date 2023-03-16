//
//  MainViewModel.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import Foundation

//View Model
protocol MainViewModelProtocol {
    func saveConstantUser()
    func validateUserName(text:String) -> Bool
}

struct MainViewModel {
    var user: User
    
    init(user: User) {
        self.user = user
    }
}

extension MainViewModel: MainViewModelProtocol {
    
    func saveConstantUser() {
        Constants.shared.USER_NAME = user.username
    }
    
    func validateUserName(text:String) -> Bool {
        return !text.isEmpty
    }
    
}


