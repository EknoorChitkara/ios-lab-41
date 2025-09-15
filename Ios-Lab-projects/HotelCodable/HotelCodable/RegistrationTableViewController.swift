//
//  RegistrationTableViewController.swift
//  HotelCodable
//
//  Created by Eknoor on 28/08/25.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

    var registrations: [Registration] = []
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        
        let registration = registrations[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(registration.firstName) \(registration.lastName)"
        content.secondaryText = (registration.checkInDate..<registration.checkOutDate).formatted(date: .numeric, time: .omitted ) + ": " + registration.roomType.name
        cell.contentConfiguration = content
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "registrationDetail", sender: indexPath)
    }


    @IBAction func unwindToRegistrationTableViewController( unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController,let registration = addRegistrationTableViewController.registration else { return }
        
        registrations.append(registration)
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registrationDetail",
           let destinationVC = segue.destination as? AddRegistrationTableViewController,
           let indexPath = sender as? IndexPath {
            
            let selectedRegistration = registrations[indexPath.row]
            destinationVC.viewRegistration = selectedRegistration
        }
    }

}
