//
//  SignUpViewController.swift
//  snax
//
//  Created by Jessica Yuan on 5/5/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let snaxcolor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
    var firstnameLabel: UILabel!
    var firstnameTextField: UITextField!
    var lastnameLabel: UILabel!
    var lastnameTextField: UITextField!
    var createAccountButton: UIButton!
    
    weak var delegate: CreateNewUserDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create your account"
        view.backgroundColor = .white
        
        firstnameLabel = UILabel()
        firstnameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstnameLabel.text = "First name"
        firstnameLabel.textColor = snaxcolor
        view.addSubview(firstnameLabel)
        
        lastnameLabel = UILabel()
        lastnameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastnameLabel.text = "Last name"
        lastnameLabel.textColor = snaxcolor
        view.addSubview(lastnameLabel)
    
        firstnameTextField = UITextField()
        firstnameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstnameTextField.text = "Enter first name here"
       // firstnameTextField.textColor = snaxcolor
        //firstnameTextField.borderStyle = .line
        view.addSubview(firstnameTextField)
        
        lastnameTextField = UITextField()
        lastnameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastnameTextField.text = "Enter last name here"
        //lastnameTextField.textColor = snaxcolor
        //lastnameTextField.borderStyle = .line
        view.addSubview(lastnameTextField)
        
        createAccountButton = UIButton()
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.setTitle("Create your account", for: .normal)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.backgroundColor = snaxcolor
        createAccountButton.addTarget(self, action: #selector(PresentTabBarControllerAndSignUp), for: .touchUpInside)
        view.addSubview(createAccountButton)
        setUpConstraints()
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func PresentTabBarControllerAndSignUp(){
        if let firstname = firstnameTextField.text, firstname != ""{
            if let lastname = lastnameTextField.text, lastname != ""{
                 let name = "\(firstname) \(lastname)"
                 present(TabBarController(), animated: true, completion:nil)
                 NetworkManager.createUserPost(name: name) { (user) in
                    //let newuser = User(id: user.id, name: user.name, orders: user.orders)
                    //self.delegate?.createNewUser(user: newuser)
                }
                
            }
        }
        //if let name = "\(firstnameTextField.text?) \(lastnameTextField.text?)"{
        
        
        //}
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            firstnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            firstnameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            firstnameLabel.heightAnchor.constraint(equalToConstant: 50)])
            firstnameLabel.widthAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            lastnameLabel.leadingAnchor.constraint(equalTo: firstnameLabel.leadingAnchor),
            lastnameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            lastnameLabel.heightAnchor.constraint(equalToConstant: 50)])
            lastnameLabel.widthAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            firstnameTextField.leadingAnchor.constraint(equalTo: firstnameLabel.trailingAnchor, constant: 5),
            firstnameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            firstnameTextField.heightAnchor.constraint(equalToConstant: 50),
            firstnameTextField.widthAnchor.constraint(equalToConstant: 200)])
        NSLayoutConstraint.activate([
            lastnameTextField.leadingAnchor.constraint(equalTo: lastnameLabel.trailingAnchor, constant: 5),
            lastnameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            lastnameTextField.heightAnchor.constraint(equalToConstant: 50),
            lastnameTextField.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            createAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 2),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            createAccountButton.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        
        
        
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
