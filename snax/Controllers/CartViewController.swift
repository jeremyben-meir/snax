//
//  MyCartViewController.swift
//  snax
//
//  Created by Jessica Yuan on 4/20/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    let shoppingcart = UIImage(named: "cart")
    
    let snaxcolor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
    var tableView: UITableView!
    var placeOrderButton: UIButton!
    let cartreuseidentifier = "cartItemCellReuse"
    
    var email: String
    var foodList: [MenuItem] = []
    
    init(email: String) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "My Cart"
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: cartreuseidentifier)
        view.addSubview(tableView)
        
        placeOrderButton = UIButton()
        placeOrderButton.translatesAutoresizingMaskIntoConstraints = false
        placeOrderButton.setTitle("Place Order", for: .normal)
        placeOrderButton.setTitleColor(snaxcolor, for: .normal)
        placeOrderButton.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
        view.addSubview(placeOrderButton)
        
        
        setupConstraints()
        getCartItems(email: email)
       

        // Do any additional setup after loading the view.
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
            ])
        NSLayoutConstraint.activate([
            placeOrderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placeOrderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placeOrderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            placeOrderButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20)
            

            ])
    }

    func getCartItems(email: String){
        NetworkManager.getActiveOrder(email: email) { (orderResponse) in
            if (orderResponse != nil){
                self.foodList = orderResponse!.food
            } else {
                self.foodList = []
            }
            print(self.foodList)
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func placeOrder(){
        
    }
    

}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Section: \(indexPath.section), row \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: cartreuseidentifier, for: indexPath) as! CartTableViewCell
        let item = foodList[indexPath.row]
        cell.configure(for: item)
        cell.selectionStyle = .none
        return cell
    }
    
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Food item was selected")
//        print(foodList[indexPath.row].name)
//        let menuItemViewController = MenuItemViewController(name: menu[indexPath.row].name, desc: menu[indexPath.row].description ?? "", price: menu[indexPath.row].price, email: email, restaurantName: name)
//        menuItemViewController.modalPresentationCapturesStatusBarAppearance = true
//        present(menuItemViewController, animated: true, completion: nil)
    }
}
