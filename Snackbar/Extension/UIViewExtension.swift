//
//  UIViewExtension.swift
//  Snackbar
//
//  Created by Nishant on 2016-04-25.
//  Copyright © 2016 Epicara. All rights reserved.
//
//  https://www.andrewcbancroft.com/2014/07/27/fade-in-out-animations-as-class-extensions-with-swift/

import Foundation
import UIKit

extension UIView {
    
    func fadeIn() {
        // Move our fade out code from earlier
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
            }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: nil)
    }
}