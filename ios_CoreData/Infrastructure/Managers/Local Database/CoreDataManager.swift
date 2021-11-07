//
//  CoreDataManager.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 07.11.21.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    static let shared = CoreDataManager()
    private init(){}
    
    
    
    
    
    func saveFeed(data:Feed){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create a new UserEntity in the
        // NSManagedObjectContext context
        let feed = Feeds(context: managedContext)
        
        
        // Assign values to the entity's properties
        feed.title = data.title
        feed.titleDescription = data.description
        
        // To save the new entity to the persistent store, call
        // save on the context
        do {
            try managedContext.save()
        }
        catch {
            // Handle Error
        }
    }
    
    
    
    func fetchFeedData()->[Feed]{
        var allSavedFeeds:[Feed] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return allSavedFeeds
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Feeds")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let title = data.value(forKey: "title") as! String
                let titleDescription = data.value(forKey: "titleDescription") as! String
               // print("User Name is : "+title+" and Age is : "+titleDescription)
                allSavedFeeds.append(Feed(title: title, description: titleDescription))
            }
        } catch {
            print("Fetching data Failed")
        }
        return allSavedFeeds
    }
    
    
    func deleteRecords() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext

        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Feeds")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }
    
    
}
