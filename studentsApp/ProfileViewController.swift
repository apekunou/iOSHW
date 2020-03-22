//
//  ProfileViewController.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/27/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//
//swiftlint:disable trailing_whitespace
//swiftlint:disable vertical_whitespace
//swiftlint:disable line_length
import UIKit

class ProfileViewController: UIViewController {
    
    var animationView = UIView(frame: CGRect(x:100, y:100, width: 100, height: 100) )

    @IBOutlet weak var studentInfoLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var loginText: UILabel!
    
    public var login = ""
    
    public var firstName = ""
    
    public var secondName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animationView) //!!!!!!
        
        firstNameLabel?.text = firstName
        secondNameLabel?.text = secondName
        login = ProfileManager.shared.login
        if login == ""{
          loginText?.text = "Hello, Incognito!"
        }
        else
        {
          loginText?.text = "Hello, " + login + "!"
        }

        // Do any additional setup after loading the view.
        switch ProfileManager.shared.profileType
        {
        case 0:
            profileType0Prep()
        case 1:
            profileType1Prep()
        case 2:
            profileType2Prep()
        default:
            ProfileManager.shared.profileType   = 0
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super .viewDidAppear(animated)
//        UIView.animate(withDuration: 1) { [weak self] in
//            guard let self = self else {return}
//            let view = self.animationView
//            view.backgroundColor = .red
//            view.center = self.view.center
//            view.layer.cornerRadius = view.bounds.width / 2
//        }
            
    }
    
    func profileType0Prep () {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.backgroundColor = .red
        profileImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        profileImage.layer.cornerRadius = 80
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func profileType1Prep() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        studentInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -100).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -220).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 170).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 170).isActive = true
        profileImage.backgroundColor = .lightGray
        
        firstNameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 80).isActive = true
        firstNameLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -250).isActive = true
        firstNameLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        secondNameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 80).isActive = true
        secondNameLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -200).isActive = true
        secondNameLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        secondNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        studentInfoLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        studentInfoLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        studentInfoLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        studentInfoLabel.heightAnchor.constraint(equalToConstant: 450).isActive = true
    }
    
    func profileType2Prep () {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        studentInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -190).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 420).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
        profileImage.backgroundColor = .lightGray
        
        firstNameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        firstNameLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
        firstNameLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        secondNameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        secondNameLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -20).isActive = true
        secondNameLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        secondNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        studentInfoLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        studentInfoLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 130).isActive = true
        studentInfoLabel.widthAnchor.constraint(equalToConstant: 450).isActive = true
        studentInfoLabel.heightAnchor.constraint(equalToConstant: 550).isActive = true
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
