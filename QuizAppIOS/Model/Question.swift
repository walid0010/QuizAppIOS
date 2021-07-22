//
//  Question.swift
//  QuizAppIOS
//
//  Created by chekir walid on 22/7/2021.
//

import Foundation

struct Question {
    let text:String
    let answer:[String]
    let correctAnswer:String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
    
}
