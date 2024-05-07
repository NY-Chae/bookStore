//
//  ViewController.swift
//  bookstore
//
//  Created by 채나연 on 5/7/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var searchBar : UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "찾고 싶은 책의 이름을 입력하세요"
        return bar
    }()

    
    // 프로퍼티를 만들고
    private lazy var recentBook: UILabel = {
        let label = UILabel()
        label.text = "최근 본 책"
        label.numberOfLines = 0
        label.font.withSize(44)
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = .init(width: 200, height: 200)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .red
        //view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "")
        
        return view
        
    }()
    
    private lazy var searchResult: UILabel = {
        let label = UILabel()
        label.text = "검색 결과"
        label.numberOfLines = 0
        label.font.withSize(50)
        
        return label
        
    }()
    
    private lazy var resultTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .cyan
        table.rowHeight = 80
        //view.register(UITableViewCell.self, forCellWithReuseIdentifier: "")
        
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layout()
    }

    // layout func - subview를 만든다
    
    private func layout() {
        [searchBar, recentBook, collection, searchResult, resultTable].forEach { section in
            view.addSubview(section)
            
        }
        
//        view.addSubview(searchBar)
//        view.addSubview(recentBook)
//        view.addSubview(collection)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
       
        recentBook.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).inset(30)
        }
        
        collection.snp.makeConstraints { make in
            make.top.equalTo(recentBook.snp.bottom).offset(30)
            make.height.equalTo(200)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
        searchResult.snp.makeConstraints { make in
            make.top.equalTo(collection.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        resultTable.snp.makeConstraints { make in
            make.top.equalTo(searchResult.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(120)
        }
    }
}



