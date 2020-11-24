//
//  Reward.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class Reward: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case promoDescription = "description"
        case imageUrl = "image"
    }
    
    var name: String?
    var id: String?
    var promoDescription: String?
    var imageUrl: String?
    
    func createRewardFromPayload(_ payload: [String: Any]) -> Reward? {
        let decoder = JSONDecoder()
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
            do {
                let user = try decoder.decode(Reward.self, from: jsonData)
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
