//
//  FilterCollectionViewCell.swift
//  snax
//
//  Created by Jessica Yuan on 4/21/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

//
//  FilterCollectionViewCell.swift
//  jsb459_p5
//
//  Created by Jeremy Ben-Meir on 3/26/19.
//  Copyright © 2019 Jeremy Ben-Meir. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel!
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
        label.font =  UIFont(name: "Avenir-Book", size: 12)
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.layer.borderColor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0).cgColor
        contentView.addSubview(label)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    }
    
    func configure(for filter: Filter){
        label.text = filter.title
    }
    
    func toggleColor(){
        if(label.backgroundColor == .white){
            label.backgroundColor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
            label.textColor = .white
            label.layer.borderWidth = 1
        } else {
            label.backgroundColor = .white
            label.textColor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
            label.layer.borderWidth = 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

