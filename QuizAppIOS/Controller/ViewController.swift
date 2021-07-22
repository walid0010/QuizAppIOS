//
//  ViewController.swift
//  QuizAppIOS
//
//  Created by chekir walid on 22/7/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton3: UIButton!
    
    
    var timer = Timer()
    var totalQuestion :Int = 0
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.0
        updateUI()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        let answer = sender.currentTitle!
        if quizBrain.checkAnswer(answer){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        let answerChoices = quizBrain.getAnswers()
        
        choiceButton1.setTitle(answerChoices[0], for: .normal)
        choiceButton2.setTitle(answerChoices[1], for: .normal)
        choiceButton3.setTitle(answerChoices[2], for: .normal)
        
        questionLabel.text = quizBrain.getQuestionText()
        choiceButton1.backgroundColor = UIColor.clear
        choiceButton2.backgroundColor = UIColor.clear
        choiceButton3.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
}

