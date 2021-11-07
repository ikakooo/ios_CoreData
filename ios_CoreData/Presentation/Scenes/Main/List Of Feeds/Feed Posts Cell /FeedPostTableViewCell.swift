//
//  FeedPostTableViewCell.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 06.11.21.
// რა პრბლემა მაქვს დელეგატში მითხარი რა ძმურად ახლა გადაღლილი ტვინით ვერ მივხვდი :დდდდდ
// ფულ რექუესთი მოსულა <3

import UIKit

class FeedPostTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    weak var delegate: FeedPostTableViewCellUpdaterDelegate?
    
    @IBAction func onDeleteClick(_ sender: Any) {
        CoreDataManager.shared.deleteRecords()
       // feedsTableView.reloadData()
        delegate?.updateTableView() // ეს აქ რატომ არის ნილი?
    }
    
    func configure (with:Feed){
        titleLabel.text = with.title
        descriptionLabel.text = with.description
        
    }
}
protocol FeedPostTableViewCellUpdaterDelegate: ViewController { // the name of the protocol you can put any
    func updateTableView()
}
