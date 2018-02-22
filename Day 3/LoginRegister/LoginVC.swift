//
//  LoginVC.swift
//  LoginRegister
//
//  Created by Jigisha Patel on 2018-02-21.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnLoginAction(_ sender: UIBarButtonItem) {
    
        var Email = txtEmail.text
        var Password = txtPassword.text
        
        /*
        if(Email?.isEmpty)! {
            print("Email Adderss : \(String(describing: Email) is Empty")
            return
        }
 
 */
        /*
        else
 */
         if(Email == "test" && Password == "test"){
        
        let infoAlert = UIAlertController(title: "Login Sucessful", message: "You are authenticated", preferredStyle: .alert)
        
        infoAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
            self.present(infoAlert, animated: true, completion: nil)
    
        }
 
    }

    
@IBAction func btnRegisterAction(_ sender: UIBarButtonItem) {
        
        let registerSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerVC = registerSB.instantiateViewController(withIdentifier: "RegistrationScreen")
        
        //self.present(registerVC, animated: true, completion: nil)
        navigationController?.pushViewController(registerVC, animated: true)
        
    }
}









