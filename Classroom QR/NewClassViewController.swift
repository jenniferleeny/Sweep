//
//  NewClassViewController.swift
//  Classroom QR
//
//  Created by Jennifer Lee on 2/11/17.
//  Copyright © 2017 Josh Zhanson. All rights reserved.
//

import Foundation
import UIKit


class NewClassViewController: UIViewController {

    @IBAction func cancelButton(sender: UIBarButtonItem) {
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var className: UITextField?
    
    @IBAction func addClass (sender : UIButton) {
        let newClassroom = classroom(classTitle: (className?.text)!)
        persistData.classes.append(newClassroom)
        persistData.currentClass = newClassroom
        print(persistData.classes[0].className)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }

}
