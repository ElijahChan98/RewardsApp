//
//  RegisterViewModel.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class RegisterViewModel {
    func createRegisteredUser(firstName: String, lastName: String, mobileNumber: String) -> User {
        let user = User()
        user.id = "qwe-rty-123-456" //only added for mock purposes -- assumption is get user profile needs user id so generate one for now
        user.firstName = firstName
        user.lastName = lastName
        user.mobileNumber = mobileNumber
        
        return user
    }
}
