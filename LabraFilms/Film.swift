//
//  Film.swift
//  LabraFilms
//
//  Created by vlad on 8/22/17.
//  Copyright © 2017 vlad. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Film {
    let title: String!
    let posterPath: String!
    let backdropPath: String!
    let average: Double!
    let overview: String!
    let id: Int!
    let releaseDate: String!
    
    init?(json: JSON) {
        guard let title = json["original_title"].string,
            let average = json["vote_average"].double,
            let backdropPath = json["backdrop_path"].string,
            let posterPath = json["poster_path"].string,
            let releaseDate = json["release_date"].string,
            let overview = json["overview"].string,
            let id = json["id"].int else {
                return nil
        }
        self.title = title
        self.average = average
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.id = id
    }
    
    static func parseJSON (json: JSON) -> [Film] {
        var returnArray: [Film] = []
        if let resultArray = json["results"].array {
            for movie in resultArray {
                if let unwrapedJSON = Film(json: movie) {
                    returnArray.append(unwrapedJSON)
                }
            }
        }
        return returnArray
    }

}
