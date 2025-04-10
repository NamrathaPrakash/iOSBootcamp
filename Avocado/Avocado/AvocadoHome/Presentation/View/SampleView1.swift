//
//  SampleView1.swift
//  Avocado
//
//  Created by Namratha Prakash on 07/04/25.
//

import SwiftUI

struct SampleView1: View {
    var body: some View {
        ZStack {
            Image("launchscreen_image")
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    SampleView1()
}
