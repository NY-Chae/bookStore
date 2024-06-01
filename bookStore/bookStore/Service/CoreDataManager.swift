//
//  CoreDataManager.swift
//  bookstore
//
//  Created by 채나연 on 5/10/24.
//
import CoreData
import UIKit

class CoreDataManager {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // ModalVC 연결 데이터
    func saveData(model:Document) {
        // API Data를 가져오겠다.
        let newItem = BookInfo(context: context)
        newItem.title = model.title
        newItem.authors = model.authors.joined()
        newItem.price = Int64(model.price)
        newItem.contents = model.contents
        newItem.thumbnail = model.thumbnail
        do {
            try context.save()
        } catch {
        }
    }
    
    func loadData() -> [BookInfo] {
        // 하드디스크(local)의 Data를 가져오겠다.
        let request: NSFetchRequest<BookInfo> = BookInfo.fetchRequest()
        var array = [BookInfo]()
        do {
            array = try context.fetch(request) // coreData -> xCode
        } catch {
        }
        return array
    }
    
    func recentSaveData(model:Document) {
        
        let newItem = Recent(context: context)
        newItem.name = model.title
        newItem.bookImage = model.thumbnail
        newItem.contents = model.contents
        newItem.authors = model.authors.joined()
        newItem.price = Int64(model.price)
        do {
            try context.save()
        } catch {
        }
    }
    
    func recentLoadData() -> [Recent] {
        
        let request: NSFetchRequest<Recent> = Recent.fetchRequest()
        var array = [Recent]()
        do {
            array = try context.fetch(request) // coreData -> xCode
        } catch {
            
        }
        return array
    }
}
