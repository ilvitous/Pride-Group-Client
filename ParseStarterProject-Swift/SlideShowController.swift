//
//  SlideShowController.swift
//  PhotoSlideShow-Swift
//
//  Created by VillyG on 4/21/15.
//  Copyright (c) 2015 VillyG. All rights reserved.
//

import UIKit





class SlideShowController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    
    
    // ***********************************************
    // MARK: Custom variables
    // ***********************************************
    
    
    
    var images: [UIImage] = []
    
    
    var startIndex : Int!

    
    
    // ***********************************************
    // MARK: UIView
    // ***********************************************
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let paths = NSBundle.mainBundle().pathsForResourcesOfType("jpg", inDirectory: "full")
        for path in paths  {
            let image = UIImage(contentsOfFile: path)
            images.append(image!)
        }
        
        
        let myButton = UIButton()
        myButton.frame = CGRectMake(self.view.frame.size.width-50, 20, 30, 30)
        myButton.addTarget(self, action: "back:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let image = UIImage(named: "close.png")
        
        myButton.setImage(image, forState: .Normal)
        myButton.alpha = 0.7
        self.view.addSubview(myButton)

        
        
        
        // Set the data source to itself
        self.dataSource = self
        
        // Create the first screen
        if let startingViewController = self.getItemController(startIndex) {
            
            setViewControllers([startingViewController], direction: .Forward, animated: false, completion: nil)
            
        }
        
    }
    
    
    func back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    // ***********************************************
    // MARK: UIPageViewController
    // ***********************************************
    
    
    
    private func getItemController(itemIndex: Int) -> UIViewController? {
        
        if itemIndex < self.images.count {
            
            let result:SlideController = self.storyboard!.instantiateViewControllerWithIdentifier("slideController") as! SlideController

            result.itemIndex = itemIndex

            result.image = self.images[itemIndex]
            
            return result
        }
        
        return nil
    }
    
    
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            
            let itemController = viewController as! SlideController
            
            if itemController.itemIndex+1 < self.images.count {
                return getItemController(itemController.itemIndex+1)
            }
            
            return nil
            
    }
    
    
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            
            
            let itemController = viewController as! SlideController
            
            if itemController.itemIndex > 0 {
                return getItemController(itemController.itemIndex-1)
            }
            
            return nil
            
    }
    
    
}

