//
//  MainCoordinator.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/19/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let vc = InitialScreenViewController.instantiate()
        vc.coordinator = self
        navigationController.delegate = self
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    func login() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func register() {
        let vc = RegisterViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = RegisterViewModel()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func showDashboard(with user: User) {
        let vc = DashboardViewController.instantiate()
        vc.coordinator = self
        let viewModel = DashboardViewModel(user: user)
        viewModel.delegate = vc
        vc.viewModel = viewModel
        
        let navController = UINavigationController()
        self.navigationController = navController
        self.navigationController.pushViewController(vc, animated: true)
        
        self.changeRootViewController(self.navigationController)
    }
    
    func showRewardDetails(with reward: Reward) {
        let vc = RewardViewController.instantiate()
        vc.coordinator = self
        let viewModel = RewardViewModel(reward: reward, delegate: vc)
        vc.viewModel = viewModel
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func showAlertController(title: String?, message: String, completion: (() -> Void)? = nil, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: okHandler)
        alertController.addAction(okButton)
        self.navigationController.present(alertController, animated: true, completion: completion)
    }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window else {
            return
        }
        // change the root view controller to your specific view controller
        window.rootViewController = vc
        
        UIView.transition(with: window,
        duration: 0.5,
        options: [.curveEaseIn],
        animations: nil,
        completion: nil)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let loginViewController = fromViewController as? LoginViewController {
            childDidFinish(loginViewController.coordinator)
        }
        else if let registerViewController = fromViewController as? RegisterViewController {
            childDidFinish(registerViewController.coordinator)
        }
        else if let rewardsViewController = fromViewController as? RewardViewController {
            childDidFinish(rewardsViewController.coordinator)
        }
    }
}
