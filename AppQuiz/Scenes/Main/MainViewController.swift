//
//  MainViewController.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: property view
    @IBOutlet var mainView: MainView!
    
    //MARK: property data, viewModel
    private var mainVM : MainViewModel? = nil
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setMainView()
    }
    
    //MARK: function
    
    private func setMainView() {
        mainView.setUpView()
        mainView.usernameTextfield.delegate = self
    }


    func openQuizQuestionViewController() {
        let vc = UIStoryboard.init(name: "QuizQuestionStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "QuizQuestionViewController") as? QuizQuestionViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK: button action
    
    @IBAction func btnStart_click(_ sender: Any) {
        guard let mainVM else { return }
        let usernameText = mainView.usernameText
        if mainVM.validateUserName(text: usernameText) {
            openQuizQuestionViewController()
        }
    }
    
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == mainView.usernameTextfield {
            let usernameText = mainView.usernameText
            mainVM = MainViewModel(user: User(username: usernameText))
        }
        
    }
}

