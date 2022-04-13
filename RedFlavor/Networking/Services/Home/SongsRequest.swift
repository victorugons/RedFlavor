import Foundation

struct SongsRequest: URLRequestProtocol {
    
    private var albumId: Int
    
    init(albumId: Int) {
        self.albumId = albumId
    }
    
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        return "/ws/1.1/album.tracks.get"
    }
    
    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "album_id", value: "\(albumId)"),
            URLQueryItem(name: "page_size", value: "100"),
            URLQueryItem(name: "apikey", value: Constants.key)
        ]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    
}
