//
//  ProfilePictureView.swift
//  ClubhouseSpeakerRing
//
//  Created by Alex Nagy on 22.04.2021.
//

import SwiftUI

struct ProfilePictureView: View {
    
    @Binding var isSpeaking: Bool
    
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var isSpeakingRingHidden = true
    
    var body: some View {
        VStack {
            ZStack {
                
                Rectangle()
                    .fill(Color(red: 213/255, green: 207/255, blue: 185/255))
                    .frame(width: 230, height: 230)
                    .mask(
                        RoundedRectangle(cornerRadius: 96, style: .continuous)
                    )
                    .opacity(isSpeakingRingHidden ? 0 : 1)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 215, height: 215)
                    .mask(
                        RoundedRectangle(cornerRadius: 93, style: .continuous)
                    )
                
                Image("omid-armin-4DiseDE96mY-unsplash")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .mask(
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                    )
            }
        }
        .frame(width: 230, height: 230)
        .onReceive(timer) { (_) in
            if isSpeaking {
                let random = Int.random(in: 0...2)
                if random % 2 == 0 {
                    isSpeakingRingHidden.toggle()
                }
            }
        }
        .onChange(of: isSpeaking) { (isSpeaking) in
            isSpeakingRingHidden = !isSpeaking
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
}
