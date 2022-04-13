// MARK: - Response
struct AlbumResponse: Codable {
    let message: AlbumMessage
}

// MARK: - Message
struct AlbumMessage: Codable {
    let header: Header
    let body: AlbumListBody
}

// MARK: - Body
struct AlbumListBody: Codable {
    let albumLists: [AlbumList]
    
    enum CodingKeys: String, CodingKey {
        case albumLists = "album_list"
    }
}

// MARK: - AlbumList
struct AlbumList: Codable {
    let album: Album
}

// MARK: - Artist
struct Album: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "album_id"
        case name = "album_name"
    }
}
