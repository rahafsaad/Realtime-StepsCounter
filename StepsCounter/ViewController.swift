//
//  ViewController.swift
//  StepsCounter
//
//  Created by Rahaf on 24/01/2024.
//

import UIKit 
import CoreMotion

class ViewController: UIViewController {
    
    
    let activityManager = CMMotionActivityManager()
    let pedoMeter = CMPedometer ()
    override func viewDidLoad() {
        super.viewDidLoad()
        if CMMotionActivityManager.isActivityAvailable() {
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { (data) in
                DispatchQueue.main.async {
                    if let activity = data {
                        if activity.running == true {
                            print ("Running" ) }
                        else if activity.walking == true {
                            print ("Walking") }
                        else if activity.automotive == true {
                            print ("Automative" ) }
                    }
                }
            }
        }
        
        if CMPedometer.isStepCountingAvailable() {
            self.pedoMeter.startUpdates(from: Date()) { (data, error) in
                if error == nil {
                    if let response = data {
                        DispatchQueue.main.async {
                            print ("Number Of Steps == \(response.numberOfSteps) ")
                            
                        }
                    }
                }
            }
        }
    }
}
