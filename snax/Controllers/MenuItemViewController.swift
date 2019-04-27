//
//  MenuItemViewController.swift
//  snax
//
//  Created by Jessica Yuan on 4/26/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

class MenuItemViewController: UIViewController {
    
    var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "placeholder title"
        view.backgroundColor = .white
        
        goBackButton = UIButton()
        goBackButton.translatesAutoresizingMaskIntoConstraints = false 
        goBackButton.setTitle("Go back", for: .normal)
        goBackButton.setTitleColor(.black, for: .normal)
        goBackButton.addTarget(self, action: #selector(dismissViewControllerAndSaveText), for: .touchUpInside)
        view.addSubview(goBackButton)
        
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            goBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            goBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            ])
    }
    @objc func dismissViewControllerAndSaveText(){
        dismiss(animated: true, completion: nil)
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
