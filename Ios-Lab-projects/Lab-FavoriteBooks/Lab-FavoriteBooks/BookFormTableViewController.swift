//
//  BookFormTableViewController.swift
//  Lab-FavoriteBooks
//
//  Created by Eknoor on 25/08/25.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var imgUrlTextField: UITextField!
    
    var book: Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            UpdateUI(book: <#T##Book#>)
        }
    }
    
    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

    
    func UpdateUI(book: Book) {
        bookTitleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = String(book.length)
        imgUrlTextField.text = book.imageURL
    }
    @IBAction func saveBtnTapped(_ sender: Any) {
    }
    

}
