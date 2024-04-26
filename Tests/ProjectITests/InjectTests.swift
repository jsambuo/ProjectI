//
//  InjectTests.swift
//  ProjectITests
//
//  Created by Jimmy Sambuo on 4/26/24.
//

import XCTest
import ProjectI

class InjectTests: BaseTestCase {
    func testInjectPropertyWrapperResolvesService() throws {
        // Arrange
        try DIContainer.shared.register(ExampleServiceInterface.self, service: MockExampleService())

        // Act
        let object = TestClass()
        
        // Assert
        XCTAssertNotNil(object.service, "Service should be resolved and not nil.")
        XCTAssertEqual(object.service.doSomething(), "Mock action performed")
    }
}

// Mock service conforming to ExampleServiceInterface
class MockExampleService: ExampleServiceInterface {
    func doSomething() -> String {
        return "Mock action performed"
    }
}

// Class using the @Inject property wrapper
class TestClass {
    @Inject var service: ExampleServiceInterface

    func performAction() -> String {
        return service.doSomething()
    }
}

public protocol ExampleServiceInterface {
    func doSomething() -> String
}
