//
//  main.swift
//  Day23
//
//  Created by Jerry Hsu on 12/23/20.
//

import Foundation


let input = "389125467"

var cups = input.map { Int(String($0))! } + (10...1000000)
let maxValue = cups.max()!
for index in 0..<10_000 {
    let current = cups[0]
    let pickUp = cups[1...3]
    let remaining = Array(cups[4...])
    var destinationIndex: Int!
    for offset in 1...4 {
        let target = current - offset < 1
            ? current - offset + maxValue
            : current - offset
//          print("\(current) \(target)")
        if pickUp.contains(target) {
            continue
        }
        destinationIndex = remaining.firstIndex { (value) -> Bool in
            value == target
        }
        break
    }
    cups = remaining[...destinationIndex]
        + pickUp
        + remaining[(destinationIndex + 1)...]
        + [current]
//    print(cups)
    if index % 1000000 == 0 { print(index) }
}
let index = cups.firstIndex(of: 1)!
print(cups[index + 1] * cups[index + 2])
