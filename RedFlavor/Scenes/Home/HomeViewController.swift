import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var albumLists: [AlbumList] = []
    
    let service: HomeService = HomeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Red Flavor"
        fetchAlbums()
        delegates()
        registerNib()
    }
    
    private func delegates() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    private func registerNib() {
        let nib = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    private func fetchAlbums() {
        service.fetchArtistAlbums(completion: {
            result in
            
            switch result {
            case .success(let albums):
                self.albumLists = albums.message.body.albumLists
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
            }
            case .failure(let error): print(error)
            }
        })
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
        
        service.fetchAlbumSongs(albumId: self.albumLists[indexPath.row].album.id, completion: {
            result in
            
            switch result {
            case .success(let songs):
                let songLists: [SongList] = songs.message.body.trackLists
                cell.setupCell(albumList: self.albumLists[indexPath.row], songLists: songLists)
            case .failure(let error):
                print(error)
                cell.setupCell(albumList: self.albumLists[indexPath.row], songLists: nil)
            }
        })
        cell.registerNib()
        
        return cell
    }
    
}
