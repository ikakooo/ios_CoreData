//
//  AddFeedViewController.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 06.11.21.
//

import UIKit
import CoreData

class AddFeedViewController: UIViewController {
    @IBOutlet weak private var inputTitle: UITextField!
    @IBOutlet weak private var inputTitleDescription: UITextField!
    @IBOutlet weak var inputAutor: UITextField!
    @IBOutlet weak var inputGenre: UITextField!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //fetchData()
    }
    
    
    @IBAction func onSave(_ sender: UIButton) {
      //  saveData()
        CoreDataManager.shared.saveFeed(data: Feed(title: inputTitle.text, description: inputTitleDescription.text,author: inputAutor.text,genre: inputGenre.text))
        self.navigationController?.popViewController(animated: true)
    }
}
