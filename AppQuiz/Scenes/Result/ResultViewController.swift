//
//  ResultViewController.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultView: ResultView!
    
    var resultVM : ResultViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        setUpResultViewModel()
    }
    
    // MARK: - setup view
    private func setUpView() {
        resultView.setUpView()
    }
    
    // MARK: - Navigation
    func openRestartPlayQuizAgain() {
        resultVM.clearConstantsDataScore()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Function
    func setUpResultViewModel() {
        resultVM = ResultViewModel()
        
        resultView.setNameText(name: resultVM.result.name)
        resultView.setScoreText(score: resultVM.result.totalScore, total: resultVM.result.totalQuestions)
    }
    
    // MARK: - Button Action
    
    @IBAction func btnFinish_click(_ sender: Any) {
        openRestartPlayQuizAgain()
    }
    
}
