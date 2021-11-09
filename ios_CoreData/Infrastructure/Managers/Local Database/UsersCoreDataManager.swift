//
//  UsersCoreDataManager.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 10.11.21.
//

import Foundation
import CoreData
import UIKit

class UsersCoreDataManager {
    static let shared = UsersCoreDataManager()
    private init(){}
    
    
    
    func saveUser(info:User){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create a new UserEntity in the
        // NSManagedObjectContext context
        let user = Users(context: managedContext)
        
        
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
        user.username = info.username
        user.password = info.password
        
        
        // To save the new entity to the persistent store, call
        // save on the context
        do {
            try managedContext.save()
        }
        catch {
            // Handle Error
        }
    }
    
    func tryFetch(user:User)->Bool{
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let username = data.value(forKey: "username") as! String
                let password = data.value(forKey: "password") as! String
                if (username == user.username && password == user.password){return true}
            }
        } catch {
            print("Fetching data Failed")
        }
        return false
    }
    
}
