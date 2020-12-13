//
//  main.swift
//  Day13
//
//  Created by Jerry Hsu on 12/13/20.
//

import Foundation

func part1() {
    let lines = input.split(separator: "\n")
    let startTime = Int(String(lines[0]))!
    let times = lines[1].split(separator: ",").filter { $0 != "x" }.map { Int(String($0))! }
    var earliest = Int.max
    var bus = 0
    for test in times {
        let nextTime = ((startTime / test) + (startTime % test > 0 ? 1 : 0)) * test
        print("\(test) \(nextTime)")
        if nextTime < earliest {
            earliest = nextTime
            bus = test
        }
    }
    print("\(bus) \(earliest) = \(bus * (earliest - startTime))")
}

part1()
