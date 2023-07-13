//
//  MovieDetailsView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

class MovieDetailsPopularView: UIViewController{
    
    
    var idMovie: Int?
    var castArray: [Cast]?
    
    private var collectionView: UICollectionView?
    
    
    private lazy var bannerView: UIImageView = {
        let image = UIImage(named: "")
        let banner = UIImageView(image: image)
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
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 0
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
    
    private lazy var viewInScroll: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        collectionView.register(MovieDetailsViewPopularCollectionCell.self, forCellWithReuseIdentifier: MovieDetailsViewPopularCollectionCell.identifier)
        
        collectionView.backgroundColor = UIColor(red: 0.098, green: 0.106, blue: 0.114, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        viewInScroll.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: characteristicsMovie.bottomAnchor, constant: 15).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: -15).isActive = true
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
        synopsis.text = "synopsis"
        synopsis.textColor = .white
        synopsis.numberOfLines = 0
        synopsis.sizeToFit()
        synopsis.font = UIFont(name: "Arial", size: 15)
        return synopsis
    }()
    
    override func loadView() {
        super.loadView()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(red: 0.098, green: 0.106, blue: 0.114, alpha: 1)
        addSubViews()
        setConstraints()
        castCollection()
        showCredit()
    }
    
    
    func getImage(data: Result) {
        
        guard let poster = data.posterPath else {return}
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/original"+poster) else {return}
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data,req,error) in
            let datas = data
            guard let datas = data else {return}
            
            DispatchQueue.main.async {
                self.bannerView.image = UIImage(data: datas)
            }
        }
    }
    func showResultData(data: Result) {
        
        titleMovie.text = data.title
        yearMovie.text = data.releaseDate
        synopsisLabel.text = data.overview
        
        guard let poster = data.posterPath else {return}
    }
    func showSubtitle(data: Result) {
        
        guard let id = data.id else {return}
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=644c3fb568510b2779c8f2b277ed5f25") else {return}
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) {
            (data,req,error) in
            do {
                var result = try JSONDecoder().decode(MovieDetails.self, from: data!)
                print(result)
                
                var genres: [String] = []
                
                guard let runtime = result.runtime else {return}
                guard let genresFiles = result.genres else {return}
                
                for genre in genresFiles {
                    guard let genreName = genre.name else {return}
                    genres.append(genreName)
                }
                
                var genreCatergory = "\(runtime)m | "
                
                for i in 0..<genres.count {
                    if i < genres.count - 1 {
                        genreCatergory += "\(genres[i]), "
                    } else {
                        genreCatergory += "\(genres[i]) "
                    }
                    
                }
                
                DispatchQueue.main.async {
                    self.characteristicsMovie.text = genreCatergory
                }
                
            } catch {
                
            }
        }.resume()
        
        
    }
    
    func showCredit() {
        
        guard let id = idMovie else {
            
            return
        }
        
        
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=644c3fb568510b2779c8f2b277ed5f25") else {
            
            return
            
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) {
            (data,req,error) in
            do {
                var datas = try JSONDecoder().decode(Credits.self, from: data!)
                
                
                self.castArray = datas.cast
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            } catch {
                
            }
        }.resume()
    }
    
    
    func showProfileImage(cast: Cast?, cell: MovieDetailsViewPopularCollectionCell) {
        
        guard let profile = cast?.profilePath else {return}
        guard let url = URL(string: "https://image.tmdb.org/t/p/original"+profile) else {return}
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data,req,error) in
            
            var datas = data
            guard let image = datas else {return}
            
            DispatchQueue.main.async {
                cell.castImage.image = UIImage(data: image)
            }
        }
    }
    
    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubview(bannerView)
        viewInScroll.addSubview(titleMovie)
        viewInScroll.addSubview(yearMovie)
        viewInScroll.addSubview(characteristicsMovie)
        viewInScroll.addSubview(line)
        viewInScroll.addSubview(synopsisLabel)
        
    }
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewInScroll.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            viewInScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            viewInScroll.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewInScroll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
            bannerView.topAnchor.constraint(equalTo: viewInScroll.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: CGFloat(0)),
            bannerView.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(0)),
            bannerView.heightAnchor.constraint(equalToConstant: 300),
            
            titleMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 155),
            titleMovie.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 15),
            titleMovie.trailingAnchor.constraint(equalTo: yearMovie.leadingAnchor, constant: -10),
            
            yearMovie.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 157),
            yearMovie.leadingAnchor.constraint(equalTo: titleMovie.trailingAnchor, constant: 10),
            yearMovie.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: -15),
            yearMovie.widthAnchor.constraint(equalToConstant: 90),
            
            characteristicsMovie.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 15),
            characteristicsMovie.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 15),
            characteristicsMovie.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: -20),
            
            line.topAnchor.constraint(equalTo: characteristicsMovie.bottomAnchor, constant: 230),
            line.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: -15),
            line.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 15),
            line.heightAnchor.constraint(equalToConstant: 0.5),
            
            synopsisLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 15),
            synopsisLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 15),
            synopsisLabel.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: -15),
            synopsisLabel.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -20),
            
            
        ])
    }
}
        
        
extension MovieDetailsPopularView: UICollectionViewDelegate, UICollectionViewDataSource {
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return castArray?.count ?? 0
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieDetailsViewCollectionCell", for: indexPath) as! MovieDetailsViewPopularCollectionCell
                DispatchQueue.main.async {
                    cell.castName.text = self.castArray?[indexPath.row].name
                    cell.character.text = self.castArray?[indexPath.row].character
                    self.showProfileImage(cast: self.castArray?[indexPath.row], cell: cell)
                }
                return cell
            }
        }


