//
//  FavBooksDataModel.swift
//  Lab-FavoriteBooks
//
//  Created by Eknoor on 25/08/25.
//

import Foundation

struct Book{
    var imageURL: URL
    var title: String
    var author: String
    var genre: String
    var length: String
}


var favBooks: [Book] = [
    Book(imageURL: URL(string: "https://picsum.photos/200?random=1")!,
         title: "The Swift Programming Language",
         author: "Apple Inc.",
         genre: "Programming",
         length: "500 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=2")!,
         title: "To Kill a Mockingbird",
         author: "Harper Lee",
         genre: "Classic Fiction",
         length: "336 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=3")!,
         title: "1984",
         author: "George Orwell",
         genre: "Dystopian",
         length: "328 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=4")!,
         title: "The Pragmatic Programmer",
         author: "Andrew Hunt & David Thomas",
         genre: "Software Engineering",
         length: "352 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=5")!,
         title: "Sapiens: A Brief History of Humankind",
         author: "Yuval Noah Harari",
         genre: "History",
         length: "498 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=6")!,
         title: "Clean Code",
         author: "Robert C. Martin",
         genre: "Software Engineering",
         length: "464 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=7")!,
         title: "The Great Gatsby",
         author: "F. Scott Fitzgerald",
         genre: "Classic Fiction",
         length: "180 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=8")!,
         title: "Atomic Habits",
         author: "James Clear",
         genre: "Self-help",
         length: "320 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=9")!,
         title: "The Lord of the Rings",
         author: "J.R.R. Tolkien",
         genre: "Fantasy",
         length: "1178 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=10")!,
         title: "Pride and Prejudice",
         author: "Jane Austen",
         genre: "Romance",
         length: "279 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=11")!,
         title: "The Alchemist",
         author: "Paulo Coelho",
         genre: "Philosophical Fiction",
         length: "208 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=12")!,
         title: "Harry Potter and the Sorcerer’s Stone",
         author: "J.K. Rowling",
         genre: "Fantasy",
         length: "309 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=13")!,
         title: "Educated",
         author: "Tara Westover",
         genre: "Memoir",
         length: "334 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=14")!,
         title: "The Catcher in the Rye",
         author: "J.D. Salinger",
         genre: "Classic Fiction",
         length: "214 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=15")!,
         title: "The Lean Startup",
         author: "Eric Ries",
         genre: "Business",
         length: "336 pages"),
    
    Book(imageURL: URL(string: "https://picsum.photos/200?random=16")!,
         title: "Thinking, Fast and Slow",
         author: "Daniel Kahneman",
         genre: "Psychology",
         length: "499 pages")
]
