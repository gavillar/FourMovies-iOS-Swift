//
//  MovieDetailsView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

class MovieDetailsView: UIViewController{
    
    private var collectionView: UICollectionView?
    
    private lazy var bannerView: UIImageView = {
        let image = UIImage(named: "")
        let banner = UIImageView(image: image)
        banner.frame = CGRect(x: 0, y: 0, width: 199, height: 50)
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.contentMode = .scaleAspectFill
        banner.backgroundColor = .blue
        return banner
    }()
    
    private lazy var titleMovie: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Teste"
        title.textColor = .white
        title.font = UIFont(name: "Arial Bold", size: 18)
        return title
    }()
    
    private lazy var yearMovie: UILabel = {
        let year = UILabel()
        year.translatesAutoresizingMaskIntoConstraints = false
        year.text = "2000"
        year.textColor = .lightGray
        year.font = UIFont(name: "Arial", size: 16)
        return year
    }()
    
    private lazy var characteristicsMovie: UILabel = {
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
        view.backgroundColor = UIColor(red: 0.098, green: 0.106, blue: 0.114, alpha: 1)
        return view
    }()
    
    private lazy var viewInScroll: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.098, green: 0.106, blue: 0.114, alpha: 1)
        
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
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
     
        collectionView.backgroundColor = UIColor(red: 0.098, green: 0.106, blue: 0.114, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: characteristicsMovie.bottomAnchor, constant: 15).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    private lazy var line: UIView = {
        
        let createLine = {() -> UIView in
            
            let line = UIView()
            line.backgroundColor = .darkGray
            line.translatesAutoresizingMaskIntoConstraints = false
            return line
        }
        
        let line: UIView = createLine()
        
        return line
    }()
    
    private lazy var synopsisLabel: UILabel = {
        let synopsis = UILabel()
        synopsis.translatesAutoresizingMaskIntoConstraints = false
        synopsis.text = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        synopsis.textColor = .white
        synopsis.numberOfLines = 0
        synopsis.sizeToFit()
        synopsis.font = UIFont(name: "Arial", size: 15)
        return synopsis
    }()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor(red: 0.098, green: 0.106, blue: 0.114, alpha: 1)
        addSubViews()
        setConstraints()
        castCollection()
        
    }
    
    /// This function handles the display of view elements
    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(bannerView)
        backgroundView.addSubview(titleMovie)
        backgroundView.addSubview(yearMovie)
        backgroundView.addSubview(characteristicsMovie)
        backgroundView.addSubview(line)
        backgroundView.addSubview(viewInScroll)
        backgroundView.addSubview(synopsisLabel)
        
    }
    
    /// This function handles the constraints of view elements
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        
            bannerView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: CGFloat(0)),
            bannerView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: CGFloat(0)),
            bannerView.heightAnchor.constraint(equalToConstant: 300),
            
            titleMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            titleMovie.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            titleMovie.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -300),
            
            yearMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 22),
            yearMovie.leadingAnchor.constraint(equalTo: titleMovie.trailingAnchor, constant: 10),
            
            characteristicsMovie.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 15),
            characteristicsMovie.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            characteristicsMovie.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            
            line.topAnchor.constraint(equalTo: characteristicsMovie.bottomAnchor, constant: 230),
            line.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15),
            line.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            line.heightAnchor.constraint(equalToConstant: 0.5),
            
            viewInScroll.topAnchor.constraint(equalTo: line.bottomAnchor),
            viewInScroll.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            viewInScroll.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            viewInScroll.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            synopsisLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 15),
            synopsisLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 15),
            synopsisLabel.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: -15),
            synopsisLabel.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -20),
        
            
           
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

