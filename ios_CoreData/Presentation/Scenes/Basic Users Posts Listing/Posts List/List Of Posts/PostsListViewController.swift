//
//  PostsListViewController.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 09.11.21.
//

import UIKit

class PostsListViewController: UIViewController,PostTableViewCellUpdaterDelegate {
    
    @IBOutlet weak var postsTableView: UITableView!
    var postsList:[Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.dataSource = self
        postsTableView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //print(CoreDataManager.shared.fetchFeedData())
        let autor = UDManager.getAutorizedUserName()
        postsList = PostsCoreDataManager.shared.readPostsFor(user: autor)
        postsTableView.reloadData()
    }
    
    
    @IBAction func onLogOut(_ sender: Any) {
        UDManager.markUserAsLoggedOut()
        navigationController?.popToRootViewController( animated: false )
        let sb = UIStoryboard(name: "BasicUsersPostsListingNavigationController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BasicUsersPostsListingNavigationController")
        
        navigationController?.viewControllers.removeAll()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func updateTableView() {
        let autor = UDManager.getAutorizedUserName()
        postsList = PostsCoreDataManager.shared.readPostsFor(user: autor)
        print("ikakooooodfjsndf djkfns") //დელეგატიდან აქ იმიტომ არ შემოდის რომ ნილი გვაქვს იქ
        postsTableView.reloadData() // you do have an outlet of tableView I assume
       
    }

}
extension PostsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell
        
        //print(indexPath.row)
        cell.delegate = self
        cell.configure(with: postsList[indexPath.row])
        
        return cell
    }

}
