//
//  SecondViewController.swift
//  bookstore
//
//  Created by 채나연 on 5/7/24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    //변수
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체 삭제", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.text = "담은 책"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            deleteButton,
            bookLabel,
            addButton
        ])
        stackView.axis = .horizontal // horizontal로 바꿀땐 기억해 axis
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var selectedTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .cyan
        table.rowHeight = 40
        //view.register(UITableViewCell.self, forCellWithReuseIdentifier: "")
        
        return table
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        
    }
    
    private func layout() {
//        [deleteButton, bookLabel, addButton].forEach { section in
//            view.addSubview(section)
//        }
        [hStackView, selectedTable].forEach { section in
            view.addSubview(section)
        }
        hStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(40)
            make.height.equalTo(80)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        selectedTable.snp.makeConstraints { make in
            make.top.equalTo(hStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(100)
        }
        
        
//        deleteButton.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(10)
//            make.leading.equalTo(hStackView.snp.leading).offset(5)
//            make.bottom.equalToSuperview().offset(-10)
//            make.width.equalTo(80)
//        }
//        bookLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(10)
//            make.leading.equalTo(deleteButton.snp.trailing).offset(5)
//            make.bottom.equalToSuperview().offset(-10)
//        }
//        addButton.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(10)
//            make.leading.equalTo(bookLabel.snp.trailing).offset(5)
//            make.trailing.equalTo(hStackView.snp.trailing).inset(5)
//            make.bottom.equalToSuperview().offset(-10)
//            make.width.equalTo(50)
//        }
    }
}


