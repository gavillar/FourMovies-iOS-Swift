//
//  UpcomingView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

final class UpcomingView: UIViewController {
    
    
    //MARK: - var and let
    let upcomingviewmodel = UpcomingViewModel()
    private var collectionView: UICollectionView?
  
    //MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        false
    }
    


    //MARK: - removeCenterBorder
    private let removeCenterBorder: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = false
        return view
    }()
    
    //MARK: - UpcomingButton
    private lazy var UpcomingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Upcoming", for: .normal)
        button.setTitleColor(UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.00), for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(actionUpComingButton), for: .touchUpInside)
       return button
    }()
    
    //MARK: - popularButton
    private lazy var popularButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Popular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.0)
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1.0)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(actionPopularButton), for: .touchUpInside)
       return button
    }()
    
    
    //MARK: - upcomingMoviesLabel
    private lazy var upcomingMoviesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Upcoming Movies"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    //MARK: - moviesCollection
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
       
        collectionView.register(UpcomingViewCollectionCell.self, forCellWithReuseIdentifier: UpcomingViewCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: upcomingMoviesLabel.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
    
    //MARK: - loadView
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.0)
        
        setupView()
        setupConstrains()
        moviesCollection()
        
        upcomingviewmodel.upcomingDelegate = self
        
    }
    
    
    //MARK: - setupView
    private func setupView() {
        
        view.addSubview(UpcomingButton)
        view.addSubview(popularButton)
        view.addSubview(removeCenterBorder)
        view.addSubview(upcomingMoviesLabel)

    }
    
    //MARK: - actionUpComingButton
    @objc private func actionUpComingButton() {
     
        
    }
    
    //MARK: - actionPopularButton
    @objc private func actionPopularButton() {
      
        let popularView = PopularViewController()
        popularView.modalPresentationStyle = .fullScreen
        present(popularView, animated: false)
    }
    
    //MARK: - setupConstrains
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
        
            UpcomingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            UpcomingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
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
            

        ])
    }
    }


extension UpcomingView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        DispatchQueue.main.async {
            let moviedetailsupomingview = MovieDetailsUpcomingView()
            moviedetailsupomingview.getImage(data: self.upcomingviewmodel.dataList[indexPath.row])
            moviedetailsupomingview.showResultData(data: self.upcomingviewmodel.dataList[indexPath.row])
            moviedetailsupomingview.showSubtitle(data: self.upcomingviewmodel.dataList[indexPath.row])
            moviedetailsupomingview.idMovie = self.upcomingviewmodel.dataList[indexPath.row].id
            self.collectionView?.reloadData()
            self.present(moviedetailsupomingview, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingviewmodel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionCell",
                                                      for: indexPath) as! UpcomingViewCollectionCell

        
        cell.showResult(data: upcomingviewmodel.dataList[indexPath.row])
        return cell
    }
}

extension UpcomingView: UpcomingProtocol {
    func getMovieData(data: [ResultMovies]) {
        self.upcomingviewmodel.dataList = data
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    
    }
    
}


