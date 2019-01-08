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

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Home View"



		var current = Auth.auth().currentUser
		var uid = current?.uid
//		print(current?.uid)

		let ref = Database.database().reference()

		let packerTripRef = ref.child("packer").child(uid!).child("trips")
		packerTripRef.observe(DataEventType.value, with: { (snapshot) in
			let tripInfo = snapshot.value as? [String : AnyObject] ?? [:]
			print(tripInfo)
		})

        // Do any additional setup after loading the view.


    }
    
	@IBAction func handleLogout(_ target: UIButton) {
		try! Auth.auth().signOut()
		self.dismiss(animated: false, completion: nil)
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
