//
//  main.swift
//  Day23
//
//  Created by Jerry Hsu on 12/23/20.
//

import Foundation


let input = "925176834"

class Element {
    let value: Int
    var next: Element!
    var prev: Element!

    init(value: Int) {
        self.value = value
    }
}


var cups = input.map { Int(String($0))! } + (10...1000000)
let maxValue = cups.max()!
let elements = cups.map { Element.init(value: $0) }
var current = elements[0]

func safeIndex(_ index: Int) -> Int {
    return (index + maxValue) % maxValue
}

func display(_ element: Element) {
    var iterator = current

    print((0..<9).reduce(into: "", { (result, _) in
        result += String(iterator.value)
        iterator = iterator.next
    }))
}
elements.enumerated().forEach { (index, element) in
    element.next = elements[safeIndex(index + 1)]
    element.prev = elements[safeIndex(index - 1)]
}

var indexed = Array<Element>(repeating: Element(value: 0), count: maxValue)
elements.forEach { (element) in
    indexed[element.value - 1] = element
}

for index in 0..<10_000_000 {
    let pickUp = [current.next!, current.next.next!, current.next.next.next!]
    let pickUpValues = pickUp.map { $0.value }
    let remaining = current.next.next.next.next!
    var search = remaining
    for offset in 1...4 {
        let targetValue = (current.value - offset < 1)
            ? current.value - offset + maxValue
            : current.value - offset
//        print("\(current.value) \(targetValue)")
        if pickUpValues.contains(targetValue) {
            continue
        }

        search = indexed[targetValue - 1]
//        while search.value != targetValue {
//            search = search.next
//        }
        break
    }
    current.next = remaining
    remaining.prev = current

    let searchNext = search.next!
    search.next = pickUp[0]
    pickUp[0].prev = search
    pickUp[2].next = searchNext
    searchNext.prev = pickUp[2]

    current = current.next

    if index % 1000000 == 0 { print(index) }
//    display(current)
}

print("\(indexed[0].value) \(indexed[0].next.value) \(indexed[0].next.next.value)")
print("\(indexed[0].next.value * indexed[0].next.next.value)")
