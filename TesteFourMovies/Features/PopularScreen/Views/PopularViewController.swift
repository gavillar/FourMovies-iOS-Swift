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
    
    var dataSource: [PopularItemCellViewModelProtocol] = []
    
    //MARK: - constants
    
    private var collectionView: UICollectionView?
   
    //MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        false
    }
    
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
        bindElements()
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
        viewModel?.fetch()
    }
    
    
    //MARK: - setupView
    func setupView() {
        view.addSubview(popularMoviesLabel)
    }
    
    
    private func bindElements() {
        viewModel?.popular.bind({ [weak self] state in
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
    func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
           
            
            popularMoviesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
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
        dataSource.count
        
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCollectionCell", for: indexPath)
            as! PopularCollectionCell
            
            let model = dataSource[indexPath.row]
            cell.viewModel = model
            return cell
        }
    }
    
    

