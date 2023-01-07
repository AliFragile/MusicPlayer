//
//  DataManager.swift
//  MusicPlayer
//
//  Created by Алина Ражева on 17.11.2022.
//

import UIKit

class DataManager {
    
    //Singleton для предоставления глобальной точки доступа к единственному экземпляру класса:
    static let shared = DataManager()
    
    func loadSongs() -> [Songs] {
        let songs = [
            Songs(artist: "The Weeknd",
                  trackName: "Sacrifice",
                  image: UIImage(named: "The Weeknd")!,
                  rating: 9
                 ),
            Songs(artist: "Mana Island",
                  trackName: "Dots",
                  image: UIImage(named: "Mana Island")!,
                  rating: 8
                 ),
            Songs(artist: "Washed out",
                  trackName: "Too Late",
                  image: UIImage(named: "Washed out")!,
                  rating: 7
                 )
        ]
        return songs
    }
}



