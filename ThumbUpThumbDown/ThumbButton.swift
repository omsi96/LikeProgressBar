//
//  ThumbButtonView.swift
//  AyCafe (iOS)
//
//  Created by Bader Alrasheed on 03/03/2022.
//

import SwiftUI

struct ThumbButton: View {
    enum Thumb {
        case up, down
        
        func imageName(filled: Bool) -> String{
            switch self{
            case .up: return filled ? "hand.thumbsup.fill" : "hand.thumbsup"
            case .down: return filled ? "hand.thumbsdown.fill" : "hand.thumbsdown"
            }
        }
    }
    
    @Binding var currentRate: LikeStatus
    var count : Int
    var thumb : Thumb
    var handler : (LikeStatus) -> ()
    
    func shouldBeFilled() -> Bool {
        return (currentRate == .like && thumb == .up) || (currentRate == .dislike && thumb == .down)
    }
    
    var body: some View {
        Button {
            currentRate.toggle(to: thumb == .up ? .like : .dislike)
            handler(currentRate)
        } label: {
            VStack(alignment: .center, spacing: 4){
                Image(systemName: thumb.imageName(filled: shouldBeFilled()))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
                    .foregroundColor(Color.yellow)
                Text("\(count)")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(Color.gray)
                
            }
        }
    }
}


struct ThumbButton_Previews: PreviewProvider {
    static var previews: some View {
        ThumbButton(currentRate: .constant(.like), count: 13, thumb: .up) { likeStatus in
            print(likeStatus)
        }
    }
}
