//
//  DIContainerTests.swift
//  ProjectITests
//
//  Created by Jimmy Sambuo on 4/26/24.
//

import XCTest
import ProjectI

class DIContainerTests: BaseTestCase {
    
    func testRegisterService() throws {
        // Arrange
        try DIContainer.shared.register(ExampleService2Interface.self, service: ExampleService2())
        
        // Act
        let service: ExampleService2Interface? = DIContainer.shared.resolve(ExampleService2Interface.self)
        
        // Assert
        XCTAssertNotNil(service, "Service should be resolved.")
    }

    func testServiceAlreadyRegisteredFatalError() {
        // First time, don't throw
        XCTAssertNoThrow(try DIContainer.shared.register(ExampleService2Interface.self, service: ExampleService2()))
        
        // Second time, throw
        XCTAssertThrowsError(try DIContainer.shared.register(ExampleService2Interface.self, service: ExampleService2()))
    }
}

// Example service interface and implementation
protocol ExampleService2Interface {
    func doSomething()
}

class ExampleService2: ExampleService2Interface {
    func doSomething() {}
}
