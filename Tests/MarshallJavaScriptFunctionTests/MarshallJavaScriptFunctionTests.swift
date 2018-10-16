import XCTest
@testable import MarshallJavaScriptFunction

final class MarshallJavaScriptFunctionTests: XCTestCase {

    func testEmpty() {
        let expected = "empty()"
        let test = jsCallString(function: "empty")
        XCTAssert(expected == test, "empty test")
    }

    func testString() {
        let expected = "string(\"abc\\\\xy\\nz\")"
        let test = jsCallString(function: "string", arguments: "abc\\xy\nz")
        XCTAssert(expected == test, "string test")
    }

    func testNumbers() {
        let expected = "numbers(1, 2, 3.456)"
        let test = jsCallString(function: "numbers", arguments: 1, 2, 3.456)
        XCTAssert(expected == test, "numbers test")
    }

    func testBooleans() {
        let expected = "booleans(true, false)"
        let test = jsCallString(function: "booleans", arguments: true, false)
        XCTAssert(expected == test, "booleans test")
    }

    func testArray() {
        let expected = "array([1, 2, 3, \"abc\"])"
        let test = jsCallString(function: "array", arguments: [1, 2, 3, "abc"])
        XCTAssert(expected == test, "array test")
    }

    func testDictionaries1() {
        let expected = ["goodDictionary([", "\"zero\": false", "\"three\": \"I\\\\I\\\\I\"", "\"abc\": 1", "])"]
        let test = jsCallString(function: "goodDictionary", arguments: ["zero":false, "abc": 1, "three": "I\\I\\I"])

        expected.forEach {
            XCTAssert(test.contains($0), "dic1 test \($0)")
        }
    }

    func testDictionaries2() {
        let expected = ["nastyDictionary([", "\"three\": 4", "\"1\": \"zero\"", "\"9.99\": 0.99", "])"]
        let test = jsCallString(function: "nastyDictionary", arguments: [1:"zero", "three": 4, 9.99:0.99])

        expected.forEach {
            XCTAssert(test.contains($0), "dic2 test \($0)")
        }
    }


}
