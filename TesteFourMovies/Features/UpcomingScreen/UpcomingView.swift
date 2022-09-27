//
//  UpcomingView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

final class UpcomingView: UIViewController{
    
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.black
        
        // Initialize
        let items = ["Upcoming", "Popular"]
        let segmentC = UISegmentedControl(items: items)
        segmentC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
    
        
        // Style the Segmented Control
        segmentC.layer.cornerRadius = 5.0  // Don't let background bleed
        segmentC.backgroundColor = UIColor.black
        segmentC.tintColor = UIColor.white
        
        // Add this custom Segmented Control to our view
        self.view.addSubview(segmentC)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
