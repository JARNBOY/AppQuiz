//
//  MainView.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import UIKit


class MainView: UIView {
    
    @IBOutlet weak var viewCenterInputName: UIView!
    @IBOutlet weak var viewUsernameTextField: UIView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var viewBtnStart: UIView!
    @IBOutlet weak var btnStart: UIButton!
    
    
    //Logic funtion setup view
    func setUpView() {
        viewCenterInputName.layer.cornerRadius = CGFloat(10)
        viewUsernameTextField.layer.cornerRadius = CGFloat(10)
        viewBtnStart.layer.cornerRadius = CGFloat(10)
        viewUsernameTextField.layer.borderWidth = CGFloat(1)
        viewUsernameTextField.layer.borderColor = UIColor(hexString: "#363A43").cgColor
    }
    
    var usernameText: String {
        return usernameTextfield.text ?? ""
    }
    
}
