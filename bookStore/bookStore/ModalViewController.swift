//
//  ModalViewController.swift
//  bookstore
//
//  Created by 채나연 on 5/8/24.
//

import UIKit
import SnapKit
class ModalViewController: UIViewController {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "세이노의 가르침"
        label.textAlignment = .center
        return label
    }()
    
    lazy var writterLabel: UILabel = {
        let label = UILabel()
        label.text = "세이노"
        label.textAlignment = .center
        return label
    }()
    
    lazy var vTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, writterLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "book")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "14,0000원"
        label.textAlignment = .center
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bookImage, priceLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    // scrollView
    lazy var contentScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = true // bar indicator
        scroll.addSubview(contentLabel)
        return scroll
    }()
    
    lazy var contentLabel: UILabel = {
        let content = UILabel()
        content.text = "인간은 변할 수 있고"
        return content
    }()
    // buttonStackView
    lazy var xButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.backgroundColor = .yellow
     //   button.addTarget(self, action
        return button
    }()
    
    lazy var select: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [xButton, select])
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        
        // Do any additional setup after loading the view.
    }
    
    // layout
    
    private func layout() {
        [vTopStackView, vStackView, contentScroll, hStackView].forEach { section in
            view.addSubview(section)
        }
        
        vTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vTopStackView.snp.top).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        writterLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(vStackView.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.35)
        }
        bookImage.snp.makeConstraints { make in
            make.top.equalTo(vStackView.snp.top).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(vStackView.snp.height).multipliedBy(0.8)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(bookImage.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(vStackView.snp.height).multipliedBy(0.2)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        contentScroll.snp.makeConstraints { make in
            make.top.equalTo(vStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.25)
        }
        hStackView.snp.makeConstraints { make in
            make.top.equalTo(contentScroll.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
        xButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(50)
        }
        select.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(xButton.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(150)
            // 컴포넌트 사이에 스페이싱을 주는 방법 검색 
        }
    
        
        
    }
}





