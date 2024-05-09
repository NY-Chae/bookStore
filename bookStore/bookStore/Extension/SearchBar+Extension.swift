//
//  SearchBar+Extension.swift
//  bookstore
//
//  Created by 채나연 on 5/8/24.
//

import UIKit

extension ViewController: UISearchBarDelegate {
    
    func setup() {
        searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
    
    
    
}




