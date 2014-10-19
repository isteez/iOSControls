//
//  ViewController.swift
//  SegmentedControl Example
//
//  Created by - on 10/18/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            NSLog("%i", sender.selectedSegmentIndex)
        case 1:
            NSLog("%i", sender.selectedSegmentIndex)
        case 2:
             NSLog("%i", sender.selectedSegmentIndex)
        default:
            break
        }
    }
}

