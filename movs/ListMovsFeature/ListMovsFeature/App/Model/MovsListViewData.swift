//
//  MovsListModels.swift
//  ListMovsFeature
//
//  Created by Marcos Felipe Souza on 08/03/20.
//  Copyright © 2020 Marcos Felipe Souza. All rights reserved.
//

import Foundation

public struct MovsListViewData {
    public var items: [MovsItemViewData] = []
}


public struct MovsItemViewData {
    public var imageMovieURL: String = ""
    public var imageMovieData: Data = Data()
    public var isFavorite: Bool = false
    public var movieName: String = "No name"
}