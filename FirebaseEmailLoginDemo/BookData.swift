//
//  BookData.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/17/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit

class BookData {
    
    var titleOfBook : String?
    var authorOfBook : String?
    
    init(titleOfBook:String, authorOfBook:String) {
        self.titleOfBook = titleOfBook
        self.authorOfBook = authorOfBook
    }
    
    convenience init(dictionary:NSDictionary) {
        let titleOfBook = dictionary["titleOfBook"] as? String
        let authorOfBook = dictionary["authorOfBook"] as? String
        
        self.init(titleOfBook: titleOfBook!, authorOfBook: authorOfBook!)
    }

class func loadBooks() -> [BookData] {
    var book = [BookData]()
    if let path = Bundle.main.path(forResource: "BookData", ofType: "plist") {
        if let dictArray = NSArray(contentsOfFile: path) {
            for item in dictArray {
                let character = BookData(dictionary: item as! NSDictionary)
                book.append(character)
            }
        }
    }
    return book
    }
}
