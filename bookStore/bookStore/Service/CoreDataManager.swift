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
}
