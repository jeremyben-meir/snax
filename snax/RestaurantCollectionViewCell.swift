//
//  RestaurantCollectionViewCell.swift
//  snax
//
//  Created by Jessica Yuan on 4/21/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    var image: UIImageView!
    var overlay: UIImageView!
    var overlay2: UIImageView!
    var blur: UIImageView!
    var tags: [String]!
    var priceImage: UIImageView!
    var infoHeight: CGFloat = 40
    var times: [[Int]]!
    var nameLabel: UILabel!
    var openLabel: UILabel!
    var tagLabel: UILabel!
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8.0
        contentView.addSubview(image)
        
        overlay = UIImageView(frame: .zero)
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.contentMode = .scaleAspectFill
        overlay.clipsToBounds = true
        overlay.layer.cornerRadius = 6.0
        contentView.addSubview(overlay)
        
        overlay2 = UIImageView(frame: .zero)
        overlay2.translatesAutoresizingMaskIntoConstraints = false
        overlay2.contentMode = .scaleAspectFill
        overlay2.clipsToBounds = true
        contentView.addSubview(overlay2)
        
        blur = UIImageView(frame: .zero)
        blur.translatesAutoresizingMaskIntoConstraints = false
        blur.contentMode = .scaleAspectFill
        blur.image = UIImage(named: "Overlay")!.alpha(0.6)
        blur.clipsToBounds = true
        blur.layer.cornerRadius = 8.0
        contentView.addSubview(blur)
        
        priceImage = UIImageView(frame: .zero)
        priceImage.translatesAutoresizingMaskIntoConstraints = false
        priceImage.contentMode = .scaleAspectFit
        priceImage.clipsToBounds = true
        contentView.addSubview(priceImage)
        
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.font =  UIFont(name: "Avenir-Book", size: 12)
        contentView.addSubview(nameLabel)
        
        openLabel = UILabel()
        openLabel.translatesAutoresizingMaskIntoConstraints = false
        openLabel.textColor = .gray
        openLabel.font =  UIFont(name: "Avenir-Book", size: 9)
        contentView.addSubview(openLabel)
        
        tagLabel = UILabel()
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.textColor = .gray
        tagLabel.font =  UIFont(name: "Avenir-Book", size: 9)
        contentView.addSubview(tagLabel)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            overlay.heightAnchor.constraint(equalToConstant: 50),
            overlay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overlay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            overlay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            overlay2.topAnchor.constraint(equalTo: overlay.topAnchor),
            overlay2.leadingAnchor.constraint(equalTo: overlay.leadingAnchor),
            overlay2.trailingAnchor.constraint(equalTo: overlay.trailingAnchor),
            overlay2.heightAnchor.constraint(equalToConstant: 10)
            ])
        NSLayoutConstraint.activate([
            blur.topAnchor.constraint(equalTo: contentView.topAnchor),
            blur.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blur.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            blur.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            priceImage.heightAnchor.constraint(equalToConstant: 13),
            priceImage.widthAnchor.constraint(equalToConstant: 30),
            priceImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            priceImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
            ])
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.topAnchor.constraint(equalTo: overlay.topAnchor, constant: 5)
            ])
        NSLayoutConstraint.activate([
            openLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            openLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ])
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            tagLabel.bottomAnchor.constraint(equalTo: openLabel.topAnchor, constant: 1)
            ])
        
    }
    
    func configure(for restaurant: Restaurant){
        
        self.image.image = restaurant.image
        self.overlay.image = UIImage(named: "Overlay")
        self.overlay2.image = UIImage(named: "Overlay")
        self.nameLabel.text = restaurant.name
        self.tags = restaurant.tags
        self.times = restaurant.times
        if (!restaurant.isOpen){
            blur.isHidden = false
            openLabel.text = "Closed"
        } else {
            blur.isHidden = true
            openLabel.text = "Open"
        }
        var tagline: String = ""
        for tag in self.tags {
            tagline += tag + ", "
        }
        tagline = String(tagline.prefix(tagline.count-2))
        if (tagline.count > 40){
            tagline = tagline.prefix(37) + "..."
        }
        tagLabel.text = tagline
        self.priceImage.image = restaurant.priceImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

