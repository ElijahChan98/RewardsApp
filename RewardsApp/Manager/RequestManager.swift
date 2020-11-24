//
//  RequestManager.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class RequestManager: NetworkLayerProtocol {
    public static let shared = RequestManager()
    
    func post(_ url: URL, parameters: Data, completion: (Data?) -> Void) {
        let stringUrl = url.absoluteString
        var mockResponse: [String: Any?] = [:]
        if stringUrl == "\(Constants.MOCK_API_URL)\(Constants.REGISTER)" {
            mockResponse = ["status": 200,
                            "message": "Successfully Registered",
                            "data": nil
            ]
        }
        if stringUrl == "\(Constants.MOCK_API_URL)\(Constants.LOGIN)"{
            let userPayload = ["user": MockValues.mockLoginUser]
            mockResponse = ["status": 200,
                            "message": "Successfully Registered",
                            "data": userPayload
             ]
        }
        
        do {
            let responseData = try JSONSerialization.data(withJSONObject: mockResponse, options: .prettyPrinted)
            completion(responseData)
        }
        catch {
            completion(nil)
        }
    }
    
    func get(_ url: URL, parameters: Data, completion: (Data?) -> Void) {
        let stringUrl = url.absoluteString
        var mockResponse: [String: Any?] = [:]
        if stringUrl == "\(Constants.MOCK_API_URL)\(Constants.USER_PROFILE)" {
            let userPayload = ["user": MockValues.mockUserProfile]
            mockResponse = ["status": 200,
                            "message": "User Fetched",
                            "data": userPayload
            ]
        }
        if stringUrl == "\(Constants.MOCK_API_URL)\(Constants.USER_REWARDS)"{
            let rewardsPayload = ["list": MockValues.allRewards]
            mockResponse = ["status": 200,
                            "message": "Successfully Registered",
                            "data": rewardsPayload
            ]
        }
        
        do {
            let responseData = try JSONSerialization.data(withJSONObject: mockResponse, options: .prettyPrinted)
            completion(responseData)
        }
        catch {
            completion(nil)
        }
    }
    
    func registerUser(firstName: String, lastName: String, mobileNumber: String, mpin: String, completion: @escaping (_ success: Bool, _ message: String) -> Void) {
        guard firstName != "", lastName != "", mobileNumber != "", mpin != "" else {
            completion(false, Constants.FILL_OUT_ALL_FIELDS)
            return
        }
        guard let url = URL(string: "\(Constants.MOCK_API_URL)\(Constants.REGISTER)") else {
            return
        }
        let params = ["first_name": firstName,
                      "last_name": lastName,
                      "mobile": mobileNumber,
                      "mpin": mpin
        ]
        let encoder = JSONEncoder()
        let requestData = try! encoder.encode(params)
        self.post(url, parameters: requestData) { (data) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let payload = json as? [String: Any] {
                        if let message = payload["message"] as? String {
                            completion(true, message)
                        }
                    }
                }
                catch {
                    completion(false, Constants.SOMETHING_WENT_WRONG)
                }
            }
            else{
                completion(false, Constants.SOMETHING_WENT_WRONG)
            }
        }
    }
    
    func login(mobileNumber: String, mpin: String, completion: @escaping (_ success: Bool, _ message: String, _ response: [String: Any]?) -> Void) {
        guard mobileNumber != "", mpin != "" else {
            completion(false, Constants.FILL_OUT_ALL_FIELDS, nil)
            return
        }
        guard let url = URL(string: "\(Constants.MOCK_API_URL)\(Constants.LOGIN)") else {
            return
        }
        let params = ["mobile": mobileNumber,
                      "mpin": mpin
        ]
        let encoder = JSONEncoder()
        let requestData = try! encoder.encode(params)
        self.post(url, parameters: requestData) { (data) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let payload = json as? [String: Any] {
                        if let message = payload["message"] as? String, let data = payload["data"] as? [String: Any], let user = data["user"] as? [String: Any] {
                            completion(true, message, user)
                        }
                    }
                }
                catch {
                    completion(false, Constants.SOMETHING_WENT_WRONG, nil)
                }
            }
            else{
                completion(false, Constants.SOMETHING_WENT_WRONG, nil)
            }
        }
    }
    
    func getUserProfile(id: String, completion: @escaping (_ success: Bool, _ message: String, _ response: [String: Any]?) -> Void) {
        guard id != "" else {
            completion(false, Constants.FILL_OUT_ALL_FIELDS, nil)
            return
        }
        guard let url = URL(string: "\(Constants.MOCK_API_URL)\(Constants.USER_PROFILE)") else {
            return
        }
        let params = ["id": id,
        ]
        
        let encoder = JSONEncoder()
        let requestData = try! encoder.encode(params)
        self.get(url, parameters: requestData) { (data) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let payload = json as? [String: Any] {
                        if let message = payload["message"] as? String, let data = payload["data"] as? [String: Any], let user = data["user"] as? [String: Any] {
                            completion(true, message, user)
                        }
                    }
                }
                catch {
                    completion(false, Constants.SOMETHING_WENT_WRONG, nil)
                }
            }
            else{
                completion(false, Constants.SOMETHING_WENT_WRONG, nil)
            }
        }
    }
    
    func getRewards(id: String, completion: @escaping (_ success: Bool, _ message: String, _ response: [String: Any]?) -> Void) {
        guard id != "" else {
            completion(false, Constants.FILL_OUT_ALL_FIELDS, nil)
            return
        }
        guard let url = URL(string: "\(Constants.MOCK_API_URL)\(Constants.USER_REWARDS)") else {
            return
        }
        let params = ["id": id,
        ]
        
        let encoder = JSONEncoder()
        let requestData = try! encoder.encode(params)
        self.get(url, parameters: requestData) { (data) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let payload = json as? [String: Any] {
                        if let message = payload["message"] as? String, let data = payload["data"] as? [String: Any], let list = data["list"] as? [[String: Any]] {
                            let response = ["payloads": list] as [String: Any]
                            completion(true, message, response)
                        }
                    }
                }
                catch {
                    completion(false, Constants.SOMETHING_WENT_WRONG, nil)
                }
            }
            else{
                completion(false, Constants.SOMETHING_WENT_WRONG, nil)
            }
        }
    }
}

extension String{
    public func urlString() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
}
