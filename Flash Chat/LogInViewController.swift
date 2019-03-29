//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
    }

    
    @IBAction func logInPressed(_ sender: AnyObject) {

        
        //TODO: Log in the user
		
		if emailTextfield.text == "", passwordTextfield.text == "" {
			
			let alert = UIAlertController(title: "Warning", message: "Please enter email and password.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
			
		}
        if !Reachability.isConnectedToNetwork(){
            let alert = UIAlertController(title: "Error", message: "Please Connect To Internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            SVProgressHUD.show()
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
                (user, error) in
                if error != nil {
                    print(error!)
                    SVProgressHUD.dismiss()
                    let alert = UIAlertController(title: "Warning", message: "Can not login with this details.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    SVProgressHUD.dismiss()
                    print("log in successfull")
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
            
        }
    }
}  
