//
//  SignInViewController.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 09.11.21.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let userName = usernameLabel.text ?? ""
        let passWord = passwordLabel.text ?? ""
        
        if UsersCoreDataManager.shared.tryFetch(user: User(username: userName, password: passWord)){
            UDManager.saveUserAndMarkUserAsLoggedIn(user: User(username: userName, password: passWord))
            
            navigationController?.popToRootViewController( animated: false )
            let sb = UIStoryboard(name: "PostsListNavigationController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "PostsListNavigationController")
            
            navigationController?.viewControllers.removeAll()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }else{
            print("incorrect Username and password")
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
