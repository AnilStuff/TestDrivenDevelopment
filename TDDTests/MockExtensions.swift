//
//  MockExtensions.swift
//  TDD
//
//  Created by Anil Kothari on 10/05/17.
//  Copyright © 2017 Anil Kothari. All rights reserved.
//

import Foundation
import UIKit

@testable import TDD

extension MovieLibraryDataServiceTests{
    
    class TableViewMock : UITableView{
        var cellDequeProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell{
            cellDequeProperly = true
            
            return super.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath)
        }
        
        class func initializeTableViewMock() -> TableViewMock{
            
            let tableViewMock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            tableViewMock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return tableViewMock
        }
    }
    
    class MovieCellMock : MovieCell{
        var movie : Movie?
        
       override func configMovieCell(withMovie:Movie){
            movie = withMovie
        }
    }
}



extension MovieCellTest {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

