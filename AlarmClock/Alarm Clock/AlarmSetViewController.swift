//
//  AlarmSetViewController.swift
//  Alarm Clock
//
//  Created by Rosa Choe on 4/6/17.
//  Copyright © 2017 Rosa Choe. All rights reserved.
//

import UIKit

class AlarmSetViewController: UIViewController {
    
    var alarm: Alarm?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveAlarmSegue" {
            alarms.append(Alarm(newName: alarmName.text!, date: time.date))
        }
    }
    
    @IBOutlet weak var time: UIDatePicker!
    @IBOutlet weak var alarmName: UITextField!
}
