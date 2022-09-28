//
//  UpcomingViewCollectionCell.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/28/22.
//

import Foundation
import UIKit


class UpcomingViewCollectionCell: UICollectionViewCell {
    
    static let indentifier = "upcomingCollectionCell"
    
    
    private lazy var  imageMovie: UIImageView = {
        let image = UIImageView()
    
        
        return image
    }()
    
    private lazy var nameMovieLabel: UILabel = {
        let label = UILabel()
        label.text = "nome do filme"
        
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupConstrains() {
        
        
        
    }
    
}
