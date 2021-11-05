//
//  ViewController.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 06.11.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var feedsTableView: UITableView!
    var FeedPostsList:[Feed] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        feedsTableView.dataSource = self
        feedsTableView.register(UINib(nibName: "FeedPostTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedPostTableViewCell")
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 55//FeedPostsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedPostTableViewCell", for: indexPath) as! FeedPostTableViewCell
        
        print(indexPath.row)
        
      ///  cell.configure(with: FeedPostsList[indexPath.row])
        
        return cell
    }

}
