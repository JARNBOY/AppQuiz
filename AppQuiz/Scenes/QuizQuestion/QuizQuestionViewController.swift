//
//  QuizQuestionViewController.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import UIKit

class QuizQuestionViewController: UIViewController {
    
    //MARK: property
    @IBOutlet weak var quizQuestionView : QuizQuestionView!
    
    var quizQuestionVM: QuizQuestionViewModel!
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpQuizView()
        getQuestionQuiz()
        setQuestionList()
        quizQuestionView.defaultOptionsView()
    }
    
    // MARK: - setup view
    private func setUpQuizView() {
        quizQuestionView.setUpView()
    }
    
    private func answerView(answer: Int, isCorrectSelected: Bool) {
        quizQuestionView.setAnswerView(answer: answer, isCorrectSelected: isCorrectSelected)
    }
    
    // MARK: - Function
    func getQuestionQuiz() {
        let questions = Constants.shared.getQuestions()
        quizQuestionVM = QuizQuestionViewModel(questions: questions)
    }
    
    func setQuestionList() {
        quizQuestionView.defaultOptionsView()
        
        let question : Question = quizQuestionVM.getCurrentQuestion()
        quizQuestionView.setQuestionDisplay(question: question, quizQuestionVM: quizQuestionVM)
        quizQuestionView.setTitleBtnSubmit(isFinishQuiz: quizQuestionVM.isFinishQuiz)
    }
    
    private func selectedOptionView(tvSelectTag:Int, selectedOptionNum: Int) {
        quizQuestionView.defaultOptionsView()
        quizQuestionVM.setSelectedOptionPosition(selectedOptionPosition: selectedOptionNum)
        quizQuestionView.selectedOptionsView(tvSelectTag:tvSelectTag,selectedOptionNum: selectedOptionNum)
    }
    
    // MARK: - Navigation
    func openResultViewController() {
        
        let vc = UIStoryboard.init(name: "ResultStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func displayAlertDialog(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Button action
    @IBAction func tvOptionOne_click(_ sender: Any) {
        let selectedOptionNum = 1
        quizQuestionView.selectedOptionsView(tvSelectTag: 0, selectedOptionNum: selectedOptionNum)
        quizQuestionVM.setSelectedOptionPosition(selectedOptionPosition: selectedOptionNum)
    }
    
    @IBAction func tvOptionTwo_click(_ sender: Any) {
        let selectedOptionNum = 2
        quizQuestionView.selectedOptionsView(tvSelectTag: 1, selectedOptionNum: selectedOptionNum)
        quizQuestionVM.setSelectedOptionPosition(selectedOptionPosition: selectedOptionNum)
    }
    
    @IBAction func tvOptionThree_click(_ sender: Any) {
        let selectedOptionNum = 3
        quizQuestionView.selectedOptionsView(tvSelectTag: 2, selectedOptionNum: selectedOptionNum)
        quizQuestionVM.setSelectedOptionPosition(selectedOptionPosition: selectedOptionNum)
    }
    
    @IBAction func tvOptionFour_click(_ sender: Any) {
        let selectedOptionNum = 4
        quizQuestionView.selectedOptionsView(tvSelectTag: 3, selectedOptionNum: selectedOptionNum)
        quizQuestionVM.setSelectedOptionPosition(selectedOptionPosition: selectedOptionNum)
    }
    
    @IBAction func btnSubmit_click(_ sender: Any) {
        if (quizQuestionVM.mSelectedOptionPosition == 0) {
            if (quizQuestionVM.isSelectedAnswer) {
                quizQuestionVM.resetIsSelectedAnswer()
                quizQuestionVM.setCurrentPosition(currentPosition: quizQuestionVM.mCurrentPosition + 1)
                
                if !quizQuestionVM.isFinishQuiz {
                    setQuestionList()
                } else {
                    openResultViewController()
                }
                
            } else {
                displayAlertDialog(title: "Notice", message: "Please Select Answer.")
            }
            
        } else {
            
            if quizQuestionVM.isCorrectSelectedAnswer() {
                quizQuestionVM.addCorrectScore()
            } else {
                answerView(answer: quizQuestionVM.mSelectedOptionPosition, isCorrectSelected: false)
            }
            let question = quizQuestionVM.getCurrentQuestion()
            answerView(answer: question.correctAnswer,isCorrectSelected: true)
            
            quizQuestionView.setTitleBtnSubmit(isLastQuiz: quizQuestionVM.isLastQuestionQuiz )
            quizQuestionVM.resetSelectedOptionPosition()
            
        }
    }
    
}
