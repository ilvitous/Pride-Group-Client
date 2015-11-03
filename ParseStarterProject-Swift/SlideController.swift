//
//  SlideController.swift
//  PhotoSlideShow-Swift
//
//  Created by VillyG on 4/21/15.
//  Copyright (c) 2015 VillyG. All rights reserved.
//

import UIKit


class SlideController: UIViewController {
    
    
    var itemIndex: Int = -1
    
    var image: UIImage!
    
    
    @IBOutlet weak var button: UIButton!
    
    
    // ***********************************************
    // MARK: UIView
    // ***********************************************
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(__FUNCTION__)
        
        let scrollView: ImageScrollView = ImageScrollView()
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.backgroundColor = UIColor.blackColor()
        self.view = scrollView
        scrollView.displayImage(image)
                   
    }
    
    
  
 

    
}
