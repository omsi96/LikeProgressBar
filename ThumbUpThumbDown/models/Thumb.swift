//
//  Thumb.swift
//  ThumbUpThumbDown
//
//  Created by OMAR ALIBRAHIM on 27/12/2022.


import Foundation

enum Thumb {
    case up, down
    
    func imageName(filled: Bool) -> String{
        switch self{
        case .up: return filled ? "hand.thumbsup.fill" : "hand.thumbsup"
        case .down: return filled ? "hand.thumbsdown.fill" : "hand.thumbsdown"
        }
    }
}
