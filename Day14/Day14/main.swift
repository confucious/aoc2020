//
//  main.swift
//  Day14
//
//  Created by Jerry Hsu on 12/14/20.
//

import Foundation

struct Mask {
    let mask: Int
    let values: Int

    func apply(to value: Int) -> Int {
        return value & ~mask | values
    }
}
func convertMask(maskString: String) -> Mask {
    var mask = 0
    var values = 0
    for char in maskString {
        switch char {
        case "X":
            mask = mask << 1
            values = values << 1
        case "0":
            mask = mask << 1 | 1
            values = values << 1
        case "1":
            mask = mask << 1 | 1
            values = values << 1 | 1
        default:
            fatalError("bad char in mask \(char)")
        }
    }
    return Mask(mask: mask, values: values)
}

func part1(_ input: String) {
    var mask = Mask(mask: 0, values: 0)
    var memory = [Int:Int]()
    for line in input.components(separatedBy: "\n") {
        if line.hasPrefix("mask") {
            mask = convertMask(maskString: String(line.dropFirst(7)))
        } else {
            let components = line.components(separatedBy: " = ")
            let value = Int(components[1])!
            let location = Int(components[0].dropFirst(4).dropLast())!
            memory[location] = mask.apply(to: value)
        }
    }
    print(memory.values.reduce(0, { (sum, value) in
        sum + value
    }))
}

//  part1(input)

struct Mask2 {
    let mask: Int
    let floating: [Int]
    let permutations: [Int]
    let permutationMask: Int

    static func permute(input: [Int]) -> [[Int]] {
        guard let first = input.first else {
            return []
        }
        if input.count == 1 {
            return [[], [first]]
        }
        let rest = permute(input: Array(input.dropFirst()))
        return rest + rest.map { [first] + $0 }
    }

    func apply(to value: Int) -> [Int] {
        let overwritten = value | mask
        return permutations.map {
            return overwritten & ~permutationMask | $0
        }
    }
    init(maskString: String) {
        var mask = 0
        var floating = [Int]()
        var permutationMask = 0
        for (index, char) in maskString.enumerated() {
            switch char {
            case "X":
                mask = mask << 1
                floating.append(35 - index)
                permutationMask = permutationMask << 1 | 1
            case "0":
                mask = mask << 1
                permutationMask = permutationMask << 1
            case "1":
                mask = mask << 1 | 1
                permutationMask = permutationMask << 1
            default:
                fatalError("bad char in mask \(char)")
            }
        }
        self.mask = mask
        self.floating = floating
        let permutations = Mask2.permute(input: floating)
        self.permutations = permutations.map {
            return $0.reduce(0) { (sum, index) in
                sum + Int(pow(Double(2), Double(index)))
            }
        }
        self.permutationMask = permutationMask
    }
}

func part2(_ input: String) {
    var mask = Mask2(maskString: "000000000000000000000000000000X1001X")
    var memory = [Int:Int]()
    for line in input.components(separatedBy: "\n") {
        if line.hasPrefix("mask") {
            mask = Mask2(maskString: String(line.dropFirst(7)))
        } else {
            let components = line.components(separatedBy: " = ")
            let value = Int(components[1])!
            let location = Int(components[0].dropFirst(4).dropLast())!
            mask.apply(to: location).forEach {
                memory[$0] = value
            }
        }
    }
    print(memory.values.reduce(0, { (sum, value) in
        sum + value
    }))
}

let sampleInput2 = """
mask = 000000000000000000000000000000X1001X
mem[42] = 100
mask = 00000000000000000000000000000000X0XX
mem[26] = 1
"""
part2(input)
