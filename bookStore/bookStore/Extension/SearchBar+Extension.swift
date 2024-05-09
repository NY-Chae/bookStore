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
        if let text = searchBar.text {
            networkManager.fetchRequest(title: text) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let yeon): // Model: Document
    //                    print(yeon.documents)
                        self.answerList = yeon.documents // 데이터 담기
                        self.resultTable.reloadData()
                      //  print(self.answerList)
                    case.failure(let error):
                        print(error)
                    }
                }
            }
        }
        // print(searchBar.text)
    }
}
