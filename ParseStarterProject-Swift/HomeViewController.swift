//
//  HomeViewController.swift
//  PrideGroup
//
//  Created by Andrea Vitale on 10/29/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit






class HomeViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var galleryHome: UIScrollView!
    
    let containerView = UIView()
    var indexGallery = 0
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.galleryHome.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadGallery()
       
    }
    
    
    func loadGallery(){
        
        let paths = NSBundle.mainBundle().pathsForResourcesOfType("jpg", inDirectory: "thumb")
        var rightMargin : CGFloat = 0
        containerView.frame = CGRectMake(0, 0, 2000, self.galleryHome.frame.size.height)
        
        //carico le imamgini
        
        
       
        
        for (index, (path)) in paths.enumerate() {
            let image = UIImage(contentsOfFile: path)
            let myButton = UIButton()
            myButton.frame = CGRectMake(rightMargin, 0, self.galleryHome.frame.size.height, self.galleryHome.frame.size.height)
            if (image != nil) {
                myButton.setImage(image, forState: .Normal)
            }
            myButton.layer.cornerRadius = 5.0
            myButton.layer.masksToBounds = true;
            myButton.addTarget(self, action: "openGallery:", forControlEvents: UIControlEvents.TouchUpInside)
            myButton.tag = index 
            containerView.addSubview(myButton)
            rightMargin = rightMargin + self.galleryHome.frame.size.height+15
        }
        
        
        //setto la view che le contiene
        containerView.frame = CGRectMake(0, 0, rightMargin, self.galleryHome.frame.size.height)
        //setto la content size
        self.galleryHome.contentSize = CGSizeMake(containerView.frame.size.width, self.galleryHome.frame.size.height)
        self.galleryHome.addSubview(containerView)
        
    }
    
    
    
    
    func openGallery(sender: UIButton!){
        //prendo l'index del bottone
        indexGallery = sender.tag
        self.performSegueWithIdentifier("galleryOpen", sender: self)
    
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "galleryOpen"{
            let destinationVC = segue.destinationViewController as! SlideShowController
            
            destinationVC.startIndex = indexGallery
            
        }
        
    }
   

}
