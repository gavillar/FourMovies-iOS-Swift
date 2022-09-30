//
//  PopularView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

final class PopularView: UIViewController {
    
    
    let popularviewmodel = PopularViewModel()
    
    var dataList = [Result]()
    
    override var prefersStatusBarHidden: Bool {
        false
    }
    
    
    private var collectionView: UICollectionView?
    
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    
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
        button.backgroundColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.00)
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(nil, action: #selector(actionUpComingButton), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var popularButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Popular", for: .normal)
        button.setTitleColor(UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.00), for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    
    private lazy var upcomingMoviesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Movies"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    
    private lazy var backgroundViewCollection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private func moviesCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/1.7)-4)
        
        
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
            
        }
        
        collectionView.register(PopularCollectionCell.self, forCellWithReuseIdentifier: PopularCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
        backgroundViewCollection.addSubview(collectionView)
        
        
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.00)
        
        setupView()
        setupConstrains()
        moviesCollection()
        
        popularviewmodel.popularDelegate = self
        popularviewmodel.getMovies()
    }
    
    
    func setupView() {
        
        view.addSubview(UpcomingButton)
        view.addSubview(popularButton)
        view.addSubview(removeCenterBorder)
        view.addSubview(upcomingMoviesLabel)
        view.addSubview(backgroundViewCollection)
        
    }
    
    @objc func actionUpComingButton() {
        
        let upcomingView = UpcomingView()
        upcomingView.modalPresentationStyle = .fullScreen
        present(upcomingView, animated: true)
        
    }    
    
    func setupConstrains() {
        
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
            
            upcomingMoviesLabel.topAnchor.constraint(equalTo: popularButton.bottomAnchor, constant: 10),
            upcomingMoviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            backgroundViewCollection.topAnchor.constraint(equalTo: upcomingMoviesLabel.bottomAnchor, constant: 20),
            backgroundViewCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundViewCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            
            
        ])
        
    }
    
}


extension PopularView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let moviedetailsview = MovieDetailsView()
        moviedetailsview.idMovie = dataList[indexPath.row].id
        
        
        present(moviedetailsview, animated: true)
        
        DispatchQueue.main.async {
            moviedetailsview.getImage(data: self.dataList[indexPath.row])
            moviedetailsview.showResultData(data: self.dataList[indexPath.row])
            moviedetailsview.showSubtitle(data: self.dataList[indexPath.row])
            self.collectionView?.reloadData()
        }
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCollectionCell", for: indexPath)
        as! PopularCollectionCell
        DispatchQueue.main.async {
            cell.showResult(data: self.dataList[indexPath.row])
        }
        return cell
    }
}

extension PopularView: PopularProtocol {
    func getMovieData(data: [Result]) {
        self.dataList = data
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
}



