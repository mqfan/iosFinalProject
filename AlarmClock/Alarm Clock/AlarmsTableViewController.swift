//
//  AlarmsTableViewController.swift
//  Alarm Clock
//
//  Created by Rosa Choe on 4/6/17.
//  Copyright © 2017 Rosa Choe. All rights reserved.
//

import UIKit

class AlarmsTableViewController: UITableViewController {
    var timer = Timer()

    @IBOutlet var alarmTable: UITableView!
    @IBAction func newAlarm(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "feedToSetSegue", sender: self)
    }
    
    @IBAction func cancelAlarm(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveAlarm(segue:UIStoryboardSegue) {

        alarmTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTable.delegate = self
        alarmTable.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: #selector(self.checkAlarms(_:)),
                                     userInfo: nil,
                                     repeats: true)
        alarmTable.reloadData()
    }
    
    func checkAlarms(_ timer: Timer) {
        for alarm in alarms {
            if alarm.ring() {
                timer.invalidate()
                self.timer = Timer()
                alarm.active = false
                performSegue(withIdentifier: "gameSegue", sender: alarm)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarm", for: indexPath) as! AlarmTableViewCell
        
        let alarm = alarms[indexPath.row]
        
        cell.updateAlarm = { (switch) -> Void in
            alarm.active = cell.active
        }

        if (!alarm.active) {
            cell.switch.setOn(false, animated: true)
        }
        cell.time.text = alarm.toString()[0]
        cell.ampm.text = alarm.toString()[1]
        cell.name.text = alarm.name
        
        return cell
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
