//
//  PersonListTableViewController.swift
//  PairRandomizer36
//
//  Created by Shean Bjoralt on 10/16/20.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    
    //MARK: - Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        PersonController.shared
    }
    
    //MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentAlertController()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
    }
    
    //MARK: - Helper Methods
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Please Add a Person's Full Name to This List", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Full Name..."
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let addItemAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let person = alertController.textFields?[0].text, !person.isEmpty else { return }
            PersonController.shared.createPerson(person: person)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addItemAction)
        
        present(alertController, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PersonController.shared.people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
