//
//  main.swift
//  Day15
//
//  Created by Jerry Hsu on 12/15/20.
//

import Foundation

func part1() {
    var input = "9,19,1,6,0,5,4".split(separator: ",").map { Int(String($0))! }
    for index in (input.count) ..< 2020 {
        let last = input[index - 1]
        let reversed = input.reversed().dropFirst()
        if let lastIndex = reversed.firstIndex(of: last) {
            let distance = reversed.distance(from: reversed.startIndex, to: lastIndex) + 1
            print("\(index): \(distance)")
            input.append(distance)
        } else {
            print("\(index): 0")
            input.append(0)
        }
    }
}

func part2() {
    let input = "9,19,1,6,0,5,4".split(separator: ",").map { Int(String($0))! }
    var indexMap = [Int:Int]()
    input.dropLast().enumerated().forEach { indexMap[$1] = $0 }
    var last = (input.last!, input.count - 1)
    var previousLast: (Int, Int) = last
    for index in (input.count) ..< 30000000 {
        if let lastIndex = indexMap[previousLast.0] {
            let distance = index - lastIndex - 1
            last = (distance, index)
        } else {
            last = (0, index)
        }
        indexMap[previousLast.0] = previousLast.1
        previousLast = last
//        print("\(index): \(last)")


    }
    print(last)
}

func part2b() {
    let input = "9,19,1,6,0,5,4".split(separator: ",").map { Int(String($0))! }
    var indexMap = Array<Int>(repeating: -1, count: 30000000)
    input.dropLast().enumerated().forEach { indexMap[$1] = $0 }
    var last = (input.last!, input.count - 1)
    var previousLast: (Int, Int) = last
    for index in (input.count) ..< 30000000 {
        let lastIndex = indexMap[previousLast.0]
        if lastIndex >= 0  {
            let distance = index - lastIndex - 1
            last = (distance, index)
        } else {
            last = (0, index)
        }
        indexMap[previousLast.0] = previousLast.1
        previousLast = last
//        print("\(index): \(last)")


    }
    print(last)
}

part2b()
