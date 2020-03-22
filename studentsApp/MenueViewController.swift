//
//  MenueViewController.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/18/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//
//swiftlint:disable trailing_whitespace
//swiftlint:disable vertical_whitespace
//swiftlint:disable opening_brace
//swiftlint:disable tatement_position
import UIKit

class MenueViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            ProfileManager.shared.profileType   = 0
        case 1:
            ProfileManager.shared.profileType   = 1
        case 2:
            ProfileManager.shared.profileType   = 2
        default:
            ProfileManager.shared.profileType   = 0
        }
    }
    
    var loginText = ""
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  guard let profileVC = segue.destination as? ProfileViewController else { return }
    //    detailsVC.firstNameLabel.text = loginText.text ?? ""
          if let profileVC = segue.destination as? ProfileViewController
          {
      //      profileVC.login = loginText
          }
          if let tableVC = segue.destination as? StudentsViewController
          {
      //      tableVC.loginText = loginText
          }
    //    detailsVC.secondNameLabel?.text = passwordTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginText = ProfileManager.shared.login
        if loginText == "" {
        
            helloLabel.text = "Hello, Incognito!" }
        else {
            helloLabel.text = "Hello, " + loginText + " !"
        }
    }

}
