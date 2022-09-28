//
//  UpcomingView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

final class UpcomingView: UIViewController{
    

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
        button.setTitleColor(.black, for: .selected)
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
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.backgroundColor = .black
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(actionPopularButton), for: .touchUpInside)
       return button
    }()
    
    
    
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.black
        
        setupView()
        setupConstrains()
        
        getApi()
        
      
    }
    
    func getApi() {
        
       
        
        
        
    }
    
    func setupView() {
        
        view.addSubview(UpcomingButton)
        view.addSubview(popularButton)
        view.addSubview(removeCenterBorder)
        
    }
    
    @objc func actionUpComingButton() {
        UpcomingButton.isSelected.toggle()
        
        
        if UpcomingButton.isSelected {
            
            UpcomingButton.backgroundColor = .white
            removeCenterBorder.isHidden = true
        } else {
            
            UpcomingButton.backgroundColor = .black
            removeCenterBorder.isHidden = false
        }
        
    }
    
    @objc func actionPopularButton() {
        popularButton.isSelected.toggle()
        
        if popularButton.isSelected {
            
            popularButton.backgroundColor = .white
            removeCenterBorder.isHidden = true
        } else {
            
            popularButton.backgroundColor = .black
            removeCenterBorder.isHidden = false
        }
        
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
            removeCenterBorder.widthAnchor.constraint(equalToConstant: 5)
            ])
        
        
            }
            
            }
