import XCTest
@testable import SwiftDevNotes


final class SwiftDevNotesTests: XCTestCase {

    struct FooNotOptional: Foo {
        let value: String
        init(value: String) { self.value = value }
    }

    struct FooOptional: Foo {
        let value: String?
        init(value: String? = nil) { self.value = value }
    }

    func testSanity() throws {
        XCTAssertEqual(FooNotOptional(value: "Hello").message, "NOT OPTIONAL Hello")
        XCTAssertEqual(FooOptional(value: "Hello").message, "IS OPTIONAL Hello")
        XCTAssertEqual(FooOptional().message, "IS OPTIONAL nil")
    }
}
