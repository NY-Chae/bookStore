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
                        self.answerList = yeon.documents // api 호출이 성공했을 경우 answerList에 데이터를 담는다.
                        self.resultTable.reloadData() // reload를 해서 TableView에 노출
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
