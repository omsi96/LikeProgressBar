//
//  ContentView.swift
//  ThumbUpThumbDown
//
//  Created by OMAR ALIBRAHIM on 27/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LikesProgressBar(likes: 1, dislikes: 4) { likeStatus in
                print(likeStatus)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all).opacity(0.8)
            ContentView()
        }
    }
}
