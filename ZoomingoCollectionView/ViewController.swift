//
//  ViewController.swift
//  ZoomingoCollectionView
//
//  Created by Ada 2018 on 25/07/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ZoomingViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var places: [Place] = []
    var selectedIndexPath: IndexPath?
    var selectedPlace: Place?


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let place1 = Place(name: "Dragão do Mar", descrip: "Centro de arte e cultura", image: (UIImage(named: "dragaodomar"))!)
        let place2 = Place(name: "Dragão do Mar", descrip: "Centro de arte e cultura", image: (UIImage(named: "dragaodomar"))!)
        let place3 = Place(name: "Dragão do Mar", descrip: "Centro de arte e cultura", image: (UIImage(named: "dragaodomar"))!)
        let place4 = Place(name: "Dragão do Mar", descrip: "Centro de arte e cultura", image: (UIImage(named: "dragaodomar"))!)
        places.append(place1)
        places.append(place2)
        places.append(place3)
        places.append(place4)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
                let destinationViewController = segue.destination as! PlaceViewController
                destinationViewController.place = selectedPlace
        }
    }
    
    // MARK: - Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let place = places[indexPath.row]
        
        cell.imageView.image = place.image
        cell.name.text = place.name
        cell.descrip.text = place.descrip
        
        return cell
    }

    // MARK: - Delegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        let place = places[indexPath.row]
        selectedPlace = place
        performSegue(withIdentifier: "segue", sender: self)
    }

    // MARK: - Zoom Delegate
    
    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView? {
        if let indexPath = selectedIndexPath {
            let cell = collectionView?.cellForItem(at: indexPath) as! CollectionViewCell
            return cell.imageView
        }
        
        return nil
    }
}
