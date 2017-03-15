//
//  ViewController.swift
//  Classroom QR
//
//  Created by Josh Zhanson on 2/10/17.
//  Copyright © 2017 Josh Zhanson. All rights reserved.
//

import UIKit


struct persistData {
    static var input: Set<String> = []
    static var parsed = [String: String]()
    static var classes : [classroom] = []
    static var currentClass : classroom? = nil
    static var results = [String: String]()
    static var currentQuestion : Question? = nil
}

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

