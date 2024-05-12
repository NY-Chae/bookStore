//
//  SelectedListTableViewCell.swift
//  bookstore
//
//  Created by 채나연 on 5/12/24.
//

import UIKit
import SnapKit

class SelectedListTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "세이노의 가르침"
        return title
    }()
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.text = "세이노"
        return author
    }()
    
    lazy var priceLabel: UILabel = {
        let price = UILabel()
        price.text = "18,000원"
        return price
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // 초기화를 안하면 사용할 수 없다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 재사용을 위한 준비 과정 prepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        authorLabel.text = nil
        priceLabel.text = nil
    }
    
    private func layout() {
        [titleLabel, authorLabel, priceLabel].forEach { section in
            self.addSubview(section)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(20)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(titleLabel.snp.trailing).offset(25)
            make.bottom.equalToSuperview().inset(20)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(authorLabel.snp.trailing).offset(25)
            make.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
