//
//  main.swift
//  Day19
//
//  Created by Jerry Hsu on 12/19/20.
//

import Foundation

indirect enum Rule {
    case leaf(Character)
    case subrules([[String]])
}

struct RuleSet {
    let ruleSet: [String:Rule]

    // Evaluate rule against input and return remaining matches.
    // Return nil if we run out of characters.
    func consume(_ input: String, rule: String) -> String? {
        switch ruleSet[rule]! {
        case let .leaf(character):
            if let testChar = input.first,
               testChar == character {
                return String(input.dropFirst())
            } else {
                return nil
            }
        case let .subrules(subrules):
            for subruleList in subrules {
                var remaining: String? = input
                for subrule in subruleList {
                    remaining = consume(remaining!, rule: subrule)
                    if remaining == nil {
                        break
                    }
                }
                if remaining != nil {
                    return remaining
                }
            }
            return nil
        }
    }
}

func parse(_ input: String) -> RuleSet {
    var result = [String:Rule]()
    for line in input.components(separatedBy: "\n") {
        let components = line.components(separatedBy: ": ")
        if components[1].hasPrefix("\"") {
            result[components[0]] = .leaf(components[1].dropFirst().first!)
        } else {
            let subrules = components[1].components(separatedBy: " | ")
            let parsed = subrules.map { subrule in
                return subrule.components(separatedBy: " ")
            }
            result[components[0]] = .subrules(parsed)
        }
    }

    return RuleSet(ruleSet: result)
}

func part1() {
//    let ruleSet = parse(testRules)
//    let count = testInput.components(separatedBy: "\n")
    let ruleSet = parse(rulesInput)
    let count = input.components(separatedBy: "\n")
        .filter { (input) in
            let match = ruleSet.consume(input, rule: "0")?.isEmpty ?? false
            print("\(input) \(match)")
            return match
        }.count
    print(count)
}

part1()

