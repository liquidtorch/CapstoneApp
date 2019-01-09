//
//  HomeViewController.swift
//  FirebaseLogin
//
//  Created by Andy Zalit on 1/5/19.
//  Copyright © 2019 Andy Zalit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



class HomeViewController: UIViewController {
	@IBOutlet weak var packerName: UILabel!
	@IBAction func LogoutAction(_ sender: Any) {
		do {
			try Auth.auth().signOut()
			_ = navigationController?.popToRootViewController(animated: true)
		}
		catch let signOutError as NSError {
			print ("Error signing out: %@", signOutError)
		}

	}

		/*let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let initial = storyboard.instantiateInitialViewController()
		UIApplication.shared.keyWindow?.rootViewController = initial
	*/

		override func viewDidLoad() {
        super.viewDidLoad()
		// self.title = "Home View"

		/*func viewWillAppear(_ animated: Bool) {
			super.viewWillAppear(true)
			// Show the Navigation Bar
			self.navigationController?.setNavigationBarHidden(true, animated: true)
		}

		func viewWillDisappear(_ animated: Bool) {
			super.viewWillDisappear(true)
			// Hide the Navigation Bar
			self.navigationController?.setNavigationBarHidden(false, animated: false)
		}
*/
			print("#############")
		var current = Auth.auth().currentUser
		let uid = current?.uid
			//		print(current?.uid)

		let ref = Database.database().reference()

		let packerTripRef = ref.child("packer").child(uid!).child("trips")
		packerTripRef.observe(DataEventType.value, with: { (snapshot) in
			let tripInfo = snapshot.value as? [String : AnyObject] ?? [:]
			print(tripInfo)
		})
		{ (error) in

			print(error.localizedDescription)
			}

			let packerNameRef = ref.child("packer").child(uid!)
			packerNameRef.observe(DataEventType.value, with: { (snapshot) in
				let packer = snapshot.value as? [String : Any] ?? [:]
				self.packerName.text = packer["name"] as? String
				print(packer)
			})

			


		}





}
