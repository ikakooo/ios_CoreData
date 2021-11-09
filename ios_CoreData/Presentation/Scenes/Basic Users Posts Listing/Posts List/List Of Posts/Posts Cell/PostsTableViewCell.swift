//
//  PostsTableViewCell.swift
//  ios_CoreData
//
//  Created by MacBook Pro on 10.11.21.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var desqriptionLabel: UILabel!
    
    weak var delegate: PostTableViewCellUpdaterDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onDelete(_ sender: Any) {
        PostsCoreDataManager.shared.deleteRecordBy(description: desqriptionLabel.text ?? "")
        
        delegate?.updateTableView()
    }
    
    func configure (with:Post){
        titleLabel.text = with.postTitle
        desqriptionLabel.text = with.postDescription
        
    }
}

protocol PostTableViewCellUpdaterDelegate: PostsListViewController { // the name of the protocol you can put any
    func updateTableView()
}
