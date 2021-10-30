//
//  SelectCell.swift
//  SceneKitTest
//
//  Created by Dat vu on 30/10/2021.
//  Copyright © 2021 Lito Arias. All rights reserved.
//

import UIKit

class SelectCell: UITableViewCell {

    @IBOutlet weak var side: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperChangedValueAction(_ sender: UIStepper) {
        side.text = Int(sender.value).description
    }
}
