//
//  MovieLibraryViewControllerTest.swift
//  TDD
//
//  Created by Anil Kothari on 09/05/17.
//  Copyright © 2017 Anil Kothari. All rights reserved.
//

import XCTest
@testable import TDD
class MovieLibraryViewControllerTest: XCTestCase {
    
    var sut : MovieLibraryViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MovieLibraryViewController") as! MovieLibraryViewController
        _ = sut.view
    }
    
    override func tearDown() {
         super.tearDown()
    }
    
    func testTableViewIsNotNil(){
        XCTAssertNotNil(sut.movieTableView)
    }
    
    func testTableViewDataSource_ReturnsNonNil(){
        XCTAssertNotNil(sut.movieTableView.dataSource)
        XCTAssertTrue(sut.movieTableView.dataSource is MovieLibraryDataService)
    }
    
    func testTableViewDelegate_ReturnsNonNil(){
        XCTAssertNotNil(sut.movieTableView.delegate)
        XCTAssertTrue(sut.movieTableView.delegate is MovieLibraryDataService)
    }
}
