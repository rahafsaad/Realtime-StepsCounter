//
//  MotionStruct.swift
//  StepsCounter
//
//  Created by Rahaf on 24/01/2024.
//

import SwiftUI
import CoreMotion
import Combine

class MotionManager: ObservableObject {
    @Published var activity: CMMotionActivity?
    @Published var numberOfSteps: NSNumber?

    private let activityManager = CMMotionActivityManager()
    private let pedoMeter = CMPedometer()

    init() {
        if CMMotionActivityManager.isActivityAvailable() {
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { [weak self] (data) in
                DispatchQueue.main.async {
                    if let activity = data {
                        self?.activity = activity
                    }
                }
            }
        }

        if CMPedometer.isStepCountingAvailable() {
            self.pedoMeter.startUpdates(from: Date()) { [weak self] (data, error) in
                if error == nil {
                    if let response = data {
                        DispatchQueue.main.async {
                            self?.numberOfSteps = response.numberOfSteps
                        }
                    }
                }
            }
        }
    }
}

