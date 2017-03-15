//
//  MainClassViewController.swift
//  Classroom QR
//
//  Created by Josh Zhanson on 2/11/17.
//  Copyright © 2017 Josh Zhanson. All rights reserved.
//

import Foundation
import UIKit

class MainClassViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let screenBounds = UIScreen.main.bounds
        let screenWidth = screenBounds.width
        let screenHeight = screenBounds.height
        self.tableView = UITableView(frame: CGRect(x: 0, y: screenHeight/8, width: screenWidth, height: screenHeight/2))
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.view.addSubview(self.tableView)
    }
    
    @IBAction func showEnterStudentAlert(sender: UIButton) {
        let message = "Enter student name."
        let pushPrompt = UIAlertController(title: "New student", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            persistData.currentClass!.students.append(Student(firstName: pushPrompt.textFields![0].text!))
            self.tableView.reloadData()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in })
        pushPrompt.addAction(ok)
        pushPrompt.addAction(cancel)
        pushPrompt.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Student name"
        }
        present(pushPrompt, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistData.currentClass!.students.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = persistData.currentClass!.students[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("pressed")
    }
}
