protocol HomeServiceProtocol {
    
    func fetchArtistData(completion: @escaping (Result<ArtistResponse, RequestError>) -> Void)
    
    func fetchArtistAlbums(completion: @escaping(Result<AlbumResponse, RequestError>) -> Void)
    
    func fetchAlbumSongs(albumId: Int, completion: @escaping(Result<SongResponse, RequestError>) -> Void)
}
