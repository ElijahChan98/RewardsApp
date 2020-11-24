//
//  DashboardViewController.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, Storyboarded, DashboardViewModelDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var referralCodeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let loader = ImageLoader()
    weak var coordinator: MainCoordinator?
    var viewModel: DashboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "RewardsCell", bundle: nil), forCellReuseIdentifier: "RewardsCell")
        
        viewModel.fetchUserProfile()
        viewModel.fetchRewards()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        coordinator?.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func reloadUIElementsFrom() {
        guard let user = viewModel.user else {
            return
        }
        nameLabel.text = "\(user.firstName!) \(user.lastName!)"
        mobileNumberLabel.text = "\(user.mobileNumber!)"
        referralCodeLabel.text = "\(user.referralCode ?? "")"
        
        self.tableView.reloadData()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rewards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rewardCell = self.tableView.dequeueReusableCell(withIdentifier: "RewardsCell") as! RewardsCell
        let reward = viewModel.rewards[indexPath.row]
        rewardCell.rewardName.text = reward.name
        
        let imageUrl = URL(string: reward.imageUrl!)
        
        let token = loader.loadImage(imageUrl!) { result in
            do {
                let image = try result.get()
                DispatchQueue.main.async {
                    rewardCell.rewardImage.image = image
                }
            } catch {
                print(error)
            }
        }

        rewardCell.onReuse = {
            if let token = token {
                self.loader.cancelLoad(token)
            }
        }
        return rewardCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reward = viewModel.rewards[indexPath.row]
        coordinator?.showRewardDetails(with: reward)
    }
}
