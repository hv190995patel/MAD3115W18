//
//  ViewController.swift
//  Day 7
//
//  Created by MacStudent on 2018-02-27.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCarPlate: UITextField!
    @IBOutlet weak var txtCarColor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAddNewAction(_ sender: UIButton) {
        self.writePropertyList()
    }
    
    func writePropertyList() {
        let myCar = NSMutableDictionary()
        myCar["CarPlate"] = self.txtCarPlate.text
        myCar["carColor"] = self.txtCarColor.text
        
       if let plistPath = Bundle.main.path(forResource: "Cars", ofType: "plist")
       {
         let carsplist = NSMutableArray(contentsOfFile: plistPath)
            carsplist?.add(myCar)
        if(carsplist?.write(toFile: plistPath, atomically: true))! {
            print("carslist: \(String(describing: carsplist))")
        }
      }
       else {
        print("..Unable to locate plist file")
        }
        
    }
    @IBAction func btnListAllAtion(_ sender: UIButton) {
    }
    
}

