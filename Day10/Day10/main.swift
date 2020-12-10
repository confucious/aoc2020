//
//  main.swift
//  Day10
//
//  Created by Jerry Hsu on 12/10/20.
//

import Foundation

struct Adapter {
    let value: Int
    let otherAdapters: [Int]
}

var adapterMap: [Int:Adapter] = [:]

func buildAdapters(input: [Int]) -> [Adapter] {
    return (input + [0]).map { (value) in
        Adapter(
            value: value,
            otherAdapters: [
                input.contains(value + 1) ? value + 1 : nil,
                input.contains(value + 2) ? value + 2 : nil,
                input.contains(value + 3) ? value + 3 : nil,
            ].compactMap { $0 }
        )
    }
}

var memo: [Int:Int] = [:] // value to count
func count(adapter: Adapter) -> Int {
    if let memoCount = memo[adapter.value] {
        return memoCount
    }
    if adapter.otherAdapters.count == 0 {
        memo[adapter.value] = 1
        return 1
    }
    let result = adapter.otherAdapters.reduce(0) { (sum, value) in
        sum + count(adapter: adapterMap[value]!)
    }
    memo[adapter.value] = result
    return result
}

func part2() {
    let adapters = buildAdapters(input: input)
    adapters.forEach { (adapter) in
        adapterMap[adapter.value] = adapter
    }
    print(count(adapter: adapterMap[0]!))
}


part2()
