//
//  ResultView.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import UIKit

class ResultView: UIView {

    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblScoreResult: UILabel!
    @IBOutlet weak var btnFinish: UIButton!
    
    func setUpView() {
        btnFinish.layer.cornerRadius = CGFloat(10)
    }
    
    func setNameText(name: String) {
        lblUsername.text = name
    }
    
    func setScoreText(score: String, total: String) {
        lblScoreResult.text = "Your Score is \(score) out of \(total)"
    }
    
}
