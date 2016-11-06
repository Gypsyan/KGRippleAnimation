//
//  ViewController.swift
//  demoApp
//
//  Created by Anantha Krishnan K G on 06/11/16.
//  Copyright © 2016 Ananth. All rights reserved.
//

import UIKit
import Foundation
import KGRippleAnimation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = KGRippleButton(frame: CGRect(x: 100, y: 90, width: 200, height: 100))
        button.addTarget(self, action: #selector(yourAction), for: .touchUpInside)
        button.setTitle("Here you Go", for: .normal);
        button.backgroundColor = UIColor.yellow;
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func yourAction(){
        print("This is your action")
    }
}

