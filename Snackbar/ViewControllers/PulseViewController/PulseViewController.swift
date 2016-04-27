//
//  PulseViewController.swift
//  Snackbar
//
//  Created by Nishant on 2016-04-27.
//  Copyright © 2016 Epicara. All rights reserved.
//

import Foundation
import UIKit

class PulseViewController : UIViewController
{
    // MARK: - View Outlets

    @IBOutlet weak var heartImageButton: UIButton!
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    private let controllerTitle = "Heart Beat Monitor"
    private let defaultCellHeight: CGFloat = 63.0
    
    // MARK: - Initialization
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
        self.edgesForExtendedLayout = UIRectEdge.None
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        pulseHeartImage()
    }
    
    // UI related methods
    
    func setupView()
    {
        self.title = controllerTitle
    }
    
    func pulseHeartImage()
    {
        heartImageButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        heartImageButton.transform = CGAffineTransformMakeScale(0.8, 0.8)
        
        // More info
        // http://evgenii.com/blog/spring-button-animation-with-swift/
        
        UIView.animateWithDuration(0.8,
                                   delay: 0,
                                   usingSpringWithDamping: 1.0,
                                   initialSpringVelocity: 1.0,
                                   options: [UIViewAnimationOptions.AllowUserInteraction , UIViewAnimationOptions.Repeat , UIViewAnimationOptions.Autoreverse],
                                   animations: {
                                    self.heartImageButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        
    }
    
    // MARK: - Action
    
    @IBAction func searchDeviceAction(sender: UIButton)
    {
        let nearbyScanViewController =  NearbyScanViewController(nibName: "NearbyScanViewController", bundle: nil)
        self.navigationController?.pushViewController(nearbyScanViewController, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}