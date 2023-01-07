//
//  Songs.swift
//  MusicPlayer
//
//  Created by Алина Ражева on 17.11.2022.
//

import UIKit

struct Songs {
    
    let artist: String
    let trackName: String
    let image: UIImage
    let rating: Int
    
    var raitingBar: String {
        return String(repeating: "⭐️", count: rating)
    }
    
}
