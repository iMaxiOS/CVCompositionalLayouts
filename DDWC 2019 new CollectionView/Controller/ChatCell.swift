//
//  ChatCell.swift
//  DDWC 2019 new CollectionView
//
//  Created by Maxim Granchenko on 14.01.2020.
//  Copyright © 2020 Maxim Granchenko. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    static var reuseID = "ChatCell"
    
    private let gradientView: GradientView = {
        let gradient = GradientView(from: .topLeading, to: .bottomTrailing, inColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), toColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        gradient.translatesAutoresizingMaskIntoConstraints = false
        return gradient
    }()
    
    private let photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        clipsToBounds = true
        backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        setupConstraints()
    }
    
    public func setupModel(section: MChat) {
        photoImage.image = UIImage(named: section.friendImage)
        topLabel.text = section.friendName
        bottomLabel.text = section.lastMessage
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: - extension

extension ChatCell {
    fileprivate func setupConstraints() {
        addSubview(photoImage)
        addSubview(topLabel)
        addSubview(bottomLabel)
        addSubview(gradientView)
        
        photoImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        photoImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        topLabel.leadingAnchor.constraint(equalTo: photoImage.trailingAnchor, constant: 10).isActive = true
        topLabel.topAnchor.constraint(equalTo: photoImage.topAnchor, constant: 10).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 10).isActive = true
        
        bottomLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor).isActive = true
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 4).isActive = true
        
        gradientView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        gradientView.widthAnchor.constraint(equalToConstant: 8).isActive = true
    }
}
