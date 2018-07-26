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
    @IBOutlet var card: UIView!
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Defining each field
        imageView.image = place?.image
        name.text = place?.name
        descrip.text = place?.descrip
        
        // For fade in / out animation
        self.name.alpha = 0
        self.descrip.alpha = 0
        self.card.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.1, animations: {
            self.name.alpha = 1.0
            self.descrip.alpha = 1.0
            self.card.alpha = 1.0
        })
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.name.alpha = 0.0
            self.descrip.alpha = 0.0
            self.card.alpha = 0.0
        })
    }
  

    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView? {
        return imageView
    }
}
