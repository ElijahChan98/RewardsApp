//
//  User.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class User: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case mobileNumber = "mobile"
        case id = "id"
        case isVerified = "is_verified"
        case referralCode = "referral_code"
    }
    
    var firstName: String?
    var lastName: String?
    var mobileNumber: String?
    var id: String?
    var isVerified: Bool?
    var referralCode: String?
    
    func createUserFromPayload(_ payload: [String: Any]) -> User? {
        let decoder = JSONDecoder()
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
            do {
                let user = try decoder.decode(User.self, from: jsonData)
                return user
            } catch {
                print(error.localizedDescription)
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
