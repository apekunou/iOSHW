//
//  AuthorizationViewController.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/18/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var incorrectPassword: UILabel!
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if passwordTextFiled.text == "" || passwordTextFiled.text?.count ?? 0 < 6
        {
            incorrectPassword.isHidden = false
            incorrectPassword.textColor = .red
            return
        }
       performSegue(withIdentifier: "loginSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      let navigationController = segue.destination as? UINavigationController
      let distinationViewController = navigationController?.viewControllers.first as? MenueViewController
          distinationViewController?.loginText = loginTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        incorrectPassword.isHidden = true
    }
    


}
