//
//  ContactDetailVC.swift
//  Day 9
//
//  Created by MacStudent on 2018-03-05.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import MessageUI
import CallKit

class ContactDetailVC: UIViewController {

    @IBAction func btnCallAction(_ sender: UIButton) {
        print("Calling...")
        let url = URL(string: "tel://+11231231231")
        
        if UIApplication.shared.canOpenURL(url!) {
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url!)
            }
            else
            {
                UIApplication.shared.openURL(url!)
            }
        }
    }
    
    @IBAction func btnTextAction(_ sender: UIButton) {
        print("Messaging")
        if
          MFMessageComposeViewController.canSendText()
        {
            let messageVC = MFMessageComposeViewController()
            messageVC.body = "Hello How Are You?"
            messageVC.recipients = ["+112354545"]
            messageVC.messageComposeDelegate = self
             as?
            MFMessageComposeViewControllerDelegate
            
            self.present(messageVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnEmailAction(_ sender: UIButton) {
        print("Sending Mail...")
        if
            MFMailComposeViewController.canSendMail() {
            let EmailPicker  = MFMailComposeViewController()
            EmailPicker.mailComposeDelegate = self as! MFMailComposeViewControllerDelegate
            EmailPicker.setSubject("Test EMail")
            EmailPicker.setMessageBody("Hello", isHTML: true)
            
            self.present(EmailPicker, animated: true, completion: nil)
        }
        else {
            print("Can't Send Email")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContactDetailVC:
MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
