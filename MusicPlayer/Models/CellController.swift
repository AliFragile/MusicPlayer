//
//  CellController.swift
//  MusicPlayer
//
//  Created by Алина Ражева on 17.11.2022.
//

import UIKit

class CellController: UITableViewController {
    
    // Настраиваем ячейку:
    func configure(_ cell: UITableViewCell, with song: Songs) {
        cell.textLabel?.text = song.artist
        cell.detailTextLabel?.text = song.raitingBar
        cell.imageView?.image = song.image
    }
    
    //MARK: - Убрать удаление слева
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
