//
//  BookCell.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/17/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell  {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    var book: BookData? {
        didSet {
            if let theBook = book {
//                bookImage.image = UIImage(named: theBook.bookImage)
                bookTitle.text = theBook.titleOfBook
                bookAuthor.text = theBook.authorOfBook
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 12.0
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor(red: 0.5, green: 0.47, blue: 0.25, alpha: 1.0).cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImage.image = nil
        bookTitle.text = ""
        bookAuthor.text = ""
    }
}
