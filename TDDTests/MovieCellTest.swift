//
//  MovieCellTest.swift
//  TDD
//
//  Created by Anil Kothari on 10/05/17.
//  Copyright © 2017 Anil Kothari. All rights reserved.
//

import XCTest

@testable import TDD
class MovieCellTest: XCTestCase {
    var tableView: UITableView!
    var dataSource: MockCellDataSource!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let movieLibraryVC = storyboard.instantiateViewController(withIdentifier: "MovieLibraryViewController") as! MovieLibraryViewController
        _ = movieLibraryVC.view
        
        tableView = movieLibraryVC.movieTableView
        dataSource = MockCellDataSource()
        tableView.dataSource = dataSource
    }
    
    override func tearDown() {
         super.tearDown()
    }
    
    
    func testCellConfig_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        
        cell.configMovieCell(withMovie: Movie(title: "Adventure", releaseDate: "02/24/1898"))
        
        XCTAssertEqual(cell.textLabel?.text, "Adventure")
        XCTAssertEqual(cell.detailTextLabel?.text, "02/24/1898")
    }
    
    
}
