import Foundation

struct AlbumRequest: URLRequestProtocol {
    
    var artistId: Int = 52958148
    
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
            return "/ws/1.1/artist.albums.get"
    }
    
    var queryItems: [URLQueryItem]? {
            return [
                URLQueryItem(name: "artist_id", value: "\(artistId)"),
                URLQueryItem(name: "s_release_date", value: "desc"),
//                URLQueryItem(name: "page_size", value: "100"),
                URLQueryItem(name: "apikey", value: Constants.key)
            ]
    }
    
    var method: HTTPMethod {
        return .get
    }
}
