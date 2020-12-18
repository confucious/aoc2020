//
//  main.swift
//  Day18
//
//  Created by Jerry Hsu on 12/18/20.
//

import Foundation

enum Operation {
    case addition
    case multiplication
}

indirect enum Node {
    case value(Int)
    case branch(left: Node, right: Node, operation: Operation)
}

indirect enum Tokens {
    case number(Int)
    case addition
    case multiplication
    case parens([Tokens])

    var operation: Operation {
        switch self {
        case .addition: return .addition
        case .multiplication: return .multiplication
        default:
            fatalError("\(self) was not an operation")
        }
    }
}

func parse(input: String) -> [Tokens] {
    var result = [[Tokens]]()

    result.append([])
    var level = 0
    for char in input {
        switch char {
        case "0"..."9":
            result[level].append(.number(Int(String(char))!))
        case "+":
            result[level].append(.addition)
        case "*":
            result[level].append(.multiplication)
        case "(":
            level += 1
            result.append([])
        case ")":
            let lastNode = result.popLast()!
            level -= 1
            result[level].append(.parens(lastNode))
        default:
            continue
        }
    }
    return result[0]
}

func order(_ tokens: [Tokens]) -> Node {
    guard tokens.count % 2 != 0 else {
        fatalError("\(tokens.count) tokens. Should always be an odd number.")
    }
    if tokens.count == 1 {
        switch tokens[0] {
        case .number(let value): return .value(value)
        case .parens(let subTokens): return order(subTokens)
        default:
            fatalError("\(tokens[0]) by itself makes no sense")
        }
    } else {
        let leftNode: Node
        let rightNode: Node
        let operation = tokens[tokens.count - 2].operation
        switch tokens[tokens.count - 1] {
        case .number(let value): leftNode = .value(value)
        case .parens(let subTokens): leftNode = order(subTokens)
        default:
            fatalError("\(tokens[0]) must be number or parens")
        }
        rightNode = order(Array(tokens.dropLast(2)))
        return .branch(left: leftNode, right: rightNode, operation: operation)
    }
}

func order2(_ tokens: [Tokens]) -> Node {
    guard tokens.count % 2 != 0 else {
        fatalError("\(tokens.count) tokens. Should always be an odd number.")
    }
    if tokens.count == 1 {
        switch tokens[0] {
        case .number(let value): return .value(value)
        case .parens(let subTokens): return .value(evaluate(rotate(order2(subTokens))))
        default:
            fatalError("\(tokens[0]) by itself makes no sense")
        }
    } else {
        let leftNode: Node
        let rightNode: Node
        let operation = tokens[tokens.count - 2].operation
        switch tokens[tokens.count - 1] {
        case .number(let value): leftNode = .value(value)
        case .parens(let subTokens): leftNode = .value(evaluate(rotate(order2(subTokens))))
        default:
            fatalError("\(tokens[0]) must be number or parens")
        }
        rightNode = order2(Array(tokens.dropLast(2)))
        return .branch(left: leftNode, right: rightNode, operation: operation)
    }
}
func rotate(_ rootNode: Node) -> Node {
    switch rootNode {
    case .value: return rootNode
    case let .branch(left: left, right: right, operation: operation):
        let right = rotate(right)
        switch right {
        case .value: return rootNode
        case let .branch(left: subLeft, right: subRight, operation: subOperation):
        if subOperation == .multiplication && operation == .addition {
            let rotatedLeft: Node = .branch(left: left, right: subLeft, operation: operation)
            return .branch(left: rotatedLeft, right: subRight, operation: subOperation)
        } else {
            return .branch(left: left, right: right, operation: operation)
        }
        }
    }
}

func evaluate(_ node: Node) -> Int {
    switch node {
    case .value(let value): return value
    case let .branch(left: left, right: right, operation: operation):
        let leftValue = evaluate(left)
        let rightValue = evaluate(right)
        switch operation {
        case .addition: return leftValue + rightValue
        case .multiplication: return leftValue * rightValue
        }
    }
}

@discardableResult
func evaluate(_ input: String) -> Int {
    let result = evaluate(order(parse(input: input)))
    print("\(input) = \(result)")
    return result
}

@discardableResult
func evaluate2(_ input: String) -> Int {
    let result = evaluate(rotate(order2(parse(input: input))))
    print("\(input) = \(result)")
    return result
}

func tests1() {
    print(evaluate("1 + 2 * 3 + 4 * 5 + 6") == 71)
    print(evaluate("1 + (2 * 3) + (4 * (5 + 6))") == 51)
    print(evaluate("2 * 3 + (4 * 5)") == 26)
    print(evaluate("5 + (8 * 3 + 9 + 3 * 4 * 3)") == 437)
    print(evaluate("5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))") == 12240)
    print(evaluate("((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2") == 13632)
}

func part1() {
    var result = 0
    for line in input.components(separatedBy: "\n") {
        result += evaluate(line)
    }
    print(result)
}

func tests2() {
    print(evaluate2("1 + 2 * 3 + 4 * 5 + 6") == 231)
    print(evaluate2("1 + (2 * 3) + (4 * (5 + 6))") == 51)
    print(evaluate2("2 * 3 + (4 * 5)") == 46)
    print(evaluate2("8 * 3 + 9 + 3 * 4 * 3") == 1440)
    print(evaluate2("5 + (8 * 3 + 9 + 3 * 4 * 3)") == 1445)
    print(evaluate2("5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))") == 669060)
    print(evaluate2("((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2") == 23340)
}

func part2() {
    var result = 0
    for line in input.components(separatedBy: "\n") {
        result += evaluate2(line)
    }
    print(result)
}

part2()
