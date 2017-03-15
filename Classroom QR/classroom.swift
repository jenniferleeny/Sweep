//
//  classroom.swift
//  Classroom QR
//
//  Created by Jennifer Lee on 2/11/17.
//  Copyright © 2017 Josh Zhanson, Jennifer Lee, Emilie Guermeur, Benjamin Johnson-Staub! All rights reserved.
//

import Foundation
import UIKit

class classroom {
    var students = [Student]()
    var className = ""
    var questions: [Question] = []
    
    init(classTitle : String){
        self.className = classTitle
        self.students = [Student]()
    }
    
    func addStudent(studentName : String){
        students.append(Student(firstName: studentName))
    }
    
    func generateQr(){
        //TO DO
    }
    
}



