//
//  CoreDataHelper.swift
//  Swift Controls
//
//  Created by Stephen Kyles on 9/13/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@objc(Entity)
class Entity: NSManagedObject {
    @NSManaged var name: String
}

func ManagedContext() -> NSManagedObjectContext {
    let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    let context = appDelegate.managedObjectContext
    return context!
}

func FetchEntityFromCoreData(entityName: String) -> NSArray {
    let context = ManagedContext()
    let request = NSFetchRequest(entityName: entityName)
    request.returnsObjectsAsFaults = false
    
    var results = context.executeFetchRequest(request, error: nil)
    NSLog("%@", results!)
    return results!
}

func SaveEntityToCoreData(entityName: String, entityObject: Entity) {
    let context = ManagedContext()
    let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)
    let newEntity = Entity(entity: entity!, insertIntoManagedObjectContext: context)
    newEntity.name = "Steve"
    context.save(nil)
}

func FetchEntityFromCoreDataBy(entityName: String, entityFilter: String) -> NSArray {
    let context = ManagedContext()
    let request = NSFetchRequest(entityName: entityName)
    request.returnsObjectsAsFaults = false
    request.predicate = NSPredicate(format: "name = %@", entityFilter)
    
    var results = context.executeFetchRequest(request, error: nil)
    NSLog("%@", results!)
    return results!
}