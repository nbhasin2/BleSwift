//
//  OverlayView.swift
//  Snackbar
//
//  Created by Nishant on 2016-04-25.
//  Copyright © 2016 Epicara. All rights reserved.
//

import Foundation
import UIKit

class OverlayView: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    convenience init()
    {
        self.init()
        self.loadViewFromNib()
    }
    
    /*
     Initializer method for loading the view from nib.
     */
    private func loadViewFromNib()
    {
        let nib = UINib(nibName: "OverlayView", bundle: NSBundle(forClass: self.dynamicType))
        if let view = nib.instantiateWithOwner(self, options: nil)[0] as? UIView
        {
            view.frame = self.bounds
            view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.addSubview(view)
        }
    }

}