//
//  MovieStructTest.swift
//  TDD
//
//  Created by Anil Kothari on 08/05/17.
//  Copyright © 2017 Anil Kothari. All rights reserved.
//

import XCTest
@testable import TDD
class MovieStructTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit_MovieTitle(){
        let movie = Movie(title:"Comedy")
        XCTAssertEqual(movie.title, "Comedy")
    }
    
    func testInit_MovieTitleAndReleaseDate(){
        let movie = Movie(title:"Story",releaseDate:"02/23/1989")
        XCTAssertEqual(movie.releaseDate, "02/23/1989")
        
    }
    
    func testMoviesAreEqual(){
        let movie1 = Movie(title : "Sci-fi")
        let movie2 = Movie(title : "Sci-fi")
        XCTAssertEqual(movie1, movie2)

    }
    
    
    func testIfMovieTitlesAreNotEqual(){
        let movie1 = Movie(title : "Romantic")
        let movie2 = Movie(title : "Documentary")
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testIfMovieDatesAreNotEqual_ReturnsNotEqual() {
        let movie1 = Movie(title : "Love Story", releaseDate: "02/23/2010")
        let movie2 = Movie(title : "Love Story",releaseDate: "04/13/1989")
        XCTAssertNotEqual(movie1, movie2)
    }
}

