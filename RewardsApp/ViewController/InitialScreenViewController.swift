//
//  InitialScreenViewController.swift
//  RewardsApp
//
//  Created by Elijah Tristan Huey Chan on 11/24/20.
//  Copyright © 2020 Elijah Tristan Huey Chan. All rights reserved.
//

import UIKit

class InitialScreenViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        coordinator?.login()
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        coordinator?.register()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
