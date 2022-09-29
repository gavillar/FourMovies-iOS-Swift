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
//        button.addTarget(self, action: #selector(actionPopularButton), for: .touchUpInside)
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
    
    private lazy var backgroundCollectionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51.00/255.00, green: 51.00/255.00, blue: 51.00/255.00, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 25
        collectionViewLayout.minimumInteritemSpacing = 5
        collectionViewLayout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                               height: (view.frame.size.width/2)-4)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor(red: 51.00/255.00, green: 51.00/255.00, blue: 51.00/255.00, alpha: 1.00)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
//    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
//        moviesCollection()
        
        view.backgroundColor = UIColor(red: 31.00/255.00, green: 31.00/255.00, blue: 31.00/255.00, alpha: 1.00)
  
    }
        
    // MARK: - Functions
        
    @objc func actionUpComingButton() {
        
        let upcomingView = UpcomingView()
        upcomingView.modalPresentationStyle = .fullScreen
        present(upcomingView, animated: true)
    }
    
    @objc func actionPopularButton() {
      
    }
    
    @objc func actionMovieDetails() {
        
        let movieDetailsView = MovieDetailsView()
        movieDetailsView.modalPresentationStyle = .fullScreen
        present(movieDetailsView, animated: true)
    }
    
    func addSubviews() {
        view.addSubview(UpcomingButton)
        view.addSubview(popularButton)
        view.addSubview(popularMoviesLabel)
        view.addSubview(removeCenterBorder)
        view.addSubview(collectionView)
//        view.addSubview(backgroundCollectionView)
    }
    
//    func moviesCollection() {
//        let collectionLayout = UICollectionViewFlowLayout()
//        collectionLayout.scrollDirection = .vertical
//        collectionLayout.minimumLineSpacing = 50
//        collectionLayout.minimumInteritemSpacing = 5
//        collectionLayout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
//                                              height: (view.frame.size.width/2)-4)
//
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
//        guard let collectionView = collectionView else {return}
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.frame = view.bounds
//        collectionView.backgroundColor = UIColor(red: 51.00/255.00, green: 51.00/255.00, blue: 51.00/255.00, alpha: 1.00)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        backgroundCollectionView.addSubview(collectionView)
//    }
//
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
            
            collectionView.topAnchor.constraint(equalTo: popularMoviesLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
//            backgroundCollectionView.topAnchor.constraint(equalTo: popularMoviesLabel.bottomAnchor, constant: 20),
//            backgroundCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            backgroundCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            backgroundCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
        
}

extension PopularView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemYellow
        return cell
    }
    
    
}
