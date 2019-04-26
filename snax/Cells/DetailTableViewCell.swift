//
//  DetailTableViewCell.swift
//  snax
//
//  Created by Jessica Yuan on 4/26/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    var menuItemNameLabel: UILabel!
    var menuItemDescriptionLabel: UILabel!
    var menuItemPriceLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        menuItemNameLabel = UILabel()
        menuItemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        menuItemNameLabel.font = UIFont(name: "Avenir-Book-Bold", size: 14)
        contentView.addSubview(menuItemNameLabel)
        menuItemNameLabel.lineBreakMode = .byWordWrapping
        menuItemNameLabel.numberOfLines = 0
        
        menuItemDescriptionLabel = UILabel()
        menuItemDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        menuItemDescriptionLabel.font = UIFont(name: "Avenir-Book", size: 12)
        menuItemDescriptionLabel.textColor = .gray
        menuItemDescriptionLabel.preferredMaxLayoutWidth = 100
        menuItemDescriptionLabel.adjustsFontSizeToFitWidth = true
        menuItemDescriptionLabel.lineBreakMode = .byWordWrapping
        menuItemDescriptionLabel.numberOfLines = 0

        contentView.addSubview(menuItemDescriptionLabel)
        
        menuItemPriceLabel = UILabel()
        menuItemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        menuItemPriceLabel.font = UIFont(name: "Avenir-Book", size: 12)
        menuItemPriceLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(menuItemPriceLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            menuItemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            menuItemNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            menuItemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            menuItemNameLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        NSLayoutConstraint.activate([
            menuItemDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            menuItemDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            menuItemDescriptionLabel.topAnchor.constraint(equalTo: menuItemNameLabel.bottomAnchor, constant: 2),
            menuItemDescriptionLabel.heightAnchor.constraint(equalToConstant: 45)
            ])
        NSLayoutConstraint.activate([
            menuItemPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            menuItemPriceLabel.topAnchor.constraint(equalTo: menuItemDescriptionLabel.bottomAnchor, constant: 5),
            menuItemPriceLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for menuitem : MenuItem){
            menuItemNameLabel.text = menuitem.name
            menuItemPriceLabel.text = "$\(menuitem.price)"
            menuItemDescriptionLabel.text = menuitem.description
        }

    }
    

    
        // Configure the view for the selected state



