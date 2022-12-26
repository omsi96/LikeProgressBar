//
//  LikesProgressBar.swift
//  ThumbUpThumbDown
//
//  Created by OMAR ALIBRAHIM on 27/12/2022.
//

import SwiftUI

struct LikesProgressBar: View {
    @State var likes: Int
    @State var dislikes: Int
    
    @State var currentRate: LikeStatus = .delete
    
    var handler : (LikeStatus) -> ()
    
    func numberOfLikesWithLocalChanges() -> (likes: Int, dislikes: Int){
        switch currentRate{
        case  .like: return (likes + 1, dislikes)
        case  .dislike: return (likes, dislikes + 1)
        case .delete: return (likes, dislikes)
        }
    }
    
    private var currentProgress : Binding<CGFloat> {
        Binding {
            CGFloat(numberOfLikesWithLocalChanges().likes) / CGFloat(numberOfLikesWithLocalChanges().likes+numberOfLikesWithLocalChanges().dislikes)
        } set: {_ in
        }

    }
    
    var body: some View {
        HStack(spacing: 24) {
            ThumbButton(currentRate: $currentRate, count: numberOfLikesWithLocalChanges().likes, thumb: .up, handler: handler)

            
            ProgressBar(currentProgress: currentProgress)
            
            ThumbButton(currentRate: $currentRate, count: numberOfLikesWithLocalChanges().dislikes, thumb: .down, handler: handler)
        }
    }
}



struct LikesProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        LikesProgressBar(likes: 12, dislikes: 18){ i in
            print(i)
        }
    }
}
