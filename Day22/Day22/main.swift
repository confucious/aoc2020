//
//  main.swift
//  Day22
//
//  Created by Jerry Hsu on 12/22/20.
//

import Foundation

func part1() {
    var player1 = input1
    var player2 = input2

    while !player1.isEmpty && !player2.isEmpty {
        let card1 = player1.removeFirst()
        let card2 = player2.removeFirst()
        if card1 < card2 {
            player2.append(card2)
            player2.append(card1)
        } else {
            player1.append(card1)
            player1.append(card2)
        }
    }

    let score1 = player1.reversed().enumerated().reduce(0) { (sum, arg1) in
        let (index, value) = arg1
        return sum + (index + 1) * value
    }

    let score2 = player2.reversed().enumerated().reduce(0) { (sum, arg1) in
        let (index, value) = arg1
        return sum + (index + 1) * value
    }

    print(score1)
    print(score2)
}

typealias State = [[Int]]

func playRound(state: State) -> (State, Int) {
    var seenStates = Set<State>()
    print("Starting game \(state)")
    var state = state
    while !seenStates.contains(state) && !state[0].isEmpty && !state[1].isEmpty {
        seenStates.insert(state)
        let card1 = state[0].removeFirst()
        let card2 = state[1].removeFirst()
        if state[0].count >= card1 && state[1].count >= card2 {
            let substate = [Array(state[0][0..<card1]), Array(state[1][0..<card2])]
            let (_, winner) = playRound(state: substate)
            if winner == 0 {
                state[0].append(card1)
                state[0].append(card2)
            } else {
                state[1].append(card2)
                state[1].append(card1)
            }
        } else if card1 < card2 {
            state[1].append(card2)
            state[1].append(card1)
        } else {
            state[0].append(card1)
            state[0].append(card2)
        }
//        print("End Round: \(state)")
    }

    print("Finished: \(state)")
    return (state, state[0].isEmpty ? 1 : 0)
}

func part2() {
//    let startState = [
//        [9, 2, 6, 3, 1],
//        [5, 8, 4, 7, 10]
//    ]

    let startState = [
        input1,
        input2
    ]

    let (finalState, _) = playRound(state: startState)

    let score1 = finalState[0].reversed().enumerated().reduce(0) { (sum, arg1) in
        let (index, value) = arg1
        return sum + (index + 1) * value
    }

    let score2 = finalState[1].reversed().enumerated().reduce(0) { (sum, arg1) in
        let (index, value) = arg1
        return sum + (index + 1) * value
    }

    print(score1)
    print(score2)
}

part2()

