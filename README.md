# GabKit

[![CI Status](https://img.shields.io/travis/noppefoxwolf/GabKit.svg?style=flat)](https://travis-ci.org/noppefoxwolf/GabKit)
[![Version](https://img.shields.io/cocoapods/v/GabKit.svg?style=flat)](https://cocoapods.org/pods/GabKit)
[![License](https://img.shields.io/cocoapods/l/GabKit.svg?style=flat)](https://cocoapods.org/pods/GabKit)
[![Platform](https://img.shields.io/cocoapods/p/GabKit.svg?style=flat)](https://cocoapods.org/pods/GabKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

GabKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GabKit'
```

## Usage

### Authorize

```swift
let gab = Gab(clientID: Secret.clientID,
                clientSecret: Secret.clientSecret,
                scopes: .read, .notifications, .writePost)
gab.authorize(withPresentingFrom: self)
```

Add your callback url as url scheme to info.plist.

```
<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>gabkit</string>
			</array>
		</dict>
	</array>
```

Handle URL in AppDelegate.

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    Gab.handleURL(url)
    return true
}
```

### Get Main feed

```swift
gab.getMainFeed(success: { (response) in
})
```

### Create Post

```swift
gab.createPost(body: "hello gab.")
```

## Author

noppefoxwolf, noppelabs@gmail.com

## License

GabKit is available under the MIT license. See the LICENSE file for more info.

## TODO

- [x] authorize
- [x] create post
- [ ] convenience upload image and publish post
- [x] engaging with other users
- [x] feeds
- [x] group
- [x] notificaitons
- [x] popular
- [x] reacting to posts
- [x] request
- [x] user details
- [x] support ios
- [ ] support osx
- [ ] support linux
- [x] support cocoapods
- [x] support carthage
- [ ] support swift package manager
- [x] codable

- supported attachment type
  - [x] media
  - [x] media array
  - [x] url
  - [x] giphy
  - [x] youtube
