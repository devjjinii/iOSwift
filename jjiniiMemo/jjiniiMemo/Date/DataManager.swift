//
//  DataManager.swift
//  jjiniiMemo
//
//  Created by dev jin on 2022/01/03.
//

import Foundation
import CoreData

class DataManager {
    
    //싱클톤
    static let shared = DataManager()
    private init() {
        
    }
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    //Memo 읽어오는
    var memoList = [Memo]()
    // DB에서 데이터 읽어오는 fetch
    func fetchMemo() {
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        do {
            memoList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
        
    }
    
    func addNewMemo(_ memo: String?) {
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.insertDate = Date()
        
        memoList.insert(newMemo, at: 0) //배열 앞부분에 추가
        
        saveContext()
    }
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "jjiniiMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
