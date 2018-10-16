import XCTest
@testable import GabKit

class JSONMappingTests: XCTestCase {
  func testPostResponse() {
    let bundle = Bundle(for: type(of: self))
    let url = bundle.url(forResource: "CreatePostResponse", withExtension: "json")!
    //let json = try! String(contentsOf: url)
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .iso8601
    do {
      let response = try decoder.decode(PostResponse.self, from: data)
      XCTAssertEqual(response.id, "eabfbfac-ff32-47ae-995d-7cd7847723eb")
      XCTAssertEqual(response.publishedAt.timeIntervalSince1970, 1538607473)
      XCTAssertEqual(response.type, "post")
      XCTAssertEqual(response.actuser.id, 1)
      XCTAssertEqual(response.actuser.name, "Sample User")
      XCTAssertEqual(response.actuser.username, "sample-user")
      XCTAssertEqual(response.actuser.pictureUrl, "https://files.gab.com/file/files-gab/user/sample-user.jpeg")
      XCTAssertTrue(response.actuser.verified)
      XCTAssertTrue(response.actuser.isDonor)
      XCTAssertTrue(response.actuser.isInvestor)
      XCTAssertTrue(response.actuser.isPro)
      XCTAssertTrue(response.actuser.isPrivate)
      XCTAssertTrue(response.actuser.isPremium)
      XCTAssertEqual(response.post.id, 2358345)
      XCTAssertEqual(response.post.createdAt.timeIntervalSince1970, 1538607473)
      XCTAssertNil(response.post.revisedAt)
      XCTAssertEqual(response.post.body, "Sample post with multiple media attachments")
      XCTAssertEqual(response.post.attachment.type, AttachmentType.media)
      //複数と単数の場合があるかも
      //XCTAssertEqual(response.post.attachment.value!.count, 2)
    } catch {
      XCTAssertThrowsError(error)
      print(error)
    }
  }
}

class StringExetnsionTests: XCTestCase {
  func testSnakeToCamelCase() {
    XCTAssertEqual("user_profile".camelCase, "userProfile")
  }
  
  func testKebabToCamelCase() {
    XCTAssertEqual("user-profile".camelCase, "userProfile")
  }
}

class AttachmentTypeTests: XCTestCase {
  func testIsEqual() {
    XCTAssertEqual(AttachmentType.media, AttachmentType.media)
  }
}
