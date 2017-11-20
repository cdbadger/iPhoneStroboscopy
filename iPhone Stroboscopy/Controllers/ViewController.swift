//
//  ViewController.swift
//  iPhone Stroboscopy
//
//  Created by Christopher Badger on 11/2/17.
//  Copyright © 2017 Christopher Badger. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   
   
    @IBAction func runPitchDetectionAlgorithm() {
    }
    
   
    @IBAction func TorchToggle(_ sender: Any) {
            let device = AVCaptureDevice.default(for: AVMediaType.video)
        if (device?.hasTorch)! {
            do {
                try device?.lockForConfiguration()
                    if (device?.torchMode == AVCaptureDevice.TorchMode.on) {
                        device?.torchMode = AVCaptureDevice.TorchMode.off
                    } else {
                        do {
                            try device?.setTorchModeOn(level: 1.0)
                        } catch {
                            print(error)
                        }
                    }
                device?.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

