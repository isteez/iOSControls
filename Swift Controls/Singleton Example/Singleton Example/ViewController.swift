//
//  ViewController.swift
//  Singleton Example
//
//  Created by Stephen Kyles on 10/5/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sharedTasks = Tasks.sharedTasks()
        let sharedTasks2 = Tasks.sharedTasks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

