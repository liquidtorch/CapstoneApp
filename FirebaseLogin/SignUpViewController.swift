//
//  SignUpViewController.swift
//  FirebaseLogin
//
//  Created by Andy Zalit on 1/5/19.
//  Copyright © 2019 Andy Zalit. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {

	@IBOutlet weak var emailOutlet: UITextField!
	@IBOutlet weak var passwordOutlet: UITextField!
	@IBOutlet weak var confirmPasswordOutlet: UITextField!


	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Register"

        // Do any additional setup after loading the view.
    }
    
	@IBAction func registerAction(_ sender: UIButton) {
		if passwordOutlet.text != confirmPasswordOutlet.text {
			let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
			let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

			alertController.addAction(defaultAction)
			self.present(alertController, animated: true, completion: nil)
		}
		else{
			Auth.auth().createUser(withEmail: emailOutlet.text!, password: passwordOutlet.text!){ (user, error) in
				if error == nil {

					// user.uid to set new entry into packer table

					let alertController = UIAlertController(title: "Success", message: "You successfully Registered", preferredStyle: .alert)

					let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
						self.navigationController?.popViewController(animated: true)
					}
					alertController.addAction(OKAction)

					self.present(alertController, animated: true) {
						// ... Do something
					}

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
