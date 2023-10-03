//
//  MovieDetailsViewPopopularCollectionCell.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/30/22.
//

import Foundation
import UIKit

class MovieDetailsViewUpcomingCollectionCell: UICollectionViewCell {
    
    static let identifier = "movieDetailsViewCollectionCell"
    
    
    
     lazy var castImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .lightGray
         image.image = UIImage(named: "logomovies")
        return image
    }()
    
     lazy var castName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaaa"
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16, weight: .bold)
       return label
    }()
    
     lazy var character: UILabel = {
         let label = UILabel()
         label.textColor = .white
         label.text = "aaaaaaaaa"
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 14)
         label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        contentView.addSubview(castImage)
        contentView.addSubview(castName)
        contentView.addSubview(character)
        
        setupConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            
            castImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            castImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            castImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            castImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            castName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            castName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            castName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            character.topAnchor.constraint(equalTo: castName.bottomAnchor, constant: 1),
            character.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            character.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                       
        
        
        
        ])
        
    }
    
}
