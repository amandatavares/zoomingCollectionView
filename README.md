# zoomingCollectionView
Test of zooming transition with Collection View

# Project Title

Image zooming transition with Collection View and Navigation Controller

### Installing

If you want to test in your local machine, just clone, modify the Project info and run.
If you want to test in your code:
 - copy and paste the ZoomTransitioningDelegate to your project
 - implements the Delegate in your initial ViewController as shown:
 
 ```
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
 ```
 - implements the Delegate in your final ViewController like this:
 
 ```
 func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView? {
        return imageView
    }
 ```
 - On storyboard, select the Navigation Controller and an Object. After, define the class of this as ZoomTransitioningDelegate


## Built With

* [Swift 4]
* [XCode 9]

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/amandatavares/b8e5f38e21b393f3e9d84d9f1d75584e) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

Based on Duc Tran lesson (https://www.ductran.co/p/cm2)
* **Amanda Tavares** - [AmandaTavares](https://github.com/amandatavares)
* **Victor Guimarães** - [VitorGuimaraes](https://github.com/VitorGuimaraes)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License
