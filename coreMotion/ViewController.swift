//
//  ViewController.swift
//  coreMotion
//
//  Created by David Rothschild on 1/12/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    //let motionManager: CMMotionManager = CMMotionManager()

    @IBOutlet weak var stepCount: UILabel!
    
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        pedometer.stopPedometerUpdates()
        stepCount.text = "0"
    }
    
    @IBAction func startButtonPressed(sender: UIButton) {
        pedometer.startPedometerUpdatesFromDate(NSDate(), withHandler: { data, error in
            print("Update \(data!.numberOfSteps)")
            dispatch_async(dispatch_get_main_queue()) {
                self.stepCount.text = String(stringInterpolationSegment: data!.numberOfSteps)
            }
        })
        
    }
    
    let pedometer: CMPedometer = CMPedometer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

