//
//  QuizQuestionView.swift
//  AppQuiz
//
//  Created by Papon Supamongkonchai on 14/3/2566 BE.
//

import UIKit

class QuizQuestionView: UIView {
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var tvQuestion: UILabel!
    @IBOutlet weak var tvProgress: UILabel!
    @IBOutlet weak var viewOptionOne: UIView!
    @IBOutlet weak var viewOptionTwo: UIView!
    @IBOutlet weak var viewOptionThree: UIView!
    @IBOutlet weak var viewOptionFour: UIView!
    @IBOutlet weak var tvOptionOne: UILabel!
    @IBOutlet weak var tvOptionTwo: UILabel!
    @IBOutlet weak var tvOptionThree: UILabel!
    @IBOutlet weak var tvOptionFour: UILabel!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet weak var btnOptionFour: UIButton!
    @IBOutlet weak var viewBtnSubmit: UIView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    func setUpView() {
        
        btnOptionOne.setTitle("", for: .normal)
        btnOptionTwo.setTitle("", for: .normal)
        btnOptionThree.setTitle("", for: .normal)
        btnOptionFour.setTitle("", for: .normal)
        
        progressBar.progress = 0.0
        
        defaultOptionsView()
    }
    
    func defaultOptionsView() {
        tvOptionOne.tag = 0
        tvOptionTwo.tag = 1
        tvOptionThree.tag = 2
        tvOptionFour.tag = 3
        
        tvOptionOne.textColor = UIColor(hexString: "#7A8089")
        tvOptionTwo.textColor = UIColor(hexString: "#7A8089")
        tvOptionThree.textColor = UIColor(hexString: "#7A8089")
        tvOptionFour.textColor = UIColor(hexString: "#7A8089")
        
        viewOptionOne.layer.cornerRadius = CGFloat(10)
        viewOptionOne.layer.borderWidth = CGFloat(1)
        viewOptionOne.layer.borderColor = UIColor(hexString: "#363A43").cgColor
        viewOptionTwo.layer.cornerRadius = CGFloat(10)
        viewOptionTwo.layer.borderWidth = CGFloat(1)
        viewOptionTwo.layer.borderColor = UIColor(hexString: "#363A43").cgColor
        viewOptionThree.layer.cornerRadius = CGFloat(10)
        viewOptionThree.layer.borderWidth = CGFloat(1)
        viewOptionThree.layer.borderColor = UIColor(hexString: "#363A43").cgColor
        viewOptionFour.layer.cornerRadius = CGFloat(10)
        viewOptionFour.layer.borderWidth = CGFloat(1)
        viewOptionFour.layer.borderColor = UIColor(hexString: "#363A43").cgColor
        viewBtnSubmit.layer.cornerRadius = CGFloat(10)
        
        viewOptionOne.backgroundColor = .white
        viewOptionTwo.backgroundColor = .white
        viewOptionThree.backgroundColor = .white
        viewOptionFour.backgroundColor = .white
    }
    
    func selectedOptionsView(tvSelectTag:Int, selectedOptionNum: Int) {
        defaultOptionsView()
        if tvSelectTag == 0 {
            tvOptionOne.textColor = UIColor(hexString: "#363A43")
            viewOptionOne.layer.borderWidth = CGFloat(2)
            viewOptionOne.layer.borderColor = UIColor(hexString: "#6200EE").cgColor
        } else if tvSelectTag == 1 {
            tvOptionTwo.textColor = UIColor(hexString: "#363A43")
            viewOptionTwo.layer.borderWidth = CGFloat(2)
            viewOptionTwo.layer.borderColor = UIColor(hexString: "#6200EE").cgColor
        } else if tvSelectTag == 2 {
            tvOptionThree.textColor = UIColor(hexString: "#363A43")
            viewOptionThree.layer.borderWidth = CGFloat(2)
            viewOptionThree.layer.borderColor = UIColor(hexString: "#6200EE").cgColor
        } else if tvSelectTag == 3 {
            tvOptionFour.textColor = UIColor(hexString: "#363A43")
            viewOptionFour.layer.borderWidth = CGFloat(2)
            viewOptionFour.layer.borderColor = UIColor(hexString: "#6200EE").cgColor
        }
    }
    
    func setImageQuestion(nameImage:String) {
        ivImage.image = nameImage.toImage()
    }
    
    func setTitleBtnSubmit(isFinishQuiz:Bool) {
        btnSubmit.setTitle( isFinishQuiz ? "FINISH" : "SUBMIT", for: .normal)
    }

    func setTitleBtnSubmit(isLastQuiz:Bool) {
        btnSubmit.setTitle(isLastQuiz ? "FINISH" : "GO TO NEXT QUESTION", for: .normal)
    }
    
    func setQuestionDisplay(question : Question, quizQuestionVM : QuizQuestionViewModel) {
        
        setImageQuestion(nameImage: question.image)
        let currentPosition = quizQuestionVM.mCurrentPosition
        progressBar?.progress = Float(currentPosition) / 10.0
        
        tvProgress?.text = "\(currentPosition)/\(quizQuestionVM.numberQuestions)"
        tvQuestion?.text = question.question
        tvOptionOne?.text = question.optionOne
        tvOptionTwo?.text = question.optionTwo
        tvOptionThree?.text = question.optionThree
        tvOptionFour?.text = question.optionFour
        
        setTitleBtnSubmit(isFinishQuiz: quizQuestionVM.isFinishQuiz)
    }
    
    func setAnswerView(answer: Int, isCorrectSelected: Bool) {
        if answer == 1 {
            viewOptionOne.backgroundColor = isCorrectSelected ? UIColor(hexString: "#99CC00") : UIColor(hexString: "#FF4444")
        } else if answer == 2 {
            viewOptionTwo.backgroundColor = isCorrectSelected ? UIColor(hexString: "#99CC00") : UIColor(hexString: "#FF4444")
        } else if answer == 3 {
            viewOptionThree.backgroundColor = isCorrectSelected ? UIColor(hexString: "#99CC00") : UIColor(hexString: "#FF4444")
        } else if answer == 4 {
            viewOptionFour.backgroundColor = isCorrectSelected ? UIColor(hexString: "#99CC00") : UIColor(hexString: "#FF4444")
        }
    }
    
    
    
}
