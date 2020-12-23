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
}

var indexed = Array<Element>(repeating: Element(value: 0), count: maxValue)
elements.forEach { (element) in
    indexed[element.value - 1] = element
}

var counter = 0
while counter < 10_000_000 {
    counter += 1
    let pickUp1 = current.next!
    let pickUp2 = pickUp1.next!
    let pickUp3 = pickUp2.next!
    let remaining = pickUp3.next!
    var search = remaining
    for offset in 1...4 {
        let targetValue = (current.value - offset < 1)
            ? current.value - offset + maxValue
            : current.value - offset
//        print("\(current.value) \(targetValue)")
        if pickUp1.value == targetValue || pickUp2.value == targetValue || pickUp3.value == targetValue {
            continue
        }

        search = indexed[targetValue - 1]
//        while search.value != targetValue {
//            search = search.next
//        }
        break
    }
    current.next = remaining

    let searchNext = search.next!
    search.next = pickUp1
    pickUp3.next = searchNext

    current = current.next

//    if index % 1000000 == 0 { print(index) }
//    display(current)
}

print("\(indexed[0].value) \(indexed[0].next.value) \(indexed[0].next.next.value)")
print("\(indexed[0].next.value * indexed[0].next.next.value)")
