//
//  PopularViewCollectionCell.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/29/22.
//


import Foundation
import UIKit


class PopularCollectionCell: UICollectionViewCell {
    
    static let identifier = "popularCollectionCell"
    
        
    
     lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .lightGray
        return image
    }()
    
     lazy var dataMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00/00/00"
        label.textColor = .white
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
       return label
    }()
    
     lazy var titleMovie: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "A volta dos que não foram"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        contentView.addSubview(titleMovie)
        contentView.addSubview(imageMovie)
        contentView.addSubview(dataMovie)
        
        setupConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func showResult(data: ResultMovies) {
        
        titleMovie.text = data.title
        dataMovie.text = data.releaseDate
        
        guard let poster = data.posterPath else {
            
            return
        }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w342"+poster) else {

                return

            }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) {
                   (data,req,error) in
                   do {
                       var datas = try data 
        
                       DispatchQueue.main.async {
                           self.imageMovie.image = UIImage(data: datas!)
                       }
                       } catch {
                          
                           print("Não foi possível completar a requisição de imagens")
        
                       }
               }.resume()
        
               }
        
    
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            
            imageMovie.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageMovie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageMovie.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.80),
            
            dataMovie.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dataMovie.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            dataMovie.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.90),
            dataMovie.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.10),
            
            titleMovie.topAnchor.constraint(equalTo: imageMovie.bottomAnchor),
            titleMovie.leadingAnchor.constraint(equalTo: imageMovie.leadingAnchor),
            titleMovie.trailingAnchor.constraint(equalTo: imageMovie.trailingAnchor),
            titleMovie.heightAnchor.constraint(equalToConstant: 50)
            
         
                       
        
        
        
        ])
        
    }
    
}
