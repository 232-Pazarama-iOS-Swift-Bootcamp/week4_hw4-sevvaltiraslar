//
//  RecentTableViewCell.swift
//  Flickr
//
//  Created by SEVVAL on 17.10.2022.
//

import UIKit


final class RecentTableViewCell: UITableViewCell {
    var userName: String? {
        set {
            userNameLabel.text = newValue
        }
        get {
            userNameLabel.text
        }
    }
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private(set) weak var photoImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = 10
    }

    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    
    @IBAction func likeButtonClicked(_ sender: Any) {
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    
}
