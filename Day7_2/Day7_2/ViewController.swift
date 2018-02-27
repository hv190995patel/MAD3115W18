//
//  ViewController.swift
//  Day7_2
//
//  Created by MacStudent on 2018-02-27.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblProgress: UILabel!
    //@IBOutlet var myProgressView: UIView!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var lblSliderValue: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var imgMood: UIImageView!
    @IBOutlet weak var modesSegment: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var lblStepperValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myProgressView.progress = 0.0
        lblProgress.text = "\(Int(myProgressView.progress*100))%"
        self.progressTimer = Timer.scheduledTimer(timeInterval: 0.2,target: self,selector: #selector(self.btnStartProgressAction),userInfo: nil,repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnStartProgressAction(_ sender: UIButton) {
        self.myProgressView.progress += 0.01
        
        self.lblProgress.text = "\(Int(self.myProgressView.progress * 100))%"
        
        if self.myProgressView.progress >= 1 {
            self.progressTimer.invalidate()
        }
    }
    
    var moodImages: [UIImage] = [
        UIImage(named: "happy.jpeg")!,
        UIImage(named: "angry.png")!,
        UIImage(named: "sad.jpeg")!
    ]

    var progressTimer = Timer()
    
    
    @IBAction func btnStartAction(_ sender: UIButton) {
        activityIndicator.startAnimating()
    }
    
    @IBAction func btnStopAction(_ sender: UIButton) {
        activityIndicator.stopAnimating()
    }
    
    
    @IBAction func myStepperAction(_ sender: UIStepper) {
        lblStepperValue.text = String(myStepper.value)
    }
    
    @IBAction func mySliderAction(_ sender: UISlider) {
        lblSliderValue.text = String(mySlider.value)
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        print("Selected : \(modesSegment.selectedSegmentIndex)")
        
        imgMood.image = moodImages[modesSegment.selectedSegmentIndex]
    }
    
    
}

