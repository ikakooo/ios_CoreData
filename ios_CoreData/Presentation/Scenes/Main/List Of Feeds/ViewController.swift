//
//  ViewController.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 06.11.21.
//

import UIKit

class ViewController: UIViewController,FeedPostTableViewCellUpdaterDelegate {
    @IBOutlet weak var feedsTableView: UITableView!
    var FeedPostsList:[Feed] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        feedsTableView.dataSource = self
        feedsTableView.register(UINib(nibName: "FeedPostTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedPostTableViewCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //print(CoreDataManager.shared.fetchFeedData())
        FeedPostsList = CoreDataManager.shared.fetchFeedData()
        feedsTableView.reloadData()
    }

    func updateTableView() {
        FeedPostsList = CoreDataManager.shared.fetchFeedData()
        print("ikakooooodfjsndf djkfns") //დელეგატიდან აქ იმიტომ არ შემოდის რომ ნილი გვაქვს იქ
        feedsTableView.reloadData() // you do have an outlet of tableView I assume
       
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedPostsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedPostTableViewCell", for: indexPath) as! FeedPostTableViewCell
        
        //print(indexPath.row)
        cell.delegate = self
        cell.configure(with: FeedPostsList[indexPath.row])
        
        return cell
    }

}
