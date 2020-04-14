//
//  AuthorizationViewController.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/18/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

//swiftlint:disable trailing_whitespace
//swiftlint:disable vertical_whitespace
//swiftlint:disable opening_brace

import UIKit

class AuthorizationViewController: UIViewController {
    
    var animationView = UIView(frame: CGRect(x:100, y:100, width: 100, height: 100) )
    var verticalPosition: NSLayoutConstraint?
    var buttonAnimationType = 0
    let gestureImageView = UIImageView(frame: CGRect(x: 120, y: 600, width: 150, height: 150))

    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var incorrectPassword: UILabel!
    
    @IBOutlet weak var animationButton: UIButton!
    
    @IBAction func animationButtonPressed(_ sender: Any) {
        
        NetworkManager.shared.fetchData(urlSuffix: 1)
        
        if buttonAnimationType > 2
        { buttonAnimationType = 0 }
        
        switch buttonAnimationType
        {
        case 0: print("1")
            UIView.animate(withDuration: 2) { [weak self] in
                guard let self = self else {return}
                self.animationButton.translatesAutoresizingMaskIntoConstraints = false
                self.animationButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
                self.animationButton.heightAnchor.constraint(equalToConstant: 130).isActive = true
               // self.animationButton.layer.cornerRadius = self.animationButton.layer.bounds.width/2
                self.animationButton.layer.borderWidth = 2
                self.animationButton.layer.borderColor = UIColor.black.cgColor
                self.view.layoutIfNeeded()
            }
        case 1:
            UIView.animate(withDuration: 2) { [weak self] in
                guard let self = self else {return}
                self.animationButton.translatesAutoresizingMaskIntoConstraints = false
                self.animationButton.layer.cornerRadius = self.animationButton.layer.bounds.width/2
                self.animationButton.backgroundColor = .systemYellow
        //        self.animationButton.backgroundColor = .lightGray
                self.view.layoutIfNeeded()
            }
        case 2:
            UIView.animate(withDuration: 2) { [weak self] in
                guard let self = self else {return}
                let translateTransform = CGAffineTransform(translationX: 300, y: 0)
                self.animationButton.transform = translateTransform
            }
        default:
            buttonAnimationType = 0
        }
        
        buttonAnimationType += 1
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        if passwordTextFiled.text == "" || passwordTextFiled.text?.count ?? 0 < 6
        {
            incorrectPassword.isHidden = false
            incorrectPassword.textColor = .red
            return
        }
        ProfileManager.shared.login = loginTextField.text ?? ""
        ProfileManager.shared.password = passwordTextFiled.text ?? ""
       performSegue(withIdentifier: "loginSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      let navigationController = segue.destination as? UINavigationController
      let distinationViewController = navigationController?.viewControllers.first as? MenueViewController
        //  distinationViewController?.loginText = loginTextField.text ?? ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData(urlSuffix: 1)
//        animationButton.translatesAutoresizingMaskIntoConstraints = false
//        animationButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        animationButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        animationButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
//        animationButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 80).isActive = true
        animationButton.backgroundColor = .lightGray
        
//        view.addSubview(animationView) //!!!!!!!!!!!!
//        animationView.layer.borderWidth = 3
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        verticalPosition = animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        verticalPosition!.isActive = true
//        animationView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        animationView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        // Do any additional setup after loading the view.
//        incorrectPassword.isHidden = true
          view.addSubview(gestureImageView)
          gestureImageView.backgroundColor = .red
          gestureImageView.isUserInteractionEnabled = true
          let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(sender:)))
          gestureImageView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        guard let gestView = sender.view else { return }
        gestView.transform = gestView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
        
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer) {
        guard let movableView = sender.view else { return }
        let translation = sender.translation(in: sender.view?.superview)
        if sender.state == .began || sender.state == .changed {
                movableView.center = CGPoint(x: movableView.center.x + translation.x, y: movableView.center.y + translation.y)
                sender.setTranslation(.zero, in: sender.view?.superview)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
  //      animateToCircle()
        
//UIView.animate(withDuration: 1, animations: { [weak self] in
//    self?.animateToCircle()
//}) { [weak self] bool in
//    UIView.animate(withDuration: 3) { [weak self] in
//        guard let self = self else { return }
//        let view = self.animationView
//        view.backgroundColor = .yellow
//    }
//}
        
//        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
//            [weak self] in
//            self?.animateToCircle()
//        }, completion: {
//        [weak self] bool in
//            UIView.animate(withDuration: 3) { [weak self] in
//                guard let self = self else { return }
//                let view = self.animationView
//                view.backgroundColor = .yellow
//        })

            
    }
    
    func animateToCircle() {
        self.verticalPosition?.constant = -200
        UIView.animate(withDuration: 1) { [weak self] in
        guard let self = self else {return}
        let view = self.animationView
        view.backgroundColor = .red
      //  view.center = self.view.center
        view.layer.cornerRadius = view.bounds.width/2
        view.layer.borderColor = UIColor.black.cgColor
        self.view.layoutIfNeeded()
        }
//        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
//            [weak self] in
//            self?.animateToCircle()
//        }, completion: {
//        [weak self] in
//        guard let self = self else { return }
//        let view = self.animationView
//        view.backgroundColor = .yellow
//        })
        
        
        
    }


}
