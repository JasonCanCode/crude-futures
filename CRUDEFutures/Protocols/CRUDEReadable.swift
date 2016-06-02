//
//  CRUDEReadable.swift
//  CRUDE-Futures
//
//  Created by Jason Welch on 6/2/16.
//  Copyright © 2016 Jason Welch. All rights reserved.
//

import BrightFutures

public protocol CRUDEReadable: CRUDERequestable {
    var readPath: String { get }
    func readFromServer() -> Future<Self, NSError>
    static func readFromServerWithId(idNumber: Int) -> Future<Self, NSError>
}

extension CRUDEReadable {
    public var readPath: String { return CRUDE.baseURL + "\(Self.path)/\(id)" }

    public func readFromServer() -> Future<Self, NSError> {
        return CRUDE.requestObject(.GET, readPath) as Future<Self, NSError>
    }

    public static func readFromServerWithId(idNumber: Int) -> Future<Self, NSError> {
        let path = CRUDE.baseURL + "\(Self.path)/\(idNumber)"
        return CRUDE.requestObject(.GET, path) as Future<Self, NSError>
    }
}
