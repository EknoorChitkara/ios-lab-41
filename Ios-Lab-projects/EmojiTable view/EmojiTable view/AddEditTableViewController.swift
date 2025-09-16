//
//  AddEditTableViewController.swift
//  EmojiTable view
//
//  Created by Eknoor on 21/08/25.
//

import UIKit


class AddEditTableViewController: UITableViewController {
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    var emoji : Emoji?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBtn.isEnabled = false
        if let emoji = emoji {
            print(emoji)
                updateUI(emoji: emoji)
            }
        updateTheBtnState()
    }
    
    init?(coder: NSCoder, emoji : Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.emoji = nil  // default for Add case
       }
    
    func updateUI(emoji: Emoji) {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
    }
    // MARK: - Table view data source

    
    @IBAction func textFieldUpdated(_ sender: Any?) {
        updateTheBtnState()
    }
    func updateTheBtnState() {
        if symbolTextField.text != "" && nameTextField.text != "" && descriptionTextField.text != "" && usageTextField.text != ""{
            saveBtn.isEnabled=true
        }
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        let emoji = Emoji(symbol: symbolTextField.text ?? "", name: nameTextField.text ?? "", description: descriptionTextField.text ?? "", usage: usageTextField.text ?? "")
        self.emoji = emoji
        performSegue(withIdentifier: "unwindSave", sender: nil)
    }
    
}
