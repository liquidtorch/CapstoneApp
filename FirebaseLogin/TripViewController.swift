//
//  TripViewController.swift
//  FirebaseLogin
//
//  Created by Andy Zalit on 1/9/19.
//  Copyright © 2019 Andy Zalit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TripViewController: UIViewController {
	@IBOutlet weak var tripNameOutlet: UITextField!
	@IBOutlet weak var startLocationOutlet: UITextField!
	@IBOutlet weak var finishLocationOutlet: UITextField!
	@IBOutlet weak var milesOutlet: UITextField!
	@IBOutlet weak var descriptionOutlet: UITextField!
	@IBOutlet weak var startDateOutlet: UITextField!
	@IBOutlet weak var endDateOutlet: UITextField!
	@IBAction func addTripAction(_ sender: UIButton) {
	}

	private var startDatePicker: UIDatePicker!
	private var endDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

		

		// TRIP NAME


		// LOCATION


		// TOTAL MILES


		// DESCRIPTION


		// DATE PICKER
		startDatePicker = UIDatePicker()
		startDatePicker.datePickerMode = .date
		startDatePicker.addTarget(self, action: #selector(TripViewController.dateChanged(startDatePicker:)), for: .valueChanged)

		endDatePicker = UIDatePicker()
		endDatePicker.datePickerMode = .date
		endDatePicker.addTarget(self, action: #selector(TripViewController.dateChanged(endDatePicker:)), for: .valueChanged)

		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TripViewController.viewTapped(gestureRecognizer:)))

		view.addGestureRecognizer(tapGesture)

		startDateOutlet.inputView = startDatePicker
		endDateOutlet.inputView = endDatePicker


	}

	@objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
		view.endEditing(true)
	}

	@objc func dateChanged(startDatePicker: UIDatePicker) {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM/dd/yyyy"
		startDateOutlet.text = dateFormatter.string(from: startDatePicker.date)
		view.endEditing(true)
	}

	@objc func dateChanged(endDatePicker: UIDatePicker) {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM/dd/yyyy"
		endDateOutlet.text = dateFormatter.string(from: endDatePicker.date)
		view.endEditing(true)

	}

}
