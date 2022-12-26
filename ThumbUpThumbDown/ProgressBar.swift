//
//  ACProgressBar.swift
//  AyCafe (iOS)
//
//  Created by Bader Alrasheed on 03/03/2022.
//

import SwiftUI
import Foundation

let springAnimation = Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.4)

struct ProgressBar: View {
    @Binding var currentProgress: CGFloat
    
        var body: some View {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.yellow.opacity(0.3))
                        .frame(width: UIScreen.main.bounds.width*0.6, height: 6, alignment: .center)

                    
                    Rectangle()
                        .foregroundColor(Color.yellow)
                        .frame(width: UIScreen.main.bounds.width*0.6*currentProgress, height: 6, alignment: .center)
                        .animation(springAnimation, value: currentProgress)
                }
                .clipShape(Capsule())
        }
}

struct ACProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all).opacity(0.8)
            ProgressBar(currentProgress: .constant(0.4))
        }
            
    }
}
