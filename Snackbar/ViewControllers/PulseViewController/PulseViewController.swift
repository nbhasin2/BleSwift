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
    
    @IBOutlet weak var heartImageView: UIImageView!
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    private let defaultCellHeight: CGFloat = 63.0
    
    // MARK: - Initialization
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupView()
        self.edgesForExtendedLayout = UIRectEdge.None
        
    }
    
    // UI related methods
    
    func setupView()
    {
        heartImageView.transform = CGAffineTransformMakeScale(0.8, 0.8)
        pulseHeartImage()
    }
    
    func pulseHeartImage()
    {
        UIView.animateWithDuration(0.8,
                                   delay: 0,
                                   usingSpringWithDamping: 1.0,
                                   initialSpringVelocity: 1.0,
                                   options: [UIViewAnimationOptions.AllowUserInteraction , UIViewAnimationOptions.Repeat , UIViewAnimationOptions.Autoreverse],
                                   animations: {
                                    self.heartImageView.transform = CGAffineTransformIdentity
            }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}