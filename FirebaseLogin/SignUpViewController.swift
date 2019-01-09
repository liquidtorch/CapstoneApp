//
//  SignUpViewController.swift
//  FirebaseLogin
//
//  Created by Andy Zalit on 1/5/19.
//  Copyright © 2019 Andy Zalit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpViewController: UIViewController {

	@IBOutlet weak var emailOutlet: UITextField!
	@IBOutlet weak var passwordOutlet: UITextField!
	@IBOutlet weak var confirmPasswordOutlet: UITextField!
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var tapToChangeProfileButton: UIButton!
	@IBOutlet weak var usernameOutlet: UITextField!
	
	var imagePicker:UIImagePickerController!

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
			let ref = Database.database().reference()

			Auth.auth().createUser(withEmail: emailOutlet.text!, password: passwordOutlet.text!){ (user, error) in
				if error == nil {
					let u = Auth.auth().currentUser!
					// user.uid to set new entry into packer table
					ref.child("packer").child(u.uid).setValue(["name":self.usernameOutlet.text!])
					

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

		/*func saveProfile(username:String, completion: ((_ success:Bool())) {
			gaurd let uid = Auth.auth().currentUser?.uid else { return }
			let databaseRef = Database.database().reference().child("users/profile/\(uid)")

			let userObject = [
			"packer": username
			] as [String:Any]

			databaseRef.setValue(userObject) { error, ref in
			completion(error == nil)
		}*/

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
