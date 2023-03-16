//
//  MainViewController.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: property
    @IBOutlet var mainView: MainView!
    
    private var mainVM : MainViewModel? = nil
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.usernameTextfield.text = ""
    }
    
    //MARK: setup view
    
    private func setMainView() {
        mainView.setUpView()
        mainView.usernameTextfield.delegate = self
    }

    // MARK: - Navigation
    func openQuizQuestionViewController() {
        let vc = UIStoryboard.init(name: "QuizQuestionStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "QuizQuestionViewController") as? QuizQuestionViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK: button action
    
    @IBAction func btnStart_click(_ sender: Any) {
        guard let mainVM else { return }
        let usernameText = mainView.usernameText
        if mainVM.validateUserName(text: usernameText) {
            mainVM.saveConstantUser()
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

