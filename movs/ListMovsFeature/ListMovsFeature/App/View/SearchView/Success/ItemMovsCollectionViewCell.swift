//
//  ItemMovsCollectionViewCell.swift
//  ListMovsFeature
//
//  Created by Marcos Felipe Souza on 07/03/20.
//  Copyright © 2020 Marcos Felipe Souza. All rights reserved.
//

import UIKit
import AssertModule

class ItemMovsCollectionViewCell: UICollectionViewCell {
        
    
    var cancelProcessImage: (() -> Void)?
    
    var model: MovsItemViewData? {
        didSet {
            /// ajuste o local
            if let data = model?.imageMovieData {
                self.posterUIImageView.image = UIImage(data: data)
            }
            self.titleMovieLabel.text = model?.movieName
                        
            if model?.isFavorite ?? false {
                favoriteButton.setImage(Assets.Images.favoriteFullIcon, for: .normal)
            } else {
                favoriteButton.setImage(Assets.Images.favoriteGrayIcon, for: .normal)
            }
        }
    }
    
    var posterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Colors.blueDark
        return imageView
    }()
    
    var viewContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.blueDark
        return view
    }()
    
    var titleMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thor"
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.textAlignment = .center
        label.textColor = Colors.yellowLight
        return label
    }()
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func didTapFavoriteButton() {
        print("Favoritou")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if let cancelProcess = self.cancelProcessImage {
            cancelProcess()
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(self.posterUIImageView)
        self.addSubview(self.viewContent)
        
        self.viewContent.addSubview(self.titleMovieLabel)
        self.viewContent.addSubview(self.favoriteButton)
        self.makeConstraints()
                
    }
    
    private func makeConstraints() {        
        NSLayoutConstraint.activate([
            self.posterUIImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            self.posterUIImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            self.posterUIImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            self.posterUIImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
            self.viewContent.topAnchor.constraint(equalTo: self.posterUIImageView.bottomAnchor),
            self.viewContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.viewContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.viewContent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.titleMovieLabel.topAnchor.constraint(equalTo: self.viewContent.topAnchor),
            self.titleMovieLabel.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor),
            self.titleMovieLabel.trailingAnchor.constraint(equalTo: self.favoriteButton.leadingAnchor, constant: -2),
            self.titleMovieLabel.bottomAnchor.constraint(equalTo: self.viewContent.bottomAnchor),
            
            self.favoriteButton.heightAnchor.constraint(equalToConstant: 40),
            self.favoriteButton.widthAnchor.constraint(equalToConstant: 40),
            self.favoriteButton.centerYAnchor.constraint(equalTo: self.viewContent.centerYAnchor),
            self.favoriteButton.trailingAnchor.constraint(equalTo: self.viewContent.trailingAnchor, constant: -2)
            
        ])
    }
    
}