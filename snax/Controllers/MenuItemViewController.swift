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
    var addtoCartButton: UIButton!
    var MenuItemLabel: UILabel!
    
    let snaxcolor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "placeholder title"
        view.backgroundColor = .white
        
        MenuItemLabel = UILabel()
        MenuItemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        goBackButton = UIButton()
        goBackButton.setImage(UIImage(named: "xxx"), for: .normal)
        goBackButton.translatesAutoresizingMaskIntoConstraints = false 
        goBackButton.setTitle("Go back", for: .normal)
        goBackButton.setTitleColor(.black, for: .normal)
        goBackButton.addTarget(self, action: #selector(dismissViewControllerAndSaveText), for: .touchUpInside)
        view.addSubview(goBackButton)
        
        addtoCartButton = UIButton()
        addtoCartButton.translatesAutoresizingMaskIntoConstraints = false
        addtoCartButton.setTitle("Add to cart", for: .normal)
        addtoCartButton.setTitleColor(.white, for: .normal)
        addtoCartButton.backgroundColor = snaxcolor
        addtoCartButton.addTarget(self, action: #selector(dismissViewControllerAndAddToCart), for: .touchUpInside)
        view.addSubview(addtoCartButton)
        
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            goBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 9),
            goBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            goBackButton.widthAnchor.constraint(equalToConstant: 20),
            goBackButton.heightAnchor.constraint(equalToConstant: 20)
            ])
        NSLayoutConstraint.activate([
            addtoCartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addtoCartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addtoCartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addtoCartButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            addtoCartButton.widthAnchor.constraint(equalTo: view.widthAnchor)])

    }
    @objc func dismissViewControllerAndSaveText(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissViewControllerAndAddToCart(){
        
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
