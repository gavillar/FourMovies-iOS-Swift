//
//  MovieDetailsView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

class MovieDetailsView: UIViewController{
    
    private var collectionView: UICollectionView?
    
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
    
    private lazy var backgroundView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()

    private func castCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
     
        collectionView.backgroundColor = .darkGray
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .black
        addSubViews()
        setConstraints()
        castCollection()
        
    }
    
    /// This function handles the display of view elements
    private func addSubViews() {
        view.addSubview(bannerView)
        view.addSubview(titleMovie)
        view.addSubview(yearMovie)
        view.addSubview(characteristicsMovie)
        view.addSubview(backgroundView)
    }
    
    /// This function handles the constraints of view elements
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            bannerView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(0)),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(0)),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(0)),
            bannerView.heightAnchor.constraint(equalToConstant: CGFloat(300)),
            
            titleMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: CGFloat(20)),
            titleMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(15)),
            titleMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-300)),
            
            yearMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 22),
            yearMovie.leadingAnchor.constraint(equalTo: titleMovie.trailingAnchor, constant: 10),
            
            characteristicsMovie.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 15),
            characteristicsMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            characteristicsMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            backgroundView.topAnchor.constraint(equalTo: characteristicsMovie.bottomAnchor, constant: 20),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            
           
        ])
    }
    
}

extension MovieDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.contentView.backgroundColor = .lightGray
        
        return cell
    }
    
    
}
