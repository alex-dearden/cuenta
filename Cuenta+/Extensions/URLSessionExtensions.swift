//
//  URLSessionExtensions.swift
//  Cuenta+
//
//  Created by Alex Dearden on 22/08/2023.
//

import Foundation

extension URLSession {
    /// Decodes any type
    /// Can even infer the type if we don't provide it
    /// - Usage
    /// - Parameters:
    ///   - type: the object type we want to decode into
    ///   - from: a non-optional URL
    ///
    ///   - Returns: a decoded native object of type `T`
    ///
    /// Must be called with `try await`
    /// Errors are proagated so must be handled at calling site
    /// 
    func decode<T: Decodable>(_ type: T.Type = T.self, from url: URL) async throws -> T {
        let (data, _) = try await data(from: url)
        let decoder = JSONDecoder()
        
        let decoded = try decoder.decode(type.self, from: data)
        
        return decoded
    }
}
