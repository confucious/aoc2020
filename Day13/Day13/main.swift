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

func isStartTimeAligned(bus: Int, startTime: Int) -> Bool {
    return startTime % bus == 0
}

func scan(line: String) {
    typealias Bus = Int
    typealias Time = Int
    var targetMap = [Bus:Time]()
    var busOrder = [Bus]()
    for (time, bus) in line.split(separator: ",").enumerated()
        .filter({ $1 != "x" })
        .map({ ($0, Int(String($1))!) }) {
        targetMap[bus] = time
        busOrder.append(bus)
    }

    var matchFound = false
    var test = 0
    while !matchFound {
        matchFound = busOrder.allSatisfy { (bus) -> Bool in
            isStartTimeAligned(bus: bus, startTime: test + targetMap[bus]!)
        }
        if !matchFound {
            test += busOrder[0]
        }
    }
    print(test)
}

func part2() {
    let line = input .split(separator: "\n").last!
    scan(line: String(line))
}

part2()
scan(line: "17,x,13,19")
scan(line: "1789,37,47,1889")

