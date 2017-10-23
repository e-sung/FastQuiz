//
//  ViewController.swift
//  Prototype
//
//  Created by esung on 2017. 10. 21..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class RemoconViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func sendPrev(_ sender:UIButton){
        NetworkController.main.sendPrevSignal()
    }
    
    @IBAction func sendNext(_ sender:UIButton){
        NetworkController.main.sendNextSignal()
    }
    @IBAction func sendQuiz(_ sender:UIButton){
        NetworkController.main.sendOXQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

