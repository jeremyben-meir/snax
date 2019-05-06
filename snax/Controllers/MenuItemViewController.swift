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
    
    var menuItemLabel: UILabel!
    var priceLabel: UILabel!
    var descLabel: UILabel!
    var quantityLabel: UILabel!
    
    var name: String!
    var desc: String!
    var price: CGFloat!
    
    let snaxcolor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
    
    init(name: String, desc: String, price: CGFloat){
        self.name = name
        self.price = price
        self.desc = desc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "placeholder title"
        view.backgroundColor = .white
        
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
        
        menuItemLabel = UILabel()
        menuItemLabel.translatesAutoresizingMaskIntoConstraints = false
        menuItemLabel.font = UIFont(name: "Avenir-Book-Bold", size: 30)
        menuItemLabel.numberOfLines = 1
        menuItemLabel.text = self.name
        view.addSubview(menuItemLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont(name: "Avenir-Book-Bold", size: 10)
        priceLabel.numberOfLines = 1
        priceLabel.text = "$\(self.price!)"
        view.addSubview(priceLabel)
        
        descLabel = UILabel()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.font = UIFont(name: "Avenir-Book-Bold", size: 10)
        descLabel.textColor = .gray
        descLabel.text = self.desc
        view.addSubview(descLabel)
        
        quantityLabel = UILabel()
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.font = UIFont(name: "Avenir-Book-Bold", size: 10)
        quantityLabel.text = "Quantity"
        view.addSubview(quantityLabel)
        
        setupConstraints()
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
        NSLayoutConstraint.activate([
            menuItemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            menuItemLabel.topAnchor.constraint(equalTo: goBackButton.bottomAnchor, constant: 8),
            //menuItemLabel.widthAnchor.constraint(equalToConstant: 20),
            //menuItemLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            priceLabel.topAnchor.constraint(equalTo: goBackButton.bottomAnchor, constant: 8),
            ])
        NSLayoutConstraint.activate([
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            descLabel.topAnchor.constraint(equalTo: menuItemLabel.bottomAnchor, constant: 8),
            ])
        NSLayoutConstraint.activate([
            quantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            quantityLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 8),
            ])
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
