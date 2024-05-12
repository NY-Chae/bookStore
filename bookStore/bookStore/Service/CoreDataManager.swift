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
    
    // 하드디스크(local)의 Data를 가져오겠다.
    let request: NSFetchRequest<BookInfo> = BookInfo.fetchRequest()
    
    // coredata 저장
    func saveData(model:Document) {
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
        var array = [BookInfo]()
        do {
        array = try context.fetch(request) // coreData -> xCode
        } catch {
      
        }
        return array
    }
    
}
