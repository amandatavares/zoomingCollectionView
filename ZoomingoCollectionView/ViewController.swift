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
        
        let place1 = Place(name: "Dragão do Mar", descrip: "Centro de arte e cultura na Avenida Beira Mar", image: (UIImage(named: "dragaodomar"))!)
        let place2 = Place(name: "Beira Mar", descrip: "Estátua de Iracema próximo ao aterro na beira mar de Fortaleza", image: (UIImage(named: "bm"))!)
        let place3 = Place(name: "Ponte dos Ingleses", descrip: "Ponte contruída por ingleses, parada obrigatoria em Fortaleza", image: (UIImage(named: "bm2"))!)
        let place4 = Place(name: "Teatro José de Alencar", descrip: "Teatro mais antigo em Fortaleza, local de apresentações de teatro, dança e música", image: (UIImage(named: "teatro"))!)
       
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
        
        // Creating the places
        cell.imageView.image = place.image
        cell.name.text = place.name
        cell.descrip.text = place.descrip
        
        // Customizing cards
        cell.contentView.layer.backgroundColor = UIColor.white.cgColor
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

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
