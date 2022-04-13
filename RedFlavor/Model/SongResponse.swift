// MARK: - Response
struct SongResponse: Codable {
    let message: SongMessage
}

// MARK: - Message
struct SongMessage: Codable {
    let header: Header
    let body: SongListBody
}

// MARK: - Body
struct SongListBody: Codable {
    let trackLists: [SongList]
    
    enum CodingKeys: String, CodingKey {
        case trackLists = "track_list"
    }
}

// MARK: - AlbumList
struct SongList: Codable {
    let track: Song
}

// MARK: - Artist
struct Song: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "track_id"
        case name = "track_name"
    }
}
