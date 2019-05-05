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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "My Cart"
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        placeOrderButton = UIButton()
        placeOrderButton.translatesAutoresizingMaskIntoConstraints = false
        placeOrderButton.setTitle("Place Order", for: .normal)
        placeOrderButton.setTitleColor(snaxcolor, for: .normal)
        placeOrderButton.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
        view.addSubview(placeOrderButton)
        
        
        setupConstraints()
        
       

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func placeOrder(){
        
    }
    

}
