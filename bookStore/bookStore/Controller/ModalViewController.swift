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
        stackView.spacing = 3
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
        button.backgroundColor = .black
        button.setTitleColor(.yellow, for: .normal)
        button.addTarget(self, action: #selector(returnMain), for: .touchUpInside)
        return button
    }()
    @objc func returnMain() {
        self.dismiss(animated: true)
    }
        
    lazy var select: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(returnToSelected), for: .touchUpInside)
        return button
    }()
    @objc func returnToSelected() {
        coreDataManager.saveData(model: document)
        print("담기완료")
        self.dismiss(animated: true)
    }
    
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [xButton, select])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    let coreDataManager = CoreDataManager() // <- 인스턴스화
    var document = Document(authors: [], contents: "", price: 0, thumbnail: "", title: "") // 초기화
    
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
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(view.snp.height).multipliedBy(0.35)
        }
        bookImage.snp.makeConstraints { make in
            make.height.equalTo(vStackView.snp.height).multipliedBy(0.8)
        }
        priceLabel.snp.makeConstraints { make in
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
            make.horizontalEdges.equalToSuperview().inset(20)  // 양끝 패딩 한번에 주기
            make.bottom.equalToSuperview().inset(50)
           
        }
        xButton.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
            make.width.equalTo(60)
        }
        select.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
            make.width.equalTo(UIScreen.main.bounds.width - 110) // 전체 너비에서 계산한 값 빼기
            // 컴포넌트 사이에 스페이싱을 주는 방법 검색
        }
    
        
        
    }
}





