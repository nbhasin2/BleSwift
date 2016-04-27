//
//  NearByScanViewCell.swift
//  BleSwift
//
//  Created by Nishant on 2016-04-26.
//  Copyright © 2016 Epicara. All rights reserved.
//

import Foundation
import UIKit

/// A custom cell for our sudoku collection view
class NearByScanViewCell: UITableViewCell {
    
    /// The label for holding the number in the cell
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.eggWhite()
        valueLabel.textColor = UIColor.emperorGray()
    }
    
    func setCellText(value: String) {

            valueLabel.text = value
    }
}
