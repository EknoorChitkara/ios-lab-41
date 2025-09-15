//
//  BookTableViewCell.swift
//  Lab-FavoriteBooks
//
//  Created by Eknoor on 25/08/25.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func UpdateUI(book: Book) {
        bookTitleLabel.text = book.title
        authorNameLabel.text = book.author
        genreLabel.text = book.genre
        lengthLabel.text = book.length
        
        // Load image from URL
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: book.imageURL) {
                DispatchQueue.main.async {
                    self.bookImage.image = UIImage(data: data)
                }
            } else {
                DispatchQueue.main.async {
                    self.bookImage.image = UIImage(systemName: "book.fill") // fallback image
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
