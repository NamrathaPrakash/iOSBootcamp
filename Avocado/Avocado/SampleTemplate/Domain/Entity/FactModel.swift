//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Codable, Identifiable {
  let id = UUID()
  var image: String
  var content: String 
}
