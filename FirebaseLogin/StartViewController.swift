//
//  StartViewController.swift
//  
//
//  Created by Andy Zalit on 1/5/19.
//

import UIKit
import Firebase
import FirebaseDatabase

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		func viewWillAppear(_ animated: Bool) {
			super.viewWillAppear(true)
			// Show the Navigation Bar
			self.navigationController?.setNavigationBarHidden(true, animated: true)
		}

		func viewWillDisappear(_ animated: Bool) {
			super.viewWillDisappear(true)
			// Hide the Navigation Bar
			self.navigationController?.setNavigationBarHidden(false, animated: false)
		}
        // Do any additional setup after loading the view.
    }

	override func viewDidAppear(_ animated: Bool){
		super.viewDidAppear(animated)
		if Auth.auth().currentUser != nil {
			self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
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
