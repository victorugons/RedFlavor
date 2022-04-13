//
//  SongCollectionViewCell.swift
//  RedFlavor
//
//  Created by Aloc SP11602 on 09/04/22.
//

import UIKit

class SongCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SongCollectionViewCell"

    @IBOutlet weak var albumCoverImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupSong(songList: SongList){
        nameLabel.text = songList.track.name
    }

}
