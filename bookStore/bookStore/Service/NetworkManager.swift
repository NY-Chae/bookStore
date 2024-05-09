//
//  Service.swift
//  bookstore
//
//  Created by 채나연 on 5/8/24.
//

import Foundation

class NetworkManager {
    func fetchRequest (title: String, completion: @escaping(Result<BookModel,Error>) -> Void) { // 함수가 끝나면(decoding)실행되는 것이 escaping closure
        
        // url string 을 가져오고
        let urlString = "https://dapi.kakao.com/v3/search/book?target=title"
        let header = ["Authorization" : "KakaoAK 8ae786beef99333e71fe2ba614ba2749"]
        
        // URL로 값(형) 변경
        if let url = URL(string: urlString) {  // 지워도 실행은 되는 코드 하지만 나는 일단 추가
            
            // (request 만들기 전에) 쿼리가 필요해 쿼리 생성: URL component
            var urlComponent = URLComponents(string: urlString)
            // 쿼리 등록
            urlComponent?.queryItems = [URLQueryItem(name: "query", value: title)]
            // request (요청) - header 가 들어간다.
            var request = URLRequest(url: urlComponent!.url!) // 강제 언래핑
            request.allHTTPHeaderFields = header
            request.httpMethod = "GET" // 대문자 GET
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) {(data, response, error) in // task setting
                if let error {
                    completion(.failure(error))
                    return
                }
                if let eclipse = data {   // eclipse = 안전하게 통신이 성공한 데이터
                    if let decodedData = try? JSONDecoder().decode(BookModel.self, from: eclipse) {
                        completion(.success(decodedData))
                        return
                    }
                }
            } // 괄호 위치를 잘 파악해서 resume 해주기
            task.resume() // resume 없으면 실행 안된다
        }
    } // api 틀(frame), 기본 setup 끝
    
}

