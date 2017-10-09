import XCTest
@testable import Cheers

class CheerTests: XCTestCase {
  func testImageGenerators() {
    let generator = ImageGenerator()
    let allShapes = Particle.ConfettiShape.all
    allShapes.forEach { shape in
        XCTAssertNotNil(generator.confetti(shape: shape), "Shape \(shape) was nil.")
    }
  }

  func testCheerView() {
    let parent = UIView()
    let cheerView = CheerView()
    parent.addSubview(cheerView)
    XCTAssertEqual(cheerView.config.colors.count, 7)
    XCTAssertFalse(cheerView.isUserInteractionEnabled)

    XCTAssertNil(cheerView.emitter)
    cheerView.start()
    XCTAssertNotNil(cheerView.emitter)
    cheerView.stop()
    XCTAssertNotNil(cheerView.emitter)
  }

    func testShuffle() {
        let originalArray = [1, 2, 3, 4, 5]
        let shuffled = originalArray.shuffled()

        // Ensure that they have equal count
        XCTAssertEqual(originalArray.count, shuffled.count)

        // Ensure that no entries were added/removed — only moved around.
        // 1: first, verify that the test data was well-formed.
        XCTAssertEqual(
            originalArray.count,
            Set(originalArray).count,
            "Test data failure: originalArray must only contain unique values for this test to work properly."
        )
        // 2: now, verify that the shuffled entries are the same as the non-shuffled entries.
        let uniqueShuffled = Set(shuffled)
        XCTAssertEqual(uniqueShuffled, Set(originalArray))
    }

    func testCombineEntries() {
        let lhs = [1, 2, 3, 4]
        let rhs = ["a", "b", "c"]
        let combinations = Array<(Int, String)>.createAllCombinations(from: lhs, and: rhs)

        // Ensure that we have the right count.
        XCTAssertEqual(lhs.count * rhs.count, combinations.count)

        // Ensure that all possible combinations are included.
        let allPossibleCombinations: [(Int, String)] = [
            (1, "a"),
            (1, "b"),
            (1, "c"),
            (2, "a"),
            (2, "b"),
            (2, "c"),
            (3, "a"),
            (3, "b"),
            (3, "c"),
            (4, "a"),
            (4, "b"),
            (4, "c"),
        ]
        allPossibleCombinations.forEach { testCombination in
            let match = combinations.first(where: { (int: Int, str: String) -> Bool in
                return int == testCombination.0 && str == testCombination.1
            })
            XCTAssertNotNil(match, "No match for testCombination \(testCombination)")
        }
    }
}
