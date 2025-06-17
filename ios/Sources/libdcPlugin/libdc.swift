import Foundation

@objc public class libdc: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
