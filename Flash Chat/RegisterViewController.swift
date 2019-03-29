//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

        
        //TODO: Set up a new user on our Firbase database
		
		if emailTextfield.text == "", passwordTextfield.text == "" {
			
			let alert = UIAlertController(title: "Warning", message: "Please enter email and password.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}
		else if !Reachability.isConnectedToNetwork() {
            let alert = UIAlertController(title: "Error", message: "Please Connect To Internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            SVProgressHUD.show()
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
                (user, error) in
                if error != nil {
                    print(error!)
                    SVProgressHUD.dismiss()
                    let alert = UIAlertController(title: "Warning", message: "Can not register with this details.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    print("registration successfull...!!! ")
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        }
    } 
}
