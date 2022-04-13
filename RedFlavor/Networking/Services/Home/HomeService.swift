class HomeService: HomeServiceProtocol {
    func fetchArtistData(completion: @escaping (Result<ArtistResponse, RequestError>) -> Void) {
        let request = ArtistRequest()
        
        NetworkingManager.shared.request(of: ArtistResponse.self, request: request, completion: {
            result in
            
            switch result {
            case .success(let response): completion(.success(response))
            case .failure(let error): completion(.failure(error as? RequestError ?? RequestError.defaultError))
            }
            
        })
    }
    
    func fetchArtistAlbums(completion: @escaping (Result<AlbumResponse, RequestError>) -> Void) {
        let request = AlbumRequest()
        
        NetworkingManager.shared.request(of: AlbumResponse.self, request: request, completion: {
            result in
            
            switch result {
            case .success(let response): completion(.success(response))
            case .failure(let error): completion(.failure(error as? RequestError ?? RequestError.defaultError))
            }
            
        })
    }
    
    func fetchAlbumSongs(albumId: Int, completion: @escaping (Result<SongResponse, RequestError>) -> Void) {
        let request = SongsRequest(albumId: albumId)
        
        NetworkingManager.shared.request(of: SongResponse.self, request: request, completion: {
            result in
            
            switch result {
            case .success(let response): completion(.success(response))
            case .failure(let error): completion(.failure(error as? RequestError ?? RequestError.defaultError))
            }
            
        })
    }
    
    
}
