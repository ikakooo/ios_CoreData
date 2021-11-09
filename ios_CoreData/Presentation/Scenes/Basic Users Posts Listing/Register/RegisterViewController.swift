//
//  RegisterViewController.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 09.11.21.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passWordLabel: UITextField!
    @IBOutlet weak var retryPasswordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
//        PostsCoreDataManager.shared.savePost(data: Post(postAuthorName: userNameLabel.text, postAuthorPassword: passWordLabel.text, postDescription: nil, postTitle: nil))
    
    
        let userName = userNameLabel.text ?? ""
        let passWord = passWordLabel.text ?? ""
        if userName.count > 8 && passWord.count > 8 {
            UDManager.saveUserAndMarkUserAsLoggedIn(user: User(username: userName, password: passWord))
            UsersCoreDataManager.shared.saveUser(info: User(username: userName, password: passWord))
            
            
            navigationController?.popToRootViewController( animated: false )
            let sb = UIStoryboard(name: "PostsListNavigationController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "PostsListNavigationController")
            
            navigationController?.viewControllers.removeAll()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }else{
            print("Username and password must be more than 8 character")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
