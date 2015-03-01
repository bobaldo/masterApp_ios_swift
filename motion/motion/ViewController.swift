//
//  ViewController.swift
//  motion
//
//  Created by Davide Patrizi on 30/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager : CMMotionManager?
    var activityManager : CMMotionActivityManager?
    let pedo = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager=CMMotionManager()
        if let mm = motionManager {
            if mm.deviceMotionAvailable
            {
                NSLog("device abilitato")
                mm.accelerometerUpdateInterval = 1.0/10.0
                
                mm.startAccelerometerUpdatesToQueue(NSOperationQueue(), withHandler: {(accData, error) -> Void in
                    
                    let mag = sqrt(accData.acceleration.x * accData.acceleration.x + accData.acceleration.y * accData.acceleration.y + accData.acceleration.z * accData.acceleration.z)
                    NSLog("x=%f y=%f z=%f mag=%f", accData.acceleration.x, accData.acceleration.y, accData.acceleration.z, mag)
                })
                
                if mm.gyroAvailable{
                    mm.gyroUpdateInterval = 1.0/10.0
                    mm.startGyroUpdatesToQueue(NSOperationQueue(), withHandler: {(gyroData, error) -> Void in
                        NSLog("x=%f y=%f z=%f", gyroData.rotationRate.x, gyroData.rotationRate.y, gyroData.rotationRate.z)
                    })
                }
            
            }else{
                NSLog("CMMotionManager not abilitato")
            }
        }
        
        let today = NSDate()
        let yesterday = NSDate().dateByAddingTimeInterval(-60*60*24)
        
        if CMMotionActivityManager.isActivityAvailable(){
            activityManager = CMMotionActivityManager()
            
            
            activityManager?.startActivityUpdatesToQueue(NSOperationQueue(), withHandler: {(activity) -> Void in
                if activity.stationary{
                    NSLog("stationary: \(activity.stationary) - unknow: \(activity.unknown) - confidence: \(activity.confidence)")
                }
            })
            
            activityManager?.queryActivityStartingFromDate(yesterday, toDate: today, toQueue: NSOperationQueue(), withHandler: { (activities, error) -> Void in
                for activity in activities {
                    NSLog("\(activity.startDate)")
                }
            })
            
        }else{
            NSLog("CMMotionActivityManager not abilitato")
        }
        

        if CMPedometer.isStepCountingAvailable()    {
            pedo.startPedometerUpdatesFromDate(yesterday, withHandler:  {(pedoData, error) -> Void in
                NSLog("steps \(pedoData.numberOfSteps)")
            })
        }else{
            NSLog("CMPedometer isStepCountingAvailable not abilitato")
        }
    
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

