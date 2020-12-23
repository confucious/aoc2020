//
//  main.swift
//  Day23
//
//  Created by Jerry Hsu on 12/23/20.
//

import Foundation


let input = "925176834"

let maxValue = 1_000_000
var elements = Array<Int>(repeating: 0, count: maxValue + 1)
var cups = input.map { Int(String($0))! }
var current = cups[0]
cups.enumerated().forEach { (index, value) in
    if index == 8 {
        elements[value] = 10
    } else {
        elements[value] = cups[index + 1]
    }
}
(10..<maxValue).forEach { elements[$0] = $0 + 1 }
elements[maxValue] = current

func safeIndex(_ index: Int) -> Int {
    return (index + maxValue) % maxValue
}

var counter = 0
while counter < 10_000_000 {
    counter += 1
    let pickUp1 = elements[current]
    let pickUp2 = elements[pickUp1]
    let pickUp3 = elements[pickUp2]
    let remaining = elements[pickUp3]
    var search = 0
    for offset in 1...4 {
        let targetValue = (current - offset < 1)
            ? current - offset + maxValue
            : current - offset
//        print("\(current.value) \(targetValue)")
        if pickUp1 == targetValue || pickUp2 == targetValue || pickUp3 == targetValue {
            continue
        }

        search = targetValue
        break
    }
    elements[current] = remaining

    let searchNext = elements[search]
    elements[search] = pickUp1
    elements[pickUp3] = searchNext

    current = elements[current]

//    if index % 1000000 == 0 { print(index) }
//    display(current)
}

print("\(elements[1]) \(elements[elements[1]])")
print("\(elements[1] * elements[elements[1]])")
