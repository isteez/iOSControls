//
//  Tasks.swift
//  Singleton Example
//
//  Created by Stephen Kyles on 10/5/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

import Foundation

class Tasks: NSObject {
    
    class func sharedTasks() -> Tasks {
        return _sharedTasks
    }
    
    override init() {
        println("I am alive!")
    }
}

let _sharedTasks: Tasks = { Tasks() } ()