//
//  PairRandomizer+Convenience.swift
//  PairRandomizer36
//
//  Created by Shean Bjoralt on 10/16/20.
//

import Foundation
import CoreData

extension PeoplePairs {
    
    convenience init(person: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.person = person
    }
}
