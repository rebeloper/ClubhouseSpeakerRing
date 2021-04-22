//
//  ContentView.swift
//  ClubhouseSpeakerRing
//
//  Created by Alex Nagy on 22.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSpeaking = false
    
    var body: some View {
        VStack {
            ProfilePictureView(isSpeaking: $isSpeaking)
                .onTapGesture {
                    isSpeaking.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
