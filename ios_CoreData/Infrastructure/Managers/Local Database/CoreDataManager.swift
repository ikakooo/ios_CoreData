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
        
        
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.string(from: currentDateTime)
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime) // October 8, 2016 at 10:48:53 PM
        
        // Assign values to the entity's properties
        feed.title = data.title
        feed.titleDescription = data.description
        feed.date = formatter.string(from: currentDateTime)
        feed.author = data.author
        feed.genre = data.genre
        
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
    
    
    func deleteRecordBy(description:String) {
        
        //delete all record of Feeds
        // let delegate = UIApplication.shared.delegate as! AppDelegate
        //        let context = delegate.persistentContainer.viewContext
        //
        //        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Feeds")
        //        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        //
        //        do {
        //            try context.execute(deleteRequest)
        //            try context.save()
        //        } catch {
        //            print ("There was an error")
        //        }
        //    }
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Feeds")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                guard  let dataTitleDescription =  data.value(forKey: "titleDescription") as? String else {
                    return
                }
                if dataTitleDescription == description {
                    managedContext.delete(data)
                    try managedContext.save()
                }
            }
        } catch {
            print("Fetching data Failed")
        }
    }
}
