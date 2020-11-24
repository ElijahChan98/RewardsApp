//
//  OnboardingViewModel.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class RewardsAppHelperClass {
    static func addToggleVisibilityGestureRecognizer(textField: UITextField, imageView: UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: textField, action: #selector(textField.toggleTextVisibility))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    static func validatePhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^(09)\\d{9}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    static func validateMPIN(value: String) -> Bool {
        return value.count == 4
    }
}
