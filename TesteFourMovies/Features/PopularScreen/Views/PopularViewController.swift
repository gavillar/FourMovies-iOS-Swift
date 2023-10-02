//
//  PopularViewController.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

final class PopularViewController: UIViewController, ViewModelAssociatedProtocol {
    

    //MARK: - ViewModel
    typealias ViewModel = PopularViewModelProtocol
    
    var viewModel: PopularViewModelProtocol?
    
    
    //MARK: - constants
    
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
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.00)
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(nil, action: #selector(actionUpComingButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - popularButton
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
    
    
    //MARK: - popularMoviesLabel
    private lazy var popularMoviesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Movies"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    
    //MARK: - backgroundViewCollection
    private lazy var backgroundViewCollection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
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
        
        collectionView.register(PopularCollectionCell.self, forCellWithReuseIdentifier: PopularCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: popularMoviesLabel.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        
    }

   
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
       
        self.tabBarController?.tabBar.isHidden = false
        setupView()
        setupConstrains()
        moviesCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    @objc
    private func refresh() {
   //     viewModel?.fetch()
    }
    
    
    //MARK: - setupView
    func setupView() {
        
        view.addSubview(UpcomingButton)
        view.addSubview(popularButton)
        view.addSubview(removeCenterBorder)
        view.addSubview(popularMoviesLabel)
    }
    
    //MARK: - actionUpComingButton
    @objc func actionUpComingButton() {
        
        let upcomingView = UpcomingView()
        upcomingView.modalPresentationStyle = .formSheet
        present(upcomingView, animated: true)
        
    }
    
    //MARK: - setupConstrains
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
            
            popularMoviesLabel.topAnchor.constraint(equalTo: popularButton.bottomAnchor, constant: 10),
            popularMoviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            

        ])
        
    }
    
}


extension PopularViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let moviedetailsview = MovieDetailsPopularView()
//        moviedetailsview.idMovie = popularviewmodel.dataList[indexPath.row].id
//
//
//        present(moviedetailsview, animated: true)
//
//        DispatchQueue.main.async {
//            moviedetailsview.getImage(data: self.popularviewmodel.dataList[indexPath.row])
//            moviedetailsview.showResultData(data: self.popularviewmodel.dataList[indexPath.row])
//            moviedetailsview.showSubtitle(data: self.popularviewmodel.dataList[indexPath.row])
//            self.collectionView?.reloadData()
//        }
//
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCollectionCell", for: indexPath)
        as! PopularCollectionCell
//        DispatchQueue.main.async {
//            guard let viewModel = self.viewModel else { return }
//            cell.showResult(data: viewModel.dataList[indexPath.row])
//        }
        return cell
    }
}

