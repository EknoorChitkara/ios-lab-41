//
//  EmojiTableViewController.swift
//  EmojiTable view
//
//  Created by Eknoor on 21/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    @IBSegueAction func addEditSegue(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
        guard let indexPath = sender as? IndexPath else{
            return AddEditTableViewController(coder: coder, emoji: nil)
        }
        return AddEditTableViewController(coder: coder, emoji: Emoji.emojis[indexPath.row])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Emoji.emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        cell.updateUI(emoji: Emoji.emojis[indexPath.row])
            
            cell.showsReorderControl = true

            // Configure the cell...
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "editEmoji", sender: indexPath)
            
        }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
*/
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Emoji.emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removeEmoji = Emoji.emojis.remove(at: fromIndexPath.row)
        Emoji.emojis.insert(removeEmoji, at: to.row)
    }


    
    // Override to support conditional rearranging of the table view.
    /*
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
     */

    @IBAction func unwindToEmojiTableView(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
              let sourceVC = segue.source as? AddEditTableViewController,
              let emoji = sourceVC.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Editing existing emoji
            Emoji.emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            // Adding new emoji
            let newIndexPath = IndexPath(row: Emoji.emojis.count, section: 0)
            Emoji.emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
