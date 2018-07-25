//
//  PlaceViewController.swift
//  ZoomingoCollectionView
//
//  Created by Ada 2018 on 25/07/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, ZoomingViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descrip: UILabel!
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = place?.image
        name.text = place?.name
        descrip.text = place?.descrip
        
        // Do any additional setup after loading the view.
    }

    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView? {
        return imageView
    }
}
