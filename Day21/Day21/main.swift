//
//  main.swift
//  Day21
//
//  Created by Jerry Hsu on 12/21/20.
//

import Foundation

typealias Ingredient = String
typealias Allergen = String
struct Food {
    let ingredients: Set<Ingredient>
    let allergens: Set<Allergen>

    init(input: String) {
        let components = input.components(separatedBy: " (contains ")
        ingredients = Set(components[0].components(separatedBy: " "))
        allergens = Set(components[1].dropLast().components(separatedBy: ", "))
    }
}

func part1() {
    let foods = input.components(separatedBy: "\n").map { Food(input: $0) }
    let allIngredients = foods.reduce(into: Set<Ingredient>()) { (all, food) in
        all.formUnion(food.ingredients)
    }
    let allAllergens = foods.reduce(into: Set<Allergen>()) { (all, food) in
        all.formUnion(food.allergens)
    }
    var allergens = [Allergen:Set<Ingredient>]()
    allAllergens.forEach { (allergen) in
        allergens[allergen] = allIngredients
    }
    foods.forEach { (food) in
        food.allergens.forEach { (allergen) in
            allergens[allergen] = allergens[allergen]!.intersection(food.ingredients)
        }
    }
    for (allergen, ingredients) in allergens {
        print("\(allergen): \(ingredients)")
    }

    let excludedIngredients = allergens.values.reduce(allIngredients) { (result, ingredients) in
        return result.subtracting(ingredients)
    }

    let count = foods.reduce(0) { (result, food) in
        return result + food.ingredients.intersection(excludedIngredients).count
    }

    print(count)
}

part1()

// did part 2 manually
/*
 dairy: ["bxjvzk"]
 eggs: ["hqgqj"]
 fish: ["sp"]
 nuts: ["spl"]
 peanuts: ["hsksz"]
 sesame: ["qzzzf"]
 shellfish: ["fmpgn"]
 soy: ["tpnnkc"]
 bxjvzk,hqgqj,sp,spl,hsksz,qzzzf,fmpgn,tpnnkc
 */
