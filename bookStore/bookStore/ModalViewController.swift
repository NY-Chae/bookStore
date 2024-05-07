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
    
    lazy var xButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.backgroundColor = .yellow
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

        layout()
        
        // Do any additional setup after loading the view.
    }
    
// layout
    
    private func layout() {
        [vTopStackView, vStackView, contentScroll, hStackView].forEach { section in
            view.addSubview(section)
        }
        
        vTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vStackView.snp.top).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        writterLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
    }
}


#Preview {
    ModalViewController()
}



// modal view 시도해보기 
