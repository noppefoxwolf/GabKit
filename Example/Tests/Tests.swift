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
      XCTAssertEqual(response.type, .post)
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
      if case .medias(_) = response.post.attachment {
      } else {
        XCTFail("attachment is not media")
      }
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
  struct Sample: Decodable {
    let attachment: Attachment?
  }
  
  func testDecodeMedia() {
    let json = """
{
  "attachment" : {
    "type" : "media",
    "value" : {
        "id" : "id_xxx",
        "urlThumbnail" : "thumb",
        "urlFull" : "full",
        "width" : 250,
        "height" : 120,
    }
  }
}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      if case .media(let media) = sample.attachment! {
        XCTAssertEqual(media.id, "id_xxx")
      } else {
        XCTFail("attachment is not media")
      }
    } catch {
      XCTFail(String(describing: error))
    }
  }
  
  func testDecodeMedias() {
    let json = """
{
  "attachment" : {
    "type" : "media",
    "value" : [
      {
        "id" : "id_xxx01",
        "urlThumbnail" : "thumb",
        "urlFull" : "full",
        "width" : 250,
        "height" : 120,
      },
      {
        "id" : "id_xxx02",
        "urlThumbnail" : "thumb",
        "urlFull" : "full",
        "width" : 250,
        "height" : 120,
      }
    ]
  }
}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      if case .medias(let medias) = sample.attachment! {
        XCTAssertEqual(medias[0].id, "id_xxx01")
      } else {
        XCTFail("attachment is not media")
      }
    } catch {
      XCTFail(String(describing: error))
    }
  }
  
  func testDecodeURL() {
    let json = """
{
  "attachment" : {
    "type" : "url",
    "value" : {
        "image" : "id_xxx",
        "source" : "thumb",
        "description" : "full",
        "url" : "250",
        "title" : "120",
    }
  }
}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      if case .url(let url) = sample.attachment! {
        XCTAssertEqual(url.image, "id_xxx")
      } else {
        XCTFail("attachment is not url")
      }
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testDecodeGiphy() {
    let json = """
{
  "attachment" : {
    "type" : "giphy",
    "value" : "hoge",
  }
}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      if case .giphy(let giphy) = sample.attachment! {
        XCTAssertEqual(giphy.url, "hoge")
      } else {
        XCTFail("attachment is not giphy")
      }
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testDecodeYoutube() {
    let json = """
{
  "attachment" : {
    "type" : "youtube",
    "value" : "fuga",
  }
}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      if case .youtube(let youtube) = sample.attachment! {
        XCTAssertEqual(youtube.id, "fuga")
      } else {
        XCTFail("attachment is not youtube")
      }
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testDecodeUnknown() {
    let json = """
{
  "attachment" : {
    "type" : "tumbler",
    "value" : "fuga",
  }
}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      if case .unknown = sample.attachment! {
      } else {
        XCTFail("attachment is not unknown")
      }
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testDecodeBlank() {
    let json = """
{
  "attachment" : {
    "type" : "",
    "value" : "fuga",
  }
}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      if case .unknown = sample.attachment! {
      } else {
        XCTFail("attachment is not blank")
      }
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testDecodeNil() {
    let json = """
{}
"""
    do {
      let sample = try JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
      XCTAssertNil(sample.attachment)
    } catch {
      XCTFail(String(describing: error))
    }
  }
  
  func testPostResponseTypeCodable() {
    struct Sample: Codable {
      let type: PostResponseType
    }
    let json = """
{"type":"post"}
"""
    let sample = try! JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
    XCTAssertEqual(sample.type, .post)
    let encoded = try! JSONEncoder().encode(sample)
    XCTAssertEqual(String(data: encoded, encoding: .utf8), "{\"type\":\"post\"}")
  }
  
  func testUnknownPostResponseTypeCodable() {
    struct Sample: Codable {
      let type: PostResponseType
    }
    let json = """
{"type":"retweet"}
"""
    let sample = try! JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
    XCTAssertEqual(sample.type, .unknown("retweet"))
    let encoded = try! JSONEncoder().encode(sample)
    XCTAssertEqual(String(data: encoded, encoding: .utf8), "{\"type\":\"retweet\"}")
  }
  
  func testAttachmentYoutubeCodable() {
    struct Sample: Codable {
      let attachment: Attachment.Youtube
    }
    let json = """
{"attachment":"xxxxx"}
"""
    let sample = try! JSONDecoder().decode(Sample.self, from: json.data(using: .utf8)!)
    XCTAssertEqual(sample.attachment.id, "xxxxx")
    let encoded = try! JSONEncoder().encode(sample)
    XCTAssertEqual(String(data: encoded, encoding: .utf8), "{\"attachment\":\"xxxxx\"}")
  }
}
