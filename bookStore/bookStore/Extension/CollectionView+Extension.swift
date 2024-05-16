//
//  CollectionView+Extension.swift
//  bookstore
//
//  Created by 채나연 on 5/16/24.
//

import UIKit
import Kingfisher

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionSetup() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: "RecentBookCollectionViewCell", for: indexPath) as? RecentBookCollectionViewCell else { return UICollectionViewCell() }
        
        let item = recentList[indexPath.row]
        cell.bookImage.kf.setImage(with: URL(string: item.bookImage!))
        cell.titleLabel.text = item.name
        return cell
    }
}





