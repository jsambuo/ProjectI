//
//  DIContainer.swift
//  
//
//  Created by Jimmy Sambuo on 4/26/24.
//

import Foundation

public final class DIContainer {
    private init() { }
    public static let shared = DIContainer()  // Singleton instance for global access
    private var services: [ObjectIdentifier: Any] = [:]  // Dictionary to store services
    
    func clearServices() {
        services.removeAll()
    }

    // Register a service with a specific protocol or type
    public func register<Service>(_ type: Service.Type, service: Service) throws {
        let key = ObjectIdentifier(type)
        // Use guard to check if the service is already registered
        guard services[key] == nil else {
            throw DIContainerError.serviceAlreadyRegistered
        }
        services[key] = service
    }

    // Resolve and return the service by the specified type
    public func resolve<Service>(_ type: Service.Type) -> Service? {
        let key = ObjectIdentifier(type)
        return services[key] as? Service
    }
}

public enum DIContainerError: Error {
    case serviceAlreadyRegistered
}
