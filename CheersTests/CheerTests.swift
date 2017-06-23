import XCTest
@testable import Cheers

class CheerTests: XCTestCase {
  func testImageGenerators() {
    let generator = ImageGenerator()
    XCTAssertNotNil(generator.rectangle())
    XCTAssertNotNil(generator.circle())
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
}
