//
//  MainView.swift
//  Avocado
//
//  Created by Namratha Prakash on 07/04/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            SampleView1()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avocado")
                }
            
            SampleView2()
                .tabItem {
                    Image("tabicon-book")
                    Text("Recipies")
                }
            
            SampleView3()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripining")
                }
            
            SampleView4()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainView()
}
