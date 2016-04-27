//
//  NibLoadingView.swift
//  Snackbar
//
//  Created by Nishant on 2016-04-25.
//  Copyright © 2016 Epicara. All rights reserved.
//
//  http://stackoverflow.com/questions/25513271/how-to-initialise-a-uiview-class-with-a-xib-file-in-swift-ios

import Foundation
import UIKit

// Usage: Subclass your UIView from NibLoadView to automatically load a xib with the same name as your class

@IBDesignable
class NibLoadingView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        
        backgroundColor = .clearColor()
        
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: String(self.dynamicType), bundle: bundle)
        let nibView = nib.instantiateWithOwner(self, options: nil).first as! UIView
        
        return nibView
    }
    
}