//
//  ViewController.swift
//  TouchID
//
//  Created by qihaijun on 11/11/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let context = LAContext()
        
        var error: NSError?
        guard context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) else {
            print("Can't evaluate policy : \(error?.localizedDescription)")
            return
        }
        
        context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Need authentication with biometrics") { (success, authenticationError) -> Void in
            print("Authentication \(success ? "succeeded" : "failed")")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

