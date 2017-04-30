//
//  AlarmTableViewCell.swift
//  Alarm Clock
//
//  Created by Rosa Choe on 4/6/17.
//  Copyright © 2017 Rosa Choe. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    var active = true
    var updateAlarm: ((_ switch: UISwitch) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var ampm: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var `switch`: UISwitch!

    @IBAction func toggle(_ sender: UISwitch) {
        self.active = sender.isOn
        updateAlarm?(sender)
    }
}
