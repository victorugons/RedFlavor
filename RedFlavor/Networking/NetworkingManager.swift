import Foundation

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    public func request<T: Decodable>(of type: T.Type = T.self, request: URLRequestProtocol, completion: @escaping (Result<T, Error>) -> Void) {
        if var baseURL = URLComponents(string: request.baseURL) {
            baseURL.path = request.path
            baseURL.queryItems = request.queryItems
            
            guard let url = baseURL.url else { return }
            
            var requestURL = URLRequest(url: url)
            requestURL.httpMethod = request.method.name
            
            let dataTask = URLSession.shared.dataTask(with: requestURL) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                
                guard let httpResponse = response as? HTTPURLResponse else { return }
                
                switch httpResponse.statusCode {
                case 200:
                    do {
                        guard let data = data else { return }

                        let decoder = JSONDecoder()
                        let responseData = try decoder.decode(type, from: data)
                        
                        completion(.success(responseData))
                    } catch {
                        completion(.failure(RequestError.decodeError))
                    }
                default:
                    break
                }
            }
            
            dataTask.resume()
        }
    }
    
}
