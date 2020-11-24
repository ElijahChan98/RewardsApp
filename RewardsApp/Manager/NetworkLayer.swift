//
//  NetworkLayer.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

@objc protocol NetworkLayerProtocol {
    @objc optional func post(_ url: URL, parameters: Data, completion: (_ data: Data?) -> Void)
    @objc optional func get(_ url: URL, parameters: Data, completion:(_ data: Data?) -> Void)
}

struct Constants {
    static let MOCK_API_URL = "https://mockapi.com"
    static let REGISTER = "/register"
    static let LOGIN = "/login"
    static let USER_PROFILE = "/user/profile"
    static let USER_REWARDS = "/user/rewards"
    
    static let SOMETHING_WENT_WRONG = "Something went wrong, please try again later"
    static let FILL_OUT_ALL_FIELDS = "Please fill out all of the required fields."
    static let MPIN_MISMATCH = "MPIN fields do not match"
    static let INVALID_MOBILE_NUMBER = "Mobile number is invalid"
    static let INVALID_MPIN_LENGTH = "MPIN must only be 4 digits long"
}
