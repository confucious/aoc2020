//
//  main.swift
//  Day9
//
//  Created by Jerry Hsu on 12/9/20.
//

import Foundation

var results: [Set<Int>] = []

func validate(windowSize: Int, index: Int) -> Bool {
    let test = input[index]
    let firstIndex = index - windowSize
    for a in input[firstIndex ..< firstIndex + windowSize - 1] {
        for b in input[firstIndex + 1 ..< firstIndex + windowSize] {
            if a + b == test {
                return true
            }
        }
    }
    return false
}

func part1() {
    for testIndex in 25 ..< input.count {
        if !validate(windowSize: 25, index: testIndex) {
            print("\(testIndex), \(input[testIndex])")
        }
    }
}

func part2() {
    let target = 507622668
    var firstIndex = 0
    var lastIndex = 1
    var runningSum = input[firstIndex]
    while firstIndex < input.count && lastIndex <= input.count && runningSum != target {
        if runningSum > target {
            runningSum -= input[firstIndex]
            firstIndex += 1
        } else {
            runningSum += input[lastIndex]
            lastIndex += 1
        }
    }
    print("Found match between indexes \(firstIndex) ..< \(lastIndex)")
    let sorted = input[firstIndex..<lastIndex].sorted()
    print("result = \(sorted.first! + sorted.last!)")
}

part2()
