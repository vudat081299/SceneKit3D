//
//  PickerCell.swift
//  SceneKitTest
//
//  Created by Dat vu on 30/10/2021.
//  Copyright © 2021 Lito Arias. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell {
    
    @IBOutlet weak var constantTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func editingDidEndAction(_ sender: UITextField) {
        print("editingDidEndAction")
        if sender.text == nil || sender.text == "" {
            constantTextField.text = "0.0"
        }
    }
}
