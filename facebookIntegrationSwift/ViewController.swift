
//  ViewController.swift
//  facebookIntegrationSwift
//  Created by user11 on 2/9/18.
//  Copyright © 2018 user11. All rights reserved.

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    var loginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.delegate = self
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){

        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).start(completionHandler: { (connection, result , error) in
                print(result as Any)
            })
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    
    @IBAction func fbClick(_ sender: UIButton) {
        loginButton.sendActions(for: .touchUpInside)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

