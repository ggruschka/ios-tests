//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var p1moves = [5,1,3,7]
var p1Set = NSSet(array: p1moves)
var p2moves = [4,9,2]
var p2Set = NSSet(array: p2moves)

var tempSet = NSSet()


let winnerPlays = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]



for play in winnerPlays{
    tempSet = NSSet(array: play)
    tempSet.isSubsetOfSet(p1Set as Set<NSObject>)
}
