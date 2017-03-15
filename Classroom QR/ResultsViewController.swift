//
//  ResultsViewController.swift
//  Classroom QR
//
//  Created by Jennifer Lee on 2/11/17.
//  Copyright © 2017 Josh Zhanson. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        return persistData.results.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var names: [String] = [String]()
        var answers: [String] = [String]()
        var i = 0
        for (key, value) in persistData.results
        {
            names.append(key)
            answers.append(value)
            i+=1
        }
        let cell = UITableViewCell()
        cell.textLabel!.text = names[indexPath.row]+"                                       "+answers[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("pressed")
    }
}
