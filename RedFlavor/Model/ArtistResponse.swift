// MARK: - Response
struct ArtistResponse: Codable {
    let message: ArtistMessage
}

// MARK: - Message
struct ArtistMessage: Codable {
    let header: Header
    let body: ArtistBody
}

// MARK: - Body
struct ArtistBody: Codable {
    let artistLists: [ArtistList]
    
    enum CodingKeys: String, CodingKey {
        case artistLists = "artist_list"
    }
}

// MARK: - ArtistList
struct ArtistList: Codable {
    let artist: Artist
}

// MARK: - Artist
struct Artist: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "artist_id"
        case name = "artist_name"
    }
}
