//
//  RegisterViewController.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var enterMobileNumberTextField: UITextField!
    @IBOutlet weak var enterMpinTextField: UITextField!
    @IBOutlet weak var confirmMpinTextField: UITextField!
    @IBOutlet weak var initialMpinVisibilityIcon: UIImageView!
    @IBOutlet weak var confirmMpinVisibilityIcon: UIImageView!
    
    weak var coordinator: MainCoordinator?
    var viewModel: RegisterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        enterMpinTextField.isSecureTextEntry = true
        confirmMpinTextField.isSecureTextEntry = true
        enterMpinTextField.textContentType = .oneTimeCode
        confirmMpinTextField.textContentType = .oneTimeCode
        
        hideKeyboardWhenTappedAround()
        setupMpinTextVisibilityGestures()
    }
    
    func setupMpinTextVisibilityGestures() {
        RewardsAppHelperClass.addToggleVisibilityGestureRecognizer(textField: enterMpinTextField, imageView: initialMpinVisibilityIcon)
        
        RewardsAppHelperClass.addToggleVisibilityGestureRecognizer(textField: confirmMpinTextField, imageView: confirmMpinVisibilityIcon)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        coordinator?.navigationController.popViewController(animated: true)
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        guard let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let mobileNumber = enterMobileNumberTextField.text, let newMpin = enterMpinTextField.text, let confirmMpin = confirmMpinTextField.text else {
            coordinator?.showAlertController(title: nil, message: Constants.FILL_OUT_ALL_FIELDS)
            return
        }
        guard RewardsAppHelperClass.validatePhoneNumber(value: mobileNumber) else {
            coordinator?.showAlertController(title: nil, message: Constants.INVALID_MOBILE_NUMBER)
            return
        }
        guard newMpin == confirmMpin else {
            coordinator?.showAlertController(title: nil, message: Constants.MPIN_MISMATCH, completion: nil)
            return
        }
        guard RewardsAppHelperClass.validateMPIN(value: newMpin) else {
            coordinator?.showAlertController(title: nil, message: Constants.INVALID_MPIN_LENGTH)
            return
        }
        RequestManager.shared.registerUser(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber, mpin: newMpin) { (success, message) in
            if success {
                self.coordinator?.showAlertController(title: "Success", message: message) { (action) in
                    let registeredUser = self.viewModel.createRegisteredUser(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber)
                    self.coordinator?.showDashboard(with: registeredUser)
                }
            }
            else {
                self.coordinator?.showAlertController(title: nil, message: message)
            }
        }
    }

}
