//
//  LoginViewController.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {

    @IBOutlet weak var enterMobileNumberTextField: UITextField!
    @IBOutlet weak var enterMpinTextField: UITextField!
    @IBOutlet weak var toggleMpinVisibilityIcon: UIImageView!
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        enterMpinTextField.isSecureTextEntry = true
        
        hideKeyboardWhenTappedAround()
        RewardsAppHelperClass.addToggleVisibilityGestureRecognizer(textField: enterMpinTextField, imageView: toggleMpinVisibilityIcon)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        coordinator?.navigationController.popViewController(animated: true)
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let mobileNumber = enterMobileNumberTextField.text, let mpin = enterMpinTextField.text else {
            coordinator?.showAlertController(title: nil, message: Constants.FILL_OUT_ALL_FIELDS)
            return
        }
        guard RewardsAppHelperClass.validatePhoneNumber(value: mobileNumber) else {
            coordinator?.showAlertController(title: nil, message: Constants.INVALID_MOBILE_NUMBER)
            return
        }
        guard RewardsAppHelperClass.validateMPIN(value: mpin) else {
            coordinator?.showAlertController(title: nil, message: Constants.INVALID_MPIN_LENGTH)
            return
        }
        RequestManager.shared.login(mobileNumber: mobileNumber, mpin: mpin) { (success, message, response) in
            if let payload = response, success {
                if let user = User().createUserFromPayload(payload) {
                    print("fetched user: first name: \(user.firstName!), last name: \(user.lastName!), mobile: \(user.mobileNumber!), id: \(user.id!)")
                    self.coordinator?.showDashboard(with: user)
                }
            }
            else {
                self.coordinator?.showAlertController(title: "Login Failed", message: message)
            }
        }
    }

}
