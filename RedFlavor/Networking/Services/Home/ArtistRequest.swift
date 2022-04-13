import Foundation

struct ArtistRequest: URLRequestProtocol {
    
    var artistName: String?

    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        return "/ws/1.1/artist.search"
    }
    
    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "q_artist", value: artistName),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "apikey", value: Constants.key)
        ]
    }
    
    var method: HTTPMethod {
        return .get
    }
}
