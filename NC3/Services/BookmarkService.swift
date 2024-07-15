//
//  BookmarkService.swift
//  NC3
//
//  Created by Gracella Noveliora on 15/07/24.
//

import Foundation
import SwiftUI

@Observable
class Bookmarks: ObservableObject {
    // yang dibookmark di save di sini
    private var locations : Set<String>
    private let key = "Bookmarks"
    
    // yg disimpen cuman namenya aja
    init() {
        locations = []
    }
    
    // cek ada ga di array
    func contains(_ location: Location) -> Bool {
        locations.contains(location.locationName)
    }
    
    // add ke array
    func add(_ location: Location) {
        locations.insert(location.locationName)
    }
    
    // remove dr array
    func remove(_ location: Location) {
        locations.remove(location.locationName)
    }
    
}
