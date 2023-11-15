//
//  ViewController.swift
//  TestFrameworkProject
//
//  Created by 박준하 on 11/15/23.
//

import UIKit
import TestFramework

class ViewController: UIViewController {
    
    let user: String = "junha"
    var hello: String {
        return Hello().helloUser(user).description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        print(hello)
    }


}

