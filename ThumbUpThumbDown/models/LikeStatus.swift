//
//  Thumb.swift
//  ThumbUpThumbDown
//
//  Created by OMAR ALIBRAHIM on 27/12/2022.


import Foundation

enum LikeStatus: Int, Codable{
    case delete = 0
    case like = 1
    case dislike = 2
    
    mutating func toggle(to rate: LikeStatus){
        switch (rate, self){
            case (.like, .like), (.dislike, .dislike): self = .delete
            default: self = rate
        }
    }
}
