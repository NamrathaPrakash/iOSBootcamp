import SwiftUI

// MARK: - HEADER MODEL

struct Header:Codable, Identifiable {
  let id = UUID()
  var image: String
  var headline: String
  var subheadline: String
}
