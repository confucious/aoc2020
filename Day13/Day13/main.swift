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

@discardableResult
func scan(line: String, startTime: Int = 0) -> Int {
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
    let mostInfrequentBus = busOrder.max()!
    var test = (startTime / mostInfrequentBus) * mostInfrequentBus - targetMap[mostInfrequentBus]!
    while !matchFound {
        matchFound = busOrder.allSatisfy { (bus) -> Bool in
            isStartTimeAligned(bus: bus, startTime: test + targetMap[bus]!)
        }
        if !matchFound {
            test += mostInfrequentBus
        }
    }
    print(test)
    return test
}

func part2() {
    let line = input.split(separator: "\n").last!
    scan(line: String(line))
}

print(scan(line: "7,13,x,x,59,x,31,19") == 1068781)
print(scan(line: "17,x,13,19") == 3417)
print(scan(line: "67,7,59,61") == 754018)
print(scan(line: "67,x,7,59,61") == 779210)
print(scan(line: "67,7,x,59,61") == 1261476)
print(scan(line: "1789,37,47,1889", startTime: 1202161400) == 1202161486)
print(scan(line: "29,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,37,x,x,x,x,x,631,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,13,19,x,x,x,23,x,x,x,x,x,x,x,383,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,17",
        startTime: 100000000000000) == 1202161486)


