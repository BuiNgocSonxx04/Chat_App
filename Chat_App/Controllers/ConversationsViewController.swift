//
//  ViewController.swift
//  Chat_App
//
//  Created by BuiNgocSon on 5/12/21.
//  Copyright © 2021 BuiNgocSon. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser == nil {  
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
        }
        
    }
}

