//
//  ViewController.swift
//  bookstore
//
//  Created by 채나연 on 5/7/24.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "찾고 싶은 책의 이름을 입력하세요"
        return bar
    }()
    
    private lazy var recentBook: UILabel = {
        let label = UILabel()
        label.text = "최근 본 책"
        label.numberOfLines = 0
        label.font.withSize(44)
        return label
    }()
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = .init(width: 200, height: 200)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .systemBackground
        view.register(RecentBookCollectionViewCell.self, forCellWithReuseIdentifier: "RecentBookCollectionViewCell")
        return view
    }()
    
    private lazy var searchResult: UILabel = {
        let label = UILabel()
        label.text = "검색 결과"
        label.numberOfLines = 0
        label.font.withSize(50)
        return label
    }()
    
    lazy var resultTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.rowHeight = 80
        table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: "SearchResultTableViewCell") // 셀 등록 완
        return table
    }()
    
    // network manager 인스턴스화 (network manager에 접근(access)하기 위해 필요. 보통은 singleton(메모리 효율 good)으로 많이 하지만 이번엔 패스. 접근성 이슈 x
    let networkManager = NetworkManager()  // 인스턴스화 완료
    let coreDataManager = CoreDataManager()
    var answerList = [Document]()  // 데이터를 담을 배열 생성
    var recentList = [Recent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layout()
        setup()
        tableSetup()
        collectionSetup()
        recentList = coreDataManager.recentLoadData()
        self.collection.reloadData()
        //        networkManager.fetchRequest { result in // success와 failure에 대한 결과값을 받는다
        //            switch result {
        //            case.success(let yeon):
        //                print(yeon)
        //            case.failure(let error):
        //                print(error)
        //            }
        //        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.resultTable.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        resultTable.reloadData()
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



