//
//  LoginViewController.swift
//  FirebaseLogin
//
//  Created by Andy Zalit on 1/5/19.
//  Copyright © 2019 Andy Zalit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class LoginViewController: UIViewController {

	@IBOutlet weak var emailOutlet: UITextField!
	@IBOutlet weak var passwordOutlet: UITextField!
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Login"

        // Do any additional setup after loading the view.

		let ref = Database.database().reference()

		// ref.childByAutoId().setValue(["name":"Oscar", "email":"o@o.com", "password":"asdfasdf"])

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

	@IBAction func loginAction(_ sender: UIButton) {
		Auth.auth().signIn(withEmail: emailOutlet.text!, password: passwordOutlet.text!) { (user, error) in
			if error == nil{
				print("login success!!!!!!!")

				self.performSegue(withIdentifier: "SuccessLoginSegue", sender: self)
			}
			else{
				let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
				let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

				alertController.addAction(defaultAction)
				self.present(alertController, animated: true, completion: nil)
			}
		}

	}

}
