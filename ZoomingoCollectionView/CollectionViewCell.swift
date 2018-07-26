//
//  CollectionViewCell.swift
//  ZoomingoCollectionView
//
//  Created by Ada 2018 on 25/07/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descrip: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        descrip.sizeToFit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.descrip.numberOfLines = 2
    }
}
