//
//  MyHomeViewController.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/17/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit

class MyHomeViewController: UICollectionViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let bookData = BookData.loadBooks()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.isToolbarHidden = true
        
        let layout = collectionViewLayout as! CollectionViewLayout
        layout.numberOfColumns = 2
        layout.delegate = self as! MosaicLayoutDelegate

    
    }
}

// MARK: UICollectionViewDataSource
extension MyHomeViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookData.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCell
        
        let books = bookData[indexPath.item]
        cell.book = books
        
        return cell
    }
}


