//
//  DetailSongViewController.swift
//  MusicPlayer
//
//  Created by Алина Ражева on 17.11.2022.
//

import UIKit
import AVFoundation

class DetailSongViewController: UIViewController {
    
    @IBOutlet var mainStackView: UIStackView!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var songLabel: UILabel!
    @IBOutlet var songSlider: UISlider!
    
    var song: Songs!
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //apple рукомендует все делать через обработчика ошибок:
        do {
            switch song.trackName {
            case "Sacrifice":
            if let audioPath = Bundle.main.path(forResource: "the weeknd - sacrifice", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                songSlider.maximumValue = Float(player.duration)
            }
            case "Dots":
                if let audioPath = Bundle.main.path(forResource: "mana island - dots", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    songSlider.maximumValue = Float(player.duration)
                }
            case "Too Late":
                if let audioPath = Bundle.main.path(forResource: "washed out - too late", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    songSlider.maximumValue = Float(player.duration)
                }
            default:  break
            }
        } catch {
            print("Error!")
        }
        
        updateUI(with: view.bounds.size)
        player.play()
    }
    
    //Еще один метод, который вызывается при повороте экрана, чтобы и в горизонтальном положении все было четко:
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(with: size)
    }
    
    @IBAction func playButton() {
        player.play()
    }
    
    @IBAction func pauseButton() {
        player.pause()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        if sender == songSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
}
 
 extension DetailSongViewController {
     
     //Зависит от ориентации устройства:
     func updateUI(with size: CGSize) {
         let isVertical = size.width < size.height
         mainStackView.axis = isVertical ? .vertical : .horizontal
         
         title = song.artist
         imageView.image = song.image
         artistLabel.text = song.artist
         songLabel.text = song.trackName
     }
 }
 

 

