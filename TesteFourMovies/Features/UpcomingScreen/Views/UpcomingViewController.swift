//
//  UpcomingViewController.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

final class UpcomingViewController: UIViewController, ViewModelAssociatedProtocol {
    
    typealias ViewModel = UpcomingViewModelProtocol
    
    var viewModel: ViewModel?
    
    //MARK: - var and let
    
    var dataSource: [UpcomingItemCellViewModelProtocol] = []
    
    private var collectionView: UICollectionView?
  
    //MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        false
    }

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
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindElements()
        setupView()
        setupConstrains()
        moviesCollection()
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    
    @objc
    private func refresh() {
        viewModel?.fetch()
    }
    
    //MARK: - setupView
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.0)
        view.addSubview(upcomingMoviesLabel)

    }
    
    
    private func bindElements() {
        
        viewModel?.upcoming.bind({ [weak self] state in
            
            guard let self = self else { return }
            switch state {
            case .none:
                ()
        
            case .loading:
                ()
            case .finished(let data):
               
                self.dataSource = data
                self.collectionView?.reloadData()
            case .failed:
                ()
            }
        })
            
    }
    
    //MARK: - setupConstrains
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
    
            upcomingMoviesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            upcomingMoviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
        ])
    }
    }


extension UpcomingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        DispatchQueue.main.async {
//            let moviedetailsupomingview = MovieDetailsUpcomingView()
//            moviedetailsupomingview.getImage(data: self.upcomingviewmodel.dataList[indexPath.row])
//            moviedetailsupomingview.showResultData(data: self.upcomingviewmodel.dataList[indexPath.row])
//            moviedetailsupomingview.showSubtitle(data: self.upcomingviewmodel.dataList[indexPath.row])
//            moviedetailsupomingview.idMovie = self.upcomingviewmodel.dataList[indexPath.row].id
//            self.collectionView?.reloadData()
//            self.present(moviedetailsupomingview, animated: true)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionCell",
                                                      for: indexPath) as! UpcomingViewCollectionCell

        let model = dataSource[indexPath.row]
        cell.viewModel = model
        return cell
    }
}



