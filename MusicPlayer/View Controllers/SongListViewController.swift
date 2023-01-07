//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Алина Ражева on 17.11.2022.
//


//Не сделаны отступы ячеек друг от друга, не удалены левые края

import UIKit

class SongListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!       // Tied with view в схеме MVC
    
    var songs: [Songs] = []         // Tied with model в схеме MVC
    
    let cellController = CellController()       // Экземпляр класса CellController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //добавили кнопку edit и попытались изменить размер title, но почему-то не работает код:
        navigationItem.rightBarButtonItem = editButtonItem
        self.navigationController!.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 30)]          // - НЕ РАБОТАЕТ!
        
        //Поменять цвет title у navigation Bar:
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        // Когда делаем extension и подписываем его под протокол TableViewDataSource, то нужно назначить делегата (т.е методы данного протокола будет выполнять сам класс self)
        tableView.dataSource = self
        // Инициализируем объект Songs:
        songs = DataManager.shared.loadSongs()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowSong" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let song = songs[indexPath.row]
        let songDetailVC = segue.destination as! DetailSongViewController
        songDetailVC.song = song
    }
}


// Но можно сделать в отдельном файле extension:
extension SongListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        let song = songs[indexPath.row]
        cellController.configure(cell, with: song)
        
        return cell
    }
}

// MARK: - Сделать расстояние между ячейками - НЕ РАБОТАЕТ!
extension UITableViewCell {
        
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10))
    }
}




