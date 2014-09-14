//
//  ViewController.swift
//  LoadingHud
//
//  Created by Stephen Kyles on 9/13/14.
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
    
    @IBAction func ShowHud() {
        let hud = Hud(viewFrame: self.view.frame, hudMessage: "Loading")
        hud.StartIndicator()
        self.view.addSubview(hud.HudView())
    }
}

