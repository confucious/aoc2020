//
//  main.swift
//  Day25
//
//  Created by Jerry Hsu on 12/25/20.
//

import Foundation

func search(publicKey: Int) -> Int {
    var loop = 0
    let subject = 7
    var value = 1
    while value != publicKey {
        loop += 1
        value = value * subject % 20201227
        print("\(loop): \(value) vs \(publicKey)")
    }
    return loop
}

func transform(publicKey: Int, loopSize: Int) -> Int {
    var loop = 0
    var value = 1
    while loop < loopSize {
        loop += 1
        value = value * publicKey % 20201227
        print("\(loop): \(value) vs \(publicKey)")
    }
    return value
}

let cardKey = 9093927 //4535884: 9093927 vs 9093927
let doorKey = 11001876

//print(transform(publicKey: 17807724, loopSize: 8))
let cardPrivate = 4535884 //search(publicKey: cardKey)
print(transform(publicKey: doorKey, loopSize: cardPrivate))

