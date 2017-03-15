//
//  Question.swift
//  Classroom QR
//
//  Created by Jennifer Lee on 2/11/17.
//  Copyright © 2017 Josh Zhanson. All rights reserved.
//

import Foundation
import UIKit

class Question {
    
    static var questionNumCount = 0
    var questionNum = 0
    var question = ""
    var solution = ""
    var students = [Student]()
    var studentAnswers = [String : String]()

    init (quest: String) {
        self.questionNum = Question.questionNumCount
        Question.questionNumCount += 1
        self.question = quest
    }
    
    func question(q : String) {
        question = q
    }
    
    func addSolution(sol : String) {
        solution = sol
    }
    
    func addStudentToQuestion(child : String) {
        studentAnswers[child] = "-"
    }
    
    func addStudentAnswer (child : String, answer : String) {
        studentAnswers[child] = answer
    }
    //sweep takes in output of QR code scanning and list of student objects...
    func sweep(sweepResult : Set<String> ) {
        print(sweepResult)
        //student is string and answer is string
        for student in students {
            for str in sweepResult {
                let name = str[0..<str.length-2]
                let ans = str[str.length-1]
                
                if (student.name == name) {
                    studentAnswers[student.name] = ans
                    student.history[questionNum] = ans
                }
            }
            //print(student.name)
            //print(student.history)
        }
    }
}

