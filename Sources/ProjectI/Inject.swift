//
//  Inject.swift
//  
//
//  Created by Jimmy Sambuo on 4/26/24.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    private var service: T?

    public init() {
        self.service = DIContainer.shared.resolve(T.self)
        guard self.service != nil else {
            fatalError("Dependency '\(T.self)' not registered.")
        }
    }

    public var wrappedValue: T {
        get {
            guard let service = service else {
                fatalError("Attempted to access an uninitialized dependency: \(T.self).")
            }
            return service
        }
        set {
            service = newValue
        }
    }
}
