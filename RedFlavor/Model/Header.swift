import Foundation

// MARK: - Header
struct Header: Codable {
    let statusCode: Int
    let executeTime: Double
    let available: Int
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case executeTime = "execute_time"
        case available
    }
}
