//
//  RecentBookCollectionViewCell.swift
//  bookstore
//
//  Created by 채나연 on 5/16/24.
//

import UIKit
import SnapKit

class RecentBookCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "세이노의 가르침"
        label.textAlignment = .center
        return label
    }()
    
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "book")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bookImage])
        stackView.axis = .vertical
        return stackView
    }()
    
    //초기화
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        self.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(vStackView.snp.height).multipliedBy(0.2)
        }
        
        bookImage.snp.makeConstraints { make in
            make.height.equalTo(vStackView.snp.height).multipliedBy(0.8)
        }
    }
}
