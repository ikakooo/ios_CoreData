//
//  AddPostViewController.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 09.11.21.
//

import UIKit

class AddPostViewController: UIViewController {
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var titleDescriptionLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(_ sender: Any) {
        let autor = UDManager.getAutorizedUserName()
        
        PostsCoreDataManager.shared.savePost(data: Post(postAuthorName: autor, postAuthorPassword: nil, postDescription: titleDescriptionLabel.text, postTitle: titleLabel.text))
        
        self.navigationController?.popViewController(animated: true)
        
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
