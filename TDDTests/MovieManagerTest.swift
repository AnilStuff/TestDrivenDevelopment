//
//  MovieManagerTest.swift
//  TDD
//
//  Created by Anil Kothari on 08/05/17.
//  Copyright © 2017 Anil Kothari. All rights reserved.
//

import XCTest
@testable import TDD
class MovieManagerTest: XCTestCase {
    var sut :MovieManager!
    
    override func setUp() {
        super.setUp()
          sut = MovieManager()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToMoviesToSeeCount_ReturnsZero()  {
        XCTAssertEqual(sut.moviesToBeSeenCount, 0)
    }
    
    func testToMoviesSeenCount_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    func testToMovieToSeeCount_ReturnsOneAfterMovieAdd(){
        sut.addMovieToLibrary(movie : Movie(title:"Action", releaseDate:"02/24/2010"))
        XCTAssertEqual(sut.moviesToBeSeenCount, 1)
    }
    
    func testMovieAtIndex(){
        sut.addMovieToLibrary(movie : Movie(title:"Horror", releaseDate:"09/12/2010"))
        let movie = sut.getMovieAtIndex(index:0)
        XCTAssertEqual(movie.title, "Horror")
    }
    
    func testMovieFavouriteCount_ReturnsZero(){
        sut.addMovieToLibrary(movie : Movie(title:"Comedy", releaseDate:"09/12/1989"))
        sut.favouriteMovieAtIndex(index:0)
        
        XCTAssertEqual(sut.moviesToBeSeenCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testRemoveMovieAfterFavouriteFromMovieToSeenList(){
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Comedy")
        
        sut.addMovieToLibrary(movie: movie1)
        sut.addMovieToLibrary(movie: movie2)
        sut.favouriteMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.getMovieAtIndex(index: 0).title, "Comedy")
        
    }
    
    func testFavouriteMovieAtIndex_ReturnFavouriteMovie(){
        
        let movie1 = Movie (title: "Sci-fi")
        
        sut.addMovieToLibrary(movie: movie1)
        sut.favouriteMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.getFavouriteMovieAtIndex(index:0).title, movie1.title)
    }
    
    
    func testClearAllArrays() {
        let movie1 = Movie (title: "Sci-fi")
        let movie2 = Movie (title: "fiction")
        sut.addMovieToLibrary(movie: movie1)
        sut.addMovieToLibrary(movie: movie2)
        sut.favouriteMovieAtIndex(index: 0)

        sut.clearAllArrays()
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToBeSeenCount, 0)

        
    }
    
}
