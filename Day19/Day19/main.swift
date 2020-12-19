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

    // Return possible variable remaining matches
    // Return empty array if no possible matches
    func consume2(_ input: String, rule: String) -> [String] {
        print("checking2 \(input) for rule \(rule)")
        switch ruleSet[rule]! {
        case let .leaf(character):
            if let testChar = input.first,
               testChar == character {
                return [String(input.dropFirst())]
            } else {
                return []
            }
        case let .subrules(subrules):
            if rule == "8" {
                // we can match 42 multiple times...
                // repeatedly match it until we no longer match
                var trialRemaining: String? = input
                var remaining: [String] = []
                var count = -1
                repeat {
                    trialRemaining = consume(trialRemaining!, rule: "42")
                    if trialRemaining != nil {
                        remaining.append(trialRemaining!)
                    }
                    count += 1
                } while trialRemaining != nil
                print("8 matched 42 \(count) times")
                if count <= 0 {
                    // we didn't match anything at all
                    return []
                } else {
                    print("Remainders: \(remaining)")
                    return remaining
                }
            }
            if rule == "11" {
                // we can match 42 and 31 in nesting pairs...
                // count how many times we match 42 then see if we can match 31 an equal number of times?
                var trialRemaining: String? = input
                var part1Remaining: [String] = []
                var count = -1
                repeat {
                    trialRemaining = consume(trialRemaining!, rule: "42")
                    if trialRemaining != nil {
                        part1Remaining.append(trialRemaining!)
                    }
                    count += 1
                } while trialRemaining != nil
                print("11 matched 42 \(count) times")
                if count <= 0 {
                    // we didn't match anything at all
                    return []
                }
                var remaining: [String] = []
                remaining = part1Remaining.enumerated().compactMap { (index, test) in
                    let count = index + 1
                    var trialRemaining: String? = test
                    for _ in 0..<count {
                        trialRemaining = consume(trialRemaining!, rule: "31")
                        if trialRemaining == nil {
                            return nil
                        }
                    }
                    print("11 matched 31 with count \(count)")
                    return trialRemaining
                }
                print("Remainders: \(remaining)")
                return remaining
            }
            for subruleList in subrules {
                var remaining = [input]
                for subrule in subruleList {
                    remaining = remaining.flatMap {
                        consume2($0, rule: subrule)
                    }
                    if remaining.isEmpty {
                        break
                    }
                }
                if !remaining.isEmpty {
                    return remaining
                }
            }
            return []
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


func part2() {
//    let ruleSet = parse(testRules2)
//    let count = testInput2.components(separatedBy: "\n")
    let ruleSet = parse(rulesInput)
    let count = input.components(separatedBy: "\n")
        .filter { (input) in
            let match = !ruleSet.consume2(input, rule: "0").allSatisfy { !$0.isEmpty }
            print("\(input) \(match)")
            return match
        }.count
    print(count)
}

part2()
