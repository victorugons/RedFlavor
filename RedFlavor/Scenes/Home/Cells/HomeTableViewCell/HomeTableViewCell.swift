//
//  HomeTableViewCell.swift
//  RedFlavor
//
//  Created by Aloc SP11602 on 09/04/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = "HomeTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var songsCollectionView: UICollectionView!
    
    var albumList: AlbumList?
    var songLists: [SongList] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerNib() {
        let nib = UINib(nibName: SongCollectionViewCell.identifier, bundle: nil)
        songsCollectionView.register(nib, forCellWithReuseIdentifier: SongCollectionViewCell.identifier)
    }
    
    func setupCell(albumList: AlbumList, songLists: [SongList]?) {
        self.albumList = albumList
        self.songLists = songLists ?? []
        DispatchQueue.main.async {
            self.titleLabel.text = self.albumList?.album.name ?? ""
            self.songsCollectionView.reloadData()
        }
    }
    
}

extension HomeTableViewCell: UICollectionViewDelegate {
}

extension HomeTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = songsCollectionView.dequeueReusableCell(withReuseIdentifier: SongCollectionViewCell.identifier, for: indexPath) as? SongCollectionViewCell else { return UICollectionViewCell() }
        cell.setupSong(songList: songLists[indexPath.row])
        
        
        return cell
    }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(140)
        let height = CGFloat(200)
        
        return CGSize(width: width, height: height)
    }
}
