//
//  MenuItemViewController.swift
//  snax
//
//  Created by Jessica Yuan on 4/26/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit
import Foundation

class MenuItemViewController: UIViewController, UITextFieldDelegate {
    
    var goBackButton: UIButton!
    var addButton: UIButton!
    var subtractButton: UIButton!
    var addtoCartButton: UIButton!
    
    var menuItemLabel: UILabel!
    var priceLabel: UILabel!
    var descLabel: UITextView!
    var quantityLabel: UILabel!
    var quantityField: UITextField!
    
    var quantity: Int! = 1
    
    var name: String!
    var desc: String!
    var price: CGFloat!
    var calculatedPrice: CGFloat!
    var restaurantName: String!
    
    var email: String!
    
    let snaxcolor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
    
    init(name: String, desc: String, price: CGFloat, email: String, restaurantName: String){
        self.name = name
        self.price = price
        self.desc = desc
        self.email = email
        self.restaurantName = restaurantName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "placeholder title"
        view.backgroundColor = .white
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        calculatedPrice = price
        
        goBackButton = UIButton()
        goBackButton.setImage(UIImage(named: "xxx"), for: .normal)
        goBackButton.translatesAutoresizingMaskIntoConstraints = false 
        goBackButton.setTitle("Go back", for: .normal)
        goBackButton.setTitleColor(.black, for: .normal)
        goBackButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(goBackButton)
        
        addButton = UIButton()
        addButton.setImage(UIImage(named: "add"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("add", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.addTarget(self, action: #selector(addQuant), for: .touchUpInside)
        view.addSubview(addButton)
        
        subtractButton = UIButton()
        subtractButton.setImage(UIImage(named: "subtract"), for: .normal)
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        subtractButton.setTitle("subtract", for: .normal)
        subtractButton.setTitleColor(.black, for: .normal)
        subtractButton.addTarget(self, action: #selector(subtractQuant), for: .touchUpInside)
        view.addSubview(subtractButton)
        
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
        menuItemLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        menuItemLabel.adjustsFontSizeToFitWidth = true
        menuItemLabel.numberOfLines = 1
        menuItemLabel.text = self.name
        view.addSubview(menuItemLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont(name: "Avenir-Book-Bold", size: 10)
        priceLabel.numberOfLines = 1
        priceLabel.text = "$\(self.calculatedPrice!)"
        view.addSubview(priceLabel)
        
        descLabel = UITextView()
        descLabel.isEditable = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.font = UIFont(name: "Avenir-Book-Bold", size: 8)
        descLabel.textColor = .gray
        descLabel.text = self.desc
        view.addSubview(descLabel)
        
        quantityLabel = UILabel()
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.font = UIFont(name: "Avenir-Book-Bold", size: 10)
        quantityLabel.text = "Quantity"
        view.addSubview(quantityLabel)
        
        quantityField = UITextField()
        quantityField.translatesAutoresizingMaskIntoConstraints = false
        quantityField.font = UIFont(name: "Avenir-Book-Bold", size: 10)
        quantityField.text = "\(quantity!)"
        quantityField.borderStyle = .roundedRect
        quantityField.textAlignment = .center
        quantityField.keyboardType = .numberPad
        quantityField.delegate = self
        quantityField.returnKeyType = .done
        quantityField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(quantityField)
        
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
            menuItemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            ])
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            priceLabel.centerYAnchor.constraint(equalTo: menuItemLabel.centerYAnchor),
            ])
        NSLayoutConstraint.activate([
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            descLabel.topAnchor.constraint(equalTo: menuItemLabel.bottomAnchor, constant: 0),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            descLabel.heightAnchor.constraint(equalToConstant: 50),
            
            ])
        NSLayoutConstraint.activate([
            quantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quantityLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 8),
            ])
        
        NSLayoutConstraint.activate([
            quantityField.leadingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),
            quantityField.trailingAnchor.constraint(equalTo: quantityLabel.trailingAnchor),
            quantityField.heightAnchor.constraint(equalToConstant: 20),
            quantityField.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 8),
            ])
        
        NSLayoutConstraint.activate([
            subtractButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            subtractButton.topAnchor.constraint(equalTo: quantityLabel.topAnchor),
            subtractButton.heightAnchor.constraint(equalToConstant: 45),
            subtractButton.widthAnchor.constraint(equalTo: subtractButton.heightAnchor)
            ])
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: subtractButton.topAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 45),
            addButton.trailingAnchor.constraint(equalTo: subtractButton.leadingAnchor, constant: -8),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
            ])
    }
    @objc func dismissViewController(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissViewControllerAndAddToCart(){
        var activeOrderId: Int! = -1
        NetworkManager.getActiveOrder(email: email!) { (id) in
            activeOrderId = id
        }
        if (activeOrderId == -1){
            NetworkManager.createOrderPost(email: email!, completion: { order in
                activeOrderId = order.id
            })
            NetworkManager.addFoodToCart(restaurantName: restaurantName, foodName: name, price: price, orderId: activeOrderId) {_ in
            }
        } else {
            NetworkManager.addFoodToCart(restaurantName: restaurantName, foodName: name, price: price, orderId: activeOrderId) {_ in
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addQuant(){
        quantity = quantity + 1
        quantityField.text = "\(quantity!)"
        calculatedPrice = price * CGFloat(quantity)
        priceLabel.text = "$\(CGFloat(round(self.calculatedPrice!*100)/100))"
    }
    
    @objc func subtractQuant(){
        if (quantity > 1) {
            quantity = quantity - 1
        }
        quantityField.text = "\(quantity!)"
        calculatedPrice = price * CGFloat(quantity)
        priceLabel.text = "$\(CGFloat(round(self.calculatedPrice!*100)/100))"
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (quantityField.text == ""){
            quantity = 1
        } else if (Int(quantityField.text!) == nil) {
            quantityField.text = String(quantityField.text!.prefix(quantityField.text!.count-1))
        } else if (Int(quantityField.text!)! > 99) {
            quantityField.text = String(quantityField.text!.prefix(quantityField.text!.count-1))
        } else {
            quantity = Int(quantityField.text!)
        }
        print(quantityField.text)
        calculatedPrice = price * CGFloat(quantity)
        priceLabel.text = "$\(CGFloat(round(self.calculatedPrice!*100)/100))"
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
    }

}
