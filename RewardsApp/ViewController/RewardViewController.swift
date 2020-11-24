//
//  RewardViewController.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController, Storyboarded, RewardViewModelDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rewardNameLabel: UILabel!
    @IBOutlet weak var rewarDetailsLabel: UILabel!
    
    var rewardImage: UIImage?
    
    let loader = ImageLoader()
    weak var coordinator: MainCoordinator?
    var viewModel: RewardViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        coordinator?.navigationController.setNavigationBarHidden(false, animated: false)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(named: "share-icon"), style: UIBarButtonItem.Style.done, target: self, action: #selector(startShare)), animated: false)
        // Do any additional setup after loading the view.
    }
    
    func updateUIElements() {
        guard let reward = viewModel.reward else {
            return
        }
        rewardNameLabel.text = reward.name
        rewarDetailsLabel.text = reward.promoDescription
        
        let imageUrl = URL(string: reward.imageUrl!)
        
        let token = loader.loadImage(imageUrl!) { result in
            do {
                let image = try result.get()
                DispatchQueue.main.async {
                    self.rewardImage = image
                    self.imageView.image = image
                }
            } catch {
                print(error)
            }
        }
    }
    
    @objc func startShare() {
        if let image = rewardImage {
            let items = [image]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
        }
    }
}
