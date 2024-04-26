//
//  BaseTestCase.swift
//  ProjectITests
//
//  Created by Jimmy Sambuo on 4/26/24.
//

import XCTest
@testable import ProjectI

class BaseTestCase: XCTestCase {
    override func setUp() {
        super.setUp()
        DIContainer.shared.clearServices()
    }
    
    override func tearDown() {
        super.tearDown()
        DIContainer.shared.clearServices()
    }
}
