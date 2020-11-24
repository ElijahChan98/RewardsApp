//
//  RewardViewModel.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class RewardViewModel {
    var reward: Reward!
    var delegate: RewardViewModelDelegate?
    
    func viewLoaded() {
        self.delegate?.updateUIElements()
    }
    
    convenience init(reward: Reward, delegate: RewardViewModelDelegate) {
        self.init()
        self.reward = reward
        self.delegate = delegate
    }
}

protocol RewardViewModelDelegate {
    func updateUIElements()
}
