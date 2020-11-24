//
//  DashboardViewModel.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class DashboardViewModel {
    var user: User!
    var rewards: [Reward] = []
    var delegate: DashboardViewModelDelegate?
    
    convenience init(user: User) {
        self.init()
        self.user = user
    }
    
    func fetchUserProfile() {
        guard let id = user.id else {
            return
        }
        RequestManager.shared.getUserProfile(id: id) { (success, message, response) in
            if let payload = response {
                self.user = User().createUserFromPayload(payload)
                DispatchQueue.main.async {
                    self.delegate?.reloadUIElementsFrom()
                }
            }
        }
    }
    
    func fetchRewards() {
        guard let id = user.id else {
            return
        }
        self.rewards = []
        RequestManager.shared.getRewards(id: id) { (success, message, response) in
            if let payload = response, let list = payload["payloads"] as? [[String: Any]] {
                for item in list {
                    guard let reward = Reward().createRewardFromPayload(item) else{
                        return
                    }
                    self.rewards.append(reward)
                }
                self.delegate?.reloadUIElementsFrom()
            }
        }
    }
}

protocol DashboardViewModelDelegate {
    func reloadUIElementsFrom()
}
