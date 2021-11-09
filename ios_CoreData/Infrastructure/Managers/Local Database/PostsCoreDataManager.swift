//
//  PostsCoreDataManager.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 09.11.21.
//

import Foundation
import CoreData
import UIKit

class PostsCoreDataManager{
    static let shared = PostsCoreDataManager()
    private init(){}
    
    
    func savePost(data:Post){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create a new UserEntity in the
        // NSManagedObjectContext context
        let post = Posts(context: managedContext)
        
        
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
        post.postAuthorName = data.postAuthorName
        post.postAuthorPassword = data.postAuthorPassword
        post.postDescription = data.postDescription
        post.postTitle = data.postTitle
        
        // To save the new entity to the persistent store, call
        // save on the context
        do {
            try managedContext.save()
        }
        catch {
            // Handle Error
        }
    }
    
    
    func readPostsFor(user : String)->[Post]{
        var allSavedFeeds:[Post] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return allSavedFeeds
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Posts")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let postAuthorName =  data.value(forKey: "postAuthorName") as? String
                let postDescription =  data.value(forKey: "postDescription") as? String
                let postTitle =  data.value(forKey: "postTitle") as? String
                
                if postAuthorName != user {
                    allSavedFeeds.append(Post(postAuthorName: postAuthorName, postAuthorPassword: nil, postDescription: postDescription, postTitle: postTitle))}
            }
        } catch {
            print("Fetching data Failed")
        }
        return allSavedFeeds
    }
    
    
    func deleteRecordBy(description:String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Posts")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let postDescription =  data.value(forKey: "postDescription") as? String
                if postDescription == description {
                    managedContext.delete(data)
                    try managedContext.save()
                }
            }
        } catch {
            print("Fetching data Failed")
        }
    }
    
}
