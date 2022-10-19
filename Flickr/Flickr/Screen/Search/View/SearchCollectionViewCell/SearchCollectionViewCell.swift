//
//  SearchCollectionViewCell.swift
//  Flickr
//
//  Created by SEVVAL on 17.10.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    var title: String? {
        set {
            titleLabel.text = newValue
        }
        get {
            titleLabel.text
        }
    }
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
