//
//  QuestionsViewController.swift
//  Classroom QR
//
//  Created by Jennifer Lee on 2/11/17.
//  Copyright © 2017 Josh Zhanson. All rights reserved.
//

import Foundation
import UIKit

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let screenBounds = UIScreen.main.bounds
        let screenWidth = screenBounds.width
        let screenHeight = screenBounds.height
        self.tableView = UITableView(frame: CGRect(x: 0, y: screenHeight/8, width: screenWidth, height: 3*screenHeight/4))
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.view.addSubview(self.tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistData.currentClass!.questions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = persistData.currentClass!.questions[indexPath.row].question
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("pressed")
    }
    
    @IBAction func showEnterQuestionAlert(sender: UIBarButtonItem) {
        let message = "Enter new question."
        let pushPrompt = UIAlertController(title: "New question", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            persistData.currentClass!.questions.append(Question(quest: pushPrompt.textFields![0].text!))
            self.tableView.reloadData()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in })
        pushPrompt.addAction(ok)
        pushPrompt.addAction(cancel)
        pushPrompt.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Question"
        }
        present(pushPrompt, animated: true, completion: nil)
    }
}
