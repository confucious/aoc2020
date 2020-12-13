//
//  main.swift
//  Day12
//
//  Created by Jerry Hsu on 12/13/20.
//

import Foundation

enum Direction: String {
    case north = "N"
    case west = "W"
    case east = "E"
    case south = "S"
    case left = "L"
    case right = "R"
    case forward = "F"

    func turnLeft() -> Direction {
        switch self {
        case .north: return .west
        case .west: return .south
        case .south: return .east
        case .east: return .north
        default: fatalError("Can't turn using non-cardinal \(self)")
        }
    }

    func turnRight() -> Direction {
        switch self {
        case .north: return .east
        case .west: return .north
        case .south: return .west
        case .east: return .south
        default: fatalError("Can't turn using non-cardinal \(self)")
        }
    }

    func turn(degrees: Int) -> Direction {
        guard degrees % 90 == 0 else {
            fatalError("Non orthognal turn \(degrees)")
        }
        var heading = self
        if degrees < 0 {
            (0..<(-degrees/90)).forEach { _ in
                heading = heading.turnLeft()
            }
        } else {
            (0..<(degrees/90)).forEach { _ in heading = heading.turnRight() }
        }
        return heading
    }
}

func part1() {
    var heading: Direction = .east
    var x: Int = 0
    var y: Int = 0

    for line in input.split(separator: "\n") {
        let instruction = Direction(rawValue: String(line.first!))!
        let value = Int(line.dropFirst())!
        switch instruction {
        case .north: y -= value
        case .south: y += value
        case .east: x += value
        case .west: x -= value
        case .left:
            heading = heading.turn(degrees: -value)
        case .right:
            heading = heading.turn(degrees: value)
        case .forward:
            switch heading {
            case .north: y -= value
            case .south: y += value
            case .east: x += value
            case .west: x -= value
            default: fatalError("Got forward with \(heading)")
            }
        }
        print("\(x) \(y) \(heading)")
    }
    print(abs(x) + abs(y))
}

func rotate(x: Int, y: Int, degrees: Int) -> (Int, Int) {
    let steps = ((degrees + 720) / 90) % 4
    guard steps >= 0 && steps < 4 else { fatalError("steps = \(steps)") }
    switch steps {
    case 0: return (x, y)
    case 1: return (-y, x)
    case 2: return (-x, -y)
    case 3: return (y, -x)
    default: fatalError("")
    }
}

func part2() {
    var waypointX = 10
    var waypointY = -1
    var x: Int = 0
    var y: Int = 0

    for line in input.split(separator: "\n") {
        let instruction = Direction(rawValue: String(line.first!))!
        let value = Int(line.dropFirst())!
        switch instruction {
        case .north: waypointY -= value
        case .south: waypointY += value
        case .east: waypointX += value
        case .west: waypointX -= value
        case .left:
            (waypointX, waypointY) = rotate(x: waypointX, y: waypointY, degrees: -value)
        case .right:
            (waypointX, waypointY) = rotate(x: waypointX, y: waypointY, degrees: value)
        case .forward:
            x += waypointX * value
            y += waypointY * value
        }
        print("\(x) \(y) \(waypointX) \(waypointY)")
    }
    print(abs(x) + abs(y))
}

part2()


