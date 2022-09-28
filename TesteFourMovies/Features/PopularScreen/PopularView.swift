//
//  PopularView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

class PopularView: UIViewController {
    
        // MARK: - Atributtes
    
    private let removeCenterBorder: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = false
        return view
    }()
    
    private lazy var UpcomingButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Upcoming", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(actionUpComingButton), for: .touchUpInside)
       return button
    }()
    
    private lazy var popularButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Popular", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(actionPopularButton), for: .touchUpInside)
       return button
    }()
    
    private lazy var popularMoviesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Movies"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    private lazy var movieCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.itemSize = CGSize(width: 100, height: 150)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor(red: 51.00/255.00, green: 51.00/255.00, blue: 51.00/255.00, alpha: 1.00)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        
        view.backgroundColor = UIColor(red: 31.00/255.00, green: 31.00/255.00, blue: 31.00/255.00, alpha: 1.00)
    }
        
    // MARK: - Functions
        
    @objc func actionUpComingButton() {
     
    }
    
    @objc func actionPopularButton() {
      
    }
    
    func addSubviews() {
        view.addSubview(UpcomingButton)
        view.addSubview(popularButton)
        view.addSubview(popularMoviesLabel)
        view.addSubview(removeCenterBorder)
        view.addSubview(movieCollectionView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            UpcomingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            UpcomingButton.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            UpcomingButton.widthAnchor.constraint(equalToConstant: 110),
            
            popularButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            popularButton.leadingAnchor.constraint(equalTo: UpcomingButton.trailingAnchor, constant: -10),
            popularButton.widthAnchor.constraint(equalToConstant: 110),
        
            removeCenterBorder.topAnchor.constraint(equalTo: popularButton.topAnchor, constant: 1),
            removeCenterBorder.bottomAnchor.constraint(equalTo: popularButton.bottomAnchor, constant: -1),
            removeCenterBorder.leadingAnchor.constraint(equalTo: popularButton.leadingAnchor),
            removeCenterBorder.widthAnchor.constraint(equalToConstant: 3),
            
            popularMoviesLabel.topAnchor.constraint(equalTo: popularButton.bottomAnchor, constant: 20),
            popularMoviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            movieCollectionView.topAnchor.constraint(equalTo: popularMoviesLabel.bottomAnchor, constant: 20),
            movieCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
        
}
