//
//  MovieDetailsView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

class MovieDetailsView: UIViewController{
    
    let bannerView: UIImageView = {
        let image = UIImage(named: "")
        let banner = UIImageView(image: image)
        banner.frame = CGRect(x: 0, y: 0, width: 199, height: 50)
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.contentMode = .scaleAspectFill
        banner.backgroundColor = .blue
        return banner
    }()
    
    let titleMovie: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Teste"
        title.textColor = .white
        title.font = UIFont(name: "Arial Bold", size: 18)
        return title
    }()
    
    let yearMovie: UILabel = {
        let year = UILabel()
        year.translatesAutoresizingMaskIntoConstraints = false
        year.text = "2000"
        year.textColor = .lightGray
        year.font = UIFont(name: "Arial", size: 16)
        return year
    }()
    
    let characteristicsMovie: UILabel = {
        let characteristics = UILabel()
        characteristics.translatesAutoresizingMaskIntoConstraints = false
        characteristics.text = "109m | Animation, Adventure, Comedy"
        characteristics.textColor = .lightGray
        characteristics.font = UIFont(name: "Arial", size: 16)
        return characteristics
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setConstraints()
        view.backgroundColor = .black
    }
    
    /// This function handles the display of view elements
    private func addSubViews() {
        view.addSubview(bannerView)
        view.addSubview(titleMovie)
        view.addSubview(yearMovie)
        view.addSubview(characteristicsMovie)
    }
    
    /// This function handles the constraints of view elements
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            bannerView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(0)),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(0)),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(0)),
            bannerView.heightAnchor.constraint(equalToConstant: CGFloat(350)),
            
            titleMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: CGFloat(20)),
            titleMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(15)),
            titleMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-300)),
            
            yearMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 22),
            yearMovie.leadingAnchor.constraint(equalTo: titleMovie.trailingAnchor, constant: 10),
            
            characteristicsMovie.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 15),
            characteristicsMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            characteristicsMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
