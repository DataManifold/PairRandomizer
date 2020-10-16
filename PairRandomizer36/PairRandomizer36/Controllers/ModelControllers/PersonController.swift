//
//  PersonController.swift
//  PairRandomizer36
//
//  Created by Shean Bjoralt on 10/16/20.
//

import Foundation
import CoreData

class PersonController {
    
    //MARK: - Properties
    
    static let shared = PersonController()
    
    var people: [PeoplePairs] = []
    
    let fetchResultsController: NSFetchedResultsController<PeoplePairs> = {
        
        let fetchRequest: NSFetchRequest<PeoplePairs> = PeoplePairs.fetchRequest()
        
        return fetchRequest
    }()
    
    init() {
        do {
            try fetchResultsController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - CRUD Functions
    
    func createPerson(person: String) {
        _ = PeoplePairs(person: person)
        saveToPersistanceStore()
    }
    
    func deletePerson(person: PeoplePairs) {
        let moc = CoreDataStack.context
        moc.delete(person)
        saveToPersistanceStore()
    }
    
    //MARK: - Persistance
    
    func saveToPersistanceStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
