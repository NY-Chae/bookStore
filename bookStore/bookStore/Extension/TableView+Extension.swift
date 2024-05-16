//
//  TableView+Extension.swift
//  bookstore
//
//  Created by 채나연 on 5/9/24.
//

import UIKit
import Kingfisher

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableSetup() {
        resultTable.delegate = self
        resultTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = resultTable.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        
        // answerList 주입 대작전
        let item = answerList[indexPath.row]
        print(item)
        // 주입 시작
        cell.titleLabel.text = item.title
        cell.authorLabel.text = item.authors.joined() // joined : 배열을 한번에 보여주겠다. 즉, 배열의 전체 값을 문자열로 변환
        cell.priceLabel.text = item.price.stringValue // 형 변환의 stylish한 버전
        return cell
    }
    // 클릭 시 이벤트 발생
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // modalVC의 값을 보내면서 modalVC 출력(self.present)
        let modalVC = ModalViewController()
        let item = answerList[indexPath.row]
        modalVC.titleLabel.text = item.title
        modalVC.writterLabel.text = item.authors.joined()
        modalVC.bookImage.kf.setImage(with: URL(string: item.thumbnail))
        modalVC.priceLabel.text = item.price.stringValue
        modalVC.contentLabel.text = item.contents
        modalVC.document = item
        
        // Recent entity에 데이터 저장
        coreDataManager.recentSaveData(model: item)
        modalVC.modalPresentationStyle = .fullScreen
        
        self.present(modalVC,animated: true)
    }
}


extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableSetup() {
        selectedTable.delegate = self
        selectedTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = selectedTable.dequeueReusableCell(withIdentifier: "SelectedListTableViewCell", for: indexPath) as? SelectedListTableViewCell else { return UITableViewCell() }
        let item = selectedInfo[indexPath.row]
        cell.titleLabel.text = item.title
        cell.authorLabel.text = item.authors
        cell.priceLabel.text = item.price.stringValue
        return cell
    }
    
}

