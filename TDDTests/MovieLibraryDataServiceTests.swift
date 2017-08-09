//
//  MovieLibraryDataServiceTests.swift
//  TDD
//
//  Created by Anil Kothari on 09/05/17.
//  Copyright © 2017 Anil Kothari. All rights reserved.
//

import XCTest

@testable import TDD
class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var tableview : UITableView!
    var movieLibraryVC : MovieLibraryViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        movieLibraryVC = storyboard.instantiateViewController(withIdentifier: "MovieLibraryViewController") as! MovieLibraryViewController
        
        _ = movieLibraryVC.view
        
        
        tableview = movieLibraryVC.movieTableView
        tableview.dataSource = sut
        tableview.delegate = sut
        

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testTableViewSectionCount_ShouldReturnTwo(){
     
        let sectionCount = tableview.numberOfSections
        XCTAssertEqual(sectionCount, 2)
        
    }
    
    func testRowCountInSectionOne_ShouldEqualMoviesToSeeCount() {
        XCTAssertEqual(tableview.numberOfRows(inSection: 0), 5)
    }
    
    func testRowCountInSectionTwo_ShouldEqualMoviesSeenCount() {
        XCTAssertEqual(tableview.numberOfRows(inSection: 1), 0)
    }
    
    
    func testCellForRowAtIndexPath_ShouldReturnMovieCell(){
        sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Romantic"))

        tableview.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableview.cellForRow(at:indexPath)
        
        XCTAssertTrue(cell is MovieCell)
    }
    
    func testCell_ShouldDequeCell(){
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = sut
         sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Romantic"))
        tableViewMock.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 0)

        _ = tableViewMock.cellForRow(at: indexPath)
        
        XCTAssertTrue(tableViewMock.cellDequeProperly)
    }
    
    func testCell_ConfigMockCell(){
        
        let tableviewMock = TableViewMock.initializeTableViewMock()
        tableviewMock.dataSource = sut
        
        let movie = Movie(title: "Horror")
        sut.movieManager.addMovieToLibrary(movie: movie)
        tableviewMock.reloadData()
        
        let cell = tableviewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
         cell.configMovieCell(withMovie: movie)
        
         XCTAssertEqual(cell.movie, movie)
      }
    
    
    func testCell_ShouldReturnFavouriteMovieCell(){
        let tableviewMock = TableViewMock.initializeTableViewMock()
        tableviewMock.dataSource = sut
        
        let movie = Movie(title: "Horror")
        sut.movieManager.addMovieToLibrary(movie: movie)
        
        sut.movieManager.favouriteMovieAtIndex(index: 0)
        tableviewMock.reloadData()

        let cell = tableviewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movie, movie)
    }

    func testFavouriteAMovie_ShouldFavMovieOnCellSelect(){
        
        sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Biography"))
        sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Horror"))
        
        tableview.delegate?.tableView!(tableview, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToBeSeenCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(tableview.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableview.numberOfRows(inSection: 1), 1)
        
    }
 
    
    
    
    func testTableviewHasCorrectSectionTitles(){
         let section1Title = tableview.dataSource?.tableView!(tableview, titleForHeaderInSection: 0)
        let section2Title = tableview.dataSource?.tableView!(tableview, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To Seen")
        XCTAssertEqual(section2Title, "Movies Seen")

        
    }
}
