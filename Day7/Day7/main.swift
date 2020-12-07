//
//  main.swift
//  Day7
//
//  Created by Jerry Hsu on 12/7/20.
//

import Foundation

let sampleInput = """
light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
"""

let input = """
pale cyan bags contain 2 posh black bags, 4 wavy gold bags, 2 vibrant brown bags.
dull lavender bags contain 3 pale tomato bags.
light red bags contain 3 wavy teal bags, 3 plaid aqua bags, 4 drab lavender bags, 2 bright coral bags.
wavy green bags contain 3 wavy indigo bags.
bright blue bags contain 5 vibrant tan bags.
dotted fuchsia bags contain 5 dark orange bags, 1 shiny coral bag.
pale tomato bags contain 2 bright magenta bags, 5 dull lime bags.
light black bags contain 1 posh lavender bag, 5 dotted gold bags, 4 faded bronze bags.
wavy turquoise bags contain 4 pale teal bags, 2 dim brown bags, 5 muted lime bags.
striped red bags contain 4 faded brown bags, 4 dotted purple bags.
wavy silver bags contain 5 muted chartreuse bags, 1 light silver bag, 3 striped silver bags.
posh lavender bags contain 5 striped silver bags, 3 wavy beige bags, 3 dim brown bags, 5 clear indigo bags.
pale maroon bags contain 1 striped white bag, 4 light blue bags.
drab turquoise bags contain 2 shiny tomato bags.
dark aqua bags contain 2 plaid silver bags.
vibrant coral bags contain 3 wavy lime bags, 2 shiny gold bags, 1 dotted orange bag, 3 muted indigo bags.
clear green bags contain 1 clear olive bag.
striped indigo bags contain 3 striped turquoise bags.
clear lime bags contain 3 mirrored green bags, 2 light tan bags.
drab bronze bags contain 5 plaid lavender bags, 1 muted yellow bag, 5 vibrant coral bags.
drab lavender bags contain 1 posh tomato bag, 4 muted salmon bags, 4 dull lime bags.
striped aqua bags contain 1 pale maroon bag.
wavy gray bags contain 3 light tan bags, 2 pale white bags, 2 bright magenta bags, 5 muted salmon bags.
faded aqua bags contain 1 plaid salmon bag, 4 dotted yellow bags.
drab cyan bags contain 1 posh tomato bag, 4 shiny turquoise bags.
vibrant blue bags contain no other bags.
light lime bags contain 3 vibrant purple bags.
clear gray bags contain 3 mirrored olive bags, 3 clear crimson bags, 5 dark orange bags, 2 dim gold bags.
bright magenta bags contain no other bags.
wavy purple bags contain 4 dim gold bags, 5 light green bags.
muted bronze bags contain 2 pale beige bags, 2 clear turquoise bags, 5 posh white bags, 1 wavy gray bag.
striped violet bags contain 1 light gold bag.
dull salmon bags contain 2 posh gray bags, 2 dotted blue bags.
striped orange bags contain 3 faded coral bags, 3 dotted lavender bags.
drab coral bags contain 1 wavy indigo bag, 1 dull black bag, 3 mirrored chartreuse bags.
plaid yellow bags contain 5 faded cyan bags.
dark maroon bags contain 2 mirrored silver bags, 5 muted salmon bags, 1 dull tomato bag.
dark yellow bags contain 1 drab maroon bag, 5 faded cyan bags, 4 clear indigo bags.
posh teal bags contain 3 vibrant maroon bags, 3 posh salmon bags.
mirrored black bags contain 1 drab fuchsia bag, 2 posh red bags.
drab salmon bags contain 2 dull plum bags.
muted green bags contain 4 plaid gray bags, 2 dim turquoise bags, 2 dull coral bags, 4 dim white bags.
bright indigo bags contain 1 bright turquoise bag, 4 dark beige bags.
wavy fuchsia bags contain 1 clear violet bag, 4 striped bronze bags, 1 mirrored indigo bag, 1 shiny cyan bag.
bright brown bags contain 5 dark purple bags.
dull turquoise bags contain 3 dim yellow bags, 2 dim indigo bags.
pale coral bags contain 4 posh indigo bags.
striped green bags contain 4 dull green bags, 5 dotted turquoise bags, 3 pale red bags, 2 dark gold bags.
faded maroon bags contain 3 dim green bags, 4 wavy purple bags.
vibrant lime bags contain 3 shiny fuchsia bags, 1 pale red bag, 1 vibrant bronze bag.
shiny plum bags contain 2 bright maroon bags, 5 dull tomato bags, 2 plaid salmon bags, 3 bright lime bags.
faded silver bags contain 1 posh turquoise bag, 5 posh white bags, 5 wavy lime bags, 3 shiny coral bags.
mirrored tomato bags contain 3 dotted tomato bags, 4 vibrant blue bags, 4 dull yellow bags, 5 clear chartreuse bags.
pale red bags contain 5 vibrant indigo bags, 4 vibrant red bags, 3 bright magenta bags, 3 dim indigo bags.
drab blue bags contain 2 bright magenta bags.
dim purple bags contain 4 drab lavender bags, 4 plaid yellow bags, 5 dull white bags, 3 clear white bags.
dim red bags contain 5 striped silver bags, 1 shiny red bag.
dim lime bags contain 5 plaid bronze bags, 5 drab salmon bags.
mirrored beige bags contain 3 bright tomato bags, 2 dull lime bags.
bright lime bags contain 5 clear chartreuse bags.
clear chartreuse bags contain 1 muted white bag, 1 vibrant bronze bag, 2 vibrant maroon bags, 4 clear lime bags.
dotted indigo bags contain 4 pale olive bags, 1 bright violet bag, 3 drab gray bags.
striped crimson bags contain 3 muted salmon bags.
plaid green bags contain 3 posh tomato bags.
dim brown bags contain 3 striped teal bags, 3 vibrant aqua bags, 3 plaid yellow bags.
faded turquoise bags contain 2 dim blue bags, 3 clear green bags, 3 striped bronze bags, 2 dim beige bags.
dotted coral bags contain 2 vibrant silver bags, 3 plaid crimson bags, 4 dull silver bags, 1 muted blue bag.
mirrored magenta bags contain 3 striped teal bags, 1 mirrored black bag, 4 shiny black bags.
shiny gray bags contain 3 bright magenta bags.
mirrored violet bags contain 5 drab blue bags, 5 dark brown bags.
dark beige bags contain 2 vibrant blue bags, 2 bright magenta bags, 1 dim indigo bag.
dark bronze bags contain 3 vibrant chartreuse bags, 2 posh turquoise bags, 4 faded aqua bags.
clear turquoise bags contain 1 mirrored green bag, 1 faded indigo bag, 4 shiny aqua bags, 4 dim tomato bags.
dark silver bags contain 5 posh purple bags, 4 dull silver bags.
dull tan bags contain 2 striped brown bags, 3 vibrant salmon bags, 1 drab gold bag.
mirrored gray bags contain 2 dim white bags, 4 muted white bags, 1 muted orange bag, 3 muted magenta bags.
faded black bags contain 3 faded aqua bags, 4 drab white bags, 2 dull lavender bags, 1 bright purple bag.
light fuchsia bags contain 3 pale magenta bags.
wavy lavender bags contain no other bags.
dull black bags contain 1 mirrored teal bag.
vibrant chartreuse bags contain 1 dull violet bag, 4 posh turquoise bags.
posh yellow bags contain 5 wavy gold bags.
shiny teal bags contain 2 drab salmon bags, 5 striped crimson bags.
plaid fuchsia bags contain 3 dim brown bags, 2 posh bronze bags, 1 striped aqua bag, 1 shiny chartreuse bag.
faded yellow bags contain 1 dotted tan bag, 3 dark coral bags.
mirrored orange bags contain 3 pale coral bags.
wavy indigo bags contain 5 shiny coral bags, 2 shiny yellow bags, 2 striped brown bags.
dotted salmon bags contain 1 drab turquoise bag, 1 vibrant lime bag, 3 dull chartreuse bags, 1 vibrant maroon bag.
dull magenta bags contain 3 shiny coral bags, 5 dull violet bags, 5 mirrored violet bags.
shiny tomato bags contain 1 dim salmon bag, 1 dim olive bag.
drab gold bags contain 3 drab maroon bags, 1 dotted black bag, 4 plaid orange bags.
bright yellow bags contain 4 muted teal bags, 1 faded maroon bag, 5 posh chartreuse bags, 5 plaid indigo bags.
dull plum bags contain 1 shiny salmon bag, 3 light tan bags.
posh gray bags contain 3 muted lime bags, 2 dotted green bags.
clear violet bags contain 5 vibrant maroon bags.
dotted bronze bags contain 3 light tan bags, 4 shiny yellow bags, 3 mirrored brown bags, 1 plaid yellow bag.
mirrored lime bags contain 2 bright teal bags, 2 dim gold bags, 2 dull tomato bags, 3 wavy green bags.
shiny indigo bags contain 3 dull silver bags, 2 dim cyan bags, 2 striped magenta bags.
vibrant crimson bags contain 2 light chartreuse bags.
dim magenta bags contain 5 plaid olive bags, 2 muted green bags, 4 bright crimson bags.
dim blue bags contain 1 bright silver bag, 2 shiny gray bags.
plaid teal bags contain 4 shiny aqua bags, 1 dull fuchsia bag, 4 bright lime bags.
dull teal bags contain 2 dotted black bags.
plaid gray bags contain 5 muted brown bags.
pale teal bags contain 5 striped olive bags, 1 dotted fuchsia bag, 3 dark teal bags, 2 dim purple bags.
clear beige bags contain 3 pale lime bags, 4 striped aqua bags, 3 mirrored red bags.
mirrored green bags contain 4 mirrored olive bags, 5 dim salmon bags, 4 vibrant bronze bags.
plaid aqua bags contain 2 pale white bags, 1 dull plum bag, 4 mirrored olive bags, 3 dim maroon bags.
pale aqua bags contain 5 bright salmon bags, 4 vibrant silver bags, 2 light orange bags.
plaid crimson bags contain 3 striped magenta bags.
mirrored red bags contain 5 dull coral bags, 5 pale yellow bags, 5 drab maroon bags, 2 dim gray bags.
pale black bags contain 1 light red bag, 4 faded teal bags.
dim turquoise bags contain 5 faded purple bags, 4 wavy fuchsia bags, 3 vibrant purple bags, 2 pale beige bags.
dim lavender bags contain 1 light blue bag.
pale gray bags contain 3 mirrored red bags, 5 light indigo bags.
clear magenta bags contain 5 bright gold bags, 5 dim lavender bags, 1 wavy lavender bag.
dull gold bags contain 4 dull fuchsia bags, 3 vibrant tan bags.
dim salmon bags contain 5 dull yellow bags, 4 pale beige bags.
drab magenta bags contain 2 vibrant salmon bags.
vibrant green bags contain 3 bright purple bags, 5 wavy brown bags, 5 dotted gray bags, 1 posh bronze bag.
dull brown bags contain 1 wavy tan bag, 1 shiny salmon bag.
clear white bags contain 5 bright lime bags, 3 light tan bags.
dotted lavender bags contain 5 wavy cyan bags, 2 dark indigo bags, 4 shiny gold bags.
dotted purple bags contain 5 dull teal bags, 3 shiny plum bags.
drab yellow bags contain 3 faded beige bags, 3 light silver bags.
dark orange bags contain 5 bright lime bags.
dotted cyan bags contain 1 vibrant lime bag, 1 wavy maroon bag, 2 dull tan bags, 5 shiny salmon bags.
posh indigo bags contain 5 dull yellow bags, 1 vibrant bronze bag.
dull chartreuse bags contain 2 wavy lavender bags, 5 vibrant blue bags.
posh blue bags contain 3 wavy maroon bags.
dim teal bags contain 3 muted turquoise bags, 1 vibrant black bag, 5 dotted tomato bags.
pale purple bags contain 1 striped olive bag.
drab chartreuse bags contain 1 clear orange bag, 2 plaid turquoise bags, 2 drab maroon bags.
plaid white bags contain 4 plaid indigo bags, 5 vibrant lime bags.
vibrant bronze bags contain 5 vibrant blue bags, 1 drab blue bag, 1 dull lime bag.
bright bronze bags contain 3 muted magenta bags, 3 dotted black bags, 1 pale lime bag, 2 dull violet bags.
dark indigo bags contain 3 bright maroon bags.
muted lavender bags contain 1 light white bag, 2 clear white bags, 2 posh white bags, 3 dim purple bags.
vibrant violet bags contain 5 dull magenta bags, 4 posh coral bags.
drab beige bags contain 2 plaid magenta bags, 2 muted bronze bags, 2 muted purple bags.
drab plum bags contain 4 mirrored tomato bags, 3 light lavender bags, 3 mirrored green bags, 5 muted salmon bags.
mirrored fuchsia bags contain 1 mirrored tomato bag, 5 dotted black bags, 2 posh white bags.
pale crimson bags contain 4 light plum bags.
dotted black bags contain 3 bright maroon bags.
wavy tomato bags contain 1 dim black bag, 5 vibrant coral bags, 1 mirrored purple bag.
bright aqua bags contain 5 pale lime bags, 3 striped teal bags.
vibrant purple bags contain 2 clear turquoise bags, 4 vibrant bronze bags, 1 dark lime bag, 3 clear crimson bags.
vibrant tan bags contain 4 posh black bags.
plaid turquoise bags contain 2 dotted violet bags, 5 mirrored plum bags.
dim violet bags contain 3 dotted orange bags.
bright tan bags contain 2 dark indigo bags, 4 faded purple bags, 4 dim blue bags.
muted chartreuse bags contain 4 dotted black bags, 5 mirrored tomato bags.
muted gold bags contain 2 wavy gray bags, 4 clear gold bags, 1 shiny gold bag.
dull indigo bags contain 3 mirrored maroon bags.
clear aqua bags contain 4 dim plum bags, 5 bright bronze bags.
muted maroon bags contain 1 striped crimson bag, 3 vibrant aqua bags.
muted blue bags contain 4 clear magenta bags, 4 pale bronze bags, 2 dull black bags, 4 striped olive bags.
drab aqua bags contain 3 faded crimson bags.
shiny olive bags contain 4 shiny salmon bags, 2 wavy plum bags, 4 pale bronze bags, 3 posh gold bags.
striped bronze bags contain 4 plaid olive bags, 4 plaid indigo bags, 1 pale white bag, 3 striped magenta bags.
mirrored gold bags contain 2 faded lavender bags.
faded blue bags contain 1 plaid bronze bag, 3 dim olive bags, 2 wavy crimson bags, 4 plaid silver bags.
plaid lime bags contain 2 dim yellow bags.
mirrored brown bags contain 4 light crimson bags.
plaid red bags contain 5 shiny aqua bags, 5 wavy lavender bags, 1 posh beige bag.
mirrored coral bags contain 4 mirrored lime bags, 5 muted orange bags, 5 dotted salmon bags, 1 faded purple bag.
mirrored olive bags contain 2 vibrant blue bags.
pale orange bags contain 4 wavy lime bags.
drab maroon bags contain 1 shiny yellow bag, 3 dull yellow bags, 1 wavy lavender bag, 2 dim salmon bags.
drab purple bags contain 5 bright tomato bags, 4 striped bronze bags, 2 bright chartreuse bags, 2 dark violet bags.
striped lime bags contain 5 posh turquoise bags, 1 dim purple bag.
wavy beige bags contain 5 shiny tomato bags, 3 drab lavender bags, 1 shiny orange bag.
bright gold bags contain 5 vibrant red bags, 1 shiny orange bag, 3 striped bronze bags.
muted magenta bags contain 4 light olive bags, 3 dotted tan bags.
dark lime bags contain 5 wavy lavender bags, 4 clear maroon bags, 2 striped beige bags, 4 plaid salmon bags.
pale silver bags contain 3 faded lavender bags, 2 dotted purple bags, 3 wavy crimson bags.
posh turquoise bags contain 5 dim yellow bags, 4 posh lime bags, 5 shiny orange bags.
shiny coral bags contain 2 dull tomato bags.
dim tomato bags contain 3 shiny aqua bags, 3 light cyan bags.
plaid tomato bags contain 3 faded indigo bags.
clear tan bags contain 3 mirrored indigo bags.
wavy maroon bags contain 1 dark silver bag.
drab teal bags contain 5 muted salmon bags, 4 plaid yellow bags, 4 bright red bags, 2 posh teal bags.
dim plum bags contain 5 posh salmon bags, 5 faded purple bags, 2 posh brown bags.
bright fuchsia bags contain 2 dark beige bags, 3 faded yellow bags.
clear silver bags contain 2 plaid tomato bags, 4 muted chartreuse bags.
shiny purple bags contain 5 muted lavender bags, 2 clear turquoise bags, 4 muted teal bags.
dark red bags contain 3 plaid plum bags, 2 dim indigo bags, 2 wavy gray bags.
dark white bags contain 4 muted bronze bags, 5 mirrored gold bags, 3 plaid lavender bags.
drab silver bags contain 1 dark gold bag, 3 muted white bags.
dark green bags contain 3 posh turquoise bags.
striped white bags contain 1 vibrant maroon bag, 1 shiny salmon bag.
striped lavender bags contain 1 light tomato bag, 5 light lime bags, 1 posh gold bag.
mirrored tan bags contain 2 posh fuchsia bags.
pale salmon bags contain 4 shiny blue bags.
dark black bags contain 1 dotted coral bag, 1 faded crimson bag, 4 drab violet bags, 5 clear chartreuse bags.
vibrant red bags contain 1 dim gold bag, 2 dull yellow bags, 1 faded brown bag, 4 light cyan bags.
pale turquoise bags contain 5 clear cyan bags.
bright olive bags contain 1 clear turquoise bag, 4 bright teal bags, 3 striped maroon bags, 1 striped gold bag.
shiny green bags contain 5 dim lime bags, 3 wavy brown bags, 2 faded magenta bags, 5 drab maroon bags.
vibrant tomato bags contain 3 striped plum bags, 2 vibrant maroon bags, 4 muted silver bags, 3 striped chartreuse bags.
vibrant yellow bags contain 3 pale beige bags, 4 dim orange bags, 4 dotted cyan bags.
muted aqua bags contain 3 vibrant purple bags.
dull orange bags contain 2 striped gray bags, 3 vibrant bronze bags, 2 bright turquoise bags.
wavy cyan bags contain 2 drab maroon bags, 4 shiny aqua bags, 5 clear lime bags.
faded tan bags contain 3 muted turquoise bags, 2 plaid purple bags, 3 clear crimson bags.
light maroon bags contain 5 wavy chartreuse bags, 3 mirrored silver bags, 5 muted plum bags, 2 mirrored blue bags.
shiny lavender bags contain 1 dark silver bag, 5 clear teal bags, 5 dark red bags, 4 faded red bags.
striped fuchsia bags contain 4 clear gold bags, 3 bright magenta bags, 3 bright aqua bags.
striped plum bags contain 4 bright lime bags, 5 dotted black bags, 5 drab beige bags.
dotted red bags contain 4 dim gold bags, 3 dim indigo bags, 4 striped olive bags, 5 dim white bags.
mirrored chartreuse bags contain 5 posh tomato bags.
dim white bags contain 5 clear maroon bags.
muted black bags contain 2 posh turquoise bags, 3 clear lavender bags, 2 shiny aqua bags, 2 pale red bags.
muted silver bags contain 4 striped white bags, 5 dotted tomato bags, 4 mirrored fuchsia bags, 2 clear maroon bags.
dotted lime bags contain 1 muted aqua bag, 3 mirrored tan bags.
faded chartreuse bags contain 4 vibrant violet bags, 5 faded magenta bags, 5 dim teal bags, 2 dim green bags.
light turquoise bags contain 1 dotted purple bag.
plaid cyan bags contain 1 bright magenta bag, 2 wavy chartreuse bags, 5 vibrant silver bags, 3 pale crimson bags.
dull maroon bags contain 5 dim black bags.
wavy violet bags contain 1 faded yellow bag.
vibrant teal bags contain 5 dim lime bags, 2 vibrant gold bags, 2 dim beige bags.
pale fuchsia bags contain 3 striped olive bags.
light brown bags contain 3 shiny chartreuse bags, 2 wavy purple bags.
dull green bags contain 3 striped orange bags, 2 posh indigo bags, 3 faded blue bags.
dark blue bags contain 5 striped magenta bags, 3 striped gray bags, 4 pale coral bags.
mirrored lavender bags contain 3 posh black bags.
shiny brown bags contain 5 dotted magenta bags, 4 dim chartreuse bags, 1 posh cyan bag.
muted brown bags contain 3 dull black bags, 3 pale maroon bags, 5 posh brown bags, 2 striped gray bags.
faded orange bags contain 1 dark orange bag.
muted fuchsia bags contain 3 plaid salmon bags.
clear plum bags contain 3 shiny red bags, 4 dim silver bags.
bright coral bags contain 4 pale yellow bags, 2 muted magenta bags, 2 bright chartreuse bags, 3 light olive bags.
muted coral bags contain 4 striped green bags.
drab olive bags contain 3 shiny salmon bags, 4 clear cyan bags.
dim silver bags contain 2 shiny plum bags.
wavy plum bags contain 3 mirrored fuchsia bags, 5 pale maroon bags, 5 posh salmon bags.
plaid coral bags contain 1 mirrored gold bag.
posh beige bags contain 3 mirrored maroon bags, 3 drab chartreuse bags, 3 dark salmon bags, 1 clear green bag.
drab green bags contain 1 bright teal bag, 3 muted chartreuse bags.
bright crimson bags contain 3 striped orange bags, 4 wavy plum bags.
posh chartreuse bags contain 5 clear white bags, 3 light red bags.
dim gray bags contain 1 mirrored fuchsia bag, 3 muted teal bags, 4 clear maroon bags, 5 striped white bags.
striped brown bags contain 2 muted orange bags.
dim tan bags contain 3 clear gold bags, 5 clear salmon bags, 2 dark chartreuse bags.
striped magenta bags contain 2 plaid indigo bags, 5 drab lavender bags, 2 dotted fuchsia bags, 4 shiny aqua bags.
dotted violet bags contain 3 dull tomato bags.
dotted tan bags contain 1 dark orange bag, 2 drab blue bags.
shiny beige bags contain 1 drab gold bag.
light plum bags contain 5 plaid tomato bags, 5 wavy gray bags, 1 dull tomato bag.
muted indigo bags contain 3 dim salmon bags.
clear red bags contain 3 mirrored beige bags.
mirrored silver bags contain 2 wavy plum bags, 4 vibrant magenta bags.
dark lavender bags contain 2 wavy violet bags, 5 muted green bags, 2 dim purple bags.
clear teal bags contain 4 wavy crimson bags.
light purple bags contain 5 faded black bags.
light salmon bags contain 3 vibrant beige bags, 3 striped white bags, 5 pale magenta bags, 5 muted blue bags.
dull gray bags contain 5 dim lavender bags.
posh aqua bags contain 1 light olive bag, 4 mirrored purple bags, 4 vibrant gold bags, 1 shiny aqua bag.
pale chartreuse bags contain 5 faded indigo bags.
striped cyan bags contain 1 shiny olive bag, 3 bright tomato bags, 1 faded beige bag.
clear coral bags contain 5 clear violet bags, 1 plaid tomato bag.
bright cyan bags contain 3 mirrored violet bags, 5 plaid magenta bags, 4 vibrant bronze bags.
posh tomato bags contain 3 shiny aqua bags, 1 pale beige bag.
bright lavender bags contain 4 clear beige bags, 2 faded lavender bags, 3 faded aqua bags, 5 pale purple bags.
dotted teal bags contain 5 plaid salmon bags, 1 posh turquoise bag, 2 muted silver bags.
clear tomato bags contain 5 bright indigo bags.
dotted silver bags contain 2 mirrored indigo bags.
plaid plum bags contain 4 light crimson bags.
wavy magenta bags contain 2 posh indigo bags, 2 vibrant indigo bags.
dull tomato bags contain 4 dull lime bags, 4 faded brown bags.
vibrant black bags contain 5 light crimson bags, 5 pale lavender bags, 3 dull blue bags, 2 pale coral bags.
pale bronze bags contain 3 vibrant violet bags.
wavy lime bags contain 5 shiny yellow bags, 2 pale white bags, 1 clear gold bag, 5 mirrored chartreuse bags.
striped gray bags contain 3 shiny tomato bags, 3 dull coral bags, 1 shiny aqua bag, 2 dark orange bags.
faded crimson bags contain 4 pale white bags, 3 muted bronze bags, 2 posh blue bags, 3 bright coral bags.
wavy orange bags contain 2 shiny indigo bags.
dotted white bags contain 1 striped tan bag, 4 bright silver bags, 1 shiny fuchsia bag, 3 posh gray bags.
posh bronze bags contain 4 muted silver bags, 1 light lavender bag.
dotted magenta bags contain 5 clear fuchsia bags, 4 faded indigo bags, 3 dull turquoise bags, 4 muted orange bags.
dull cyan bags contain 3 clear teal bags, 3 dim white bags, 3 dull tomato bags, 5 vibrant purple bags.
clear gold bags contain 4 dim gold bags, 3 dull lime bags, 4 faded brown bags, 4 wavy gray bags.
bright beige bags contain 3 dull cyan bags, 4 bright indigo bags, 2 dull lime bags.
clear orange bags contain 5 shiny salmon bags.
plaid silver bags contain 5 dotted purple bags, 1 dim maroon bag, 3 muted gold bags.
shiny white bags contain 1 light brown bag, 1 mirrored lime bag.
dark gray bags contain 5 shiny cyan bags, 2 drab tomato bags.
drab white bags contain 4 shiny tomato bags, 3 shiny gold bags, 3 dull lime bags, 3 plaid orange bags.
vibrant cyan bags contain 2 wavy purple bags, 4 light gold bags, 1 pale indigo bag, 2 striped fuchsia bags.
shiny yellow bags contain 4 shiny aqua bags, 2 dim salmon bags, 3 posh tomato bags, 5 muted salmon bags.
posh coral bags contain 2 striped gray bags, 4 dark orange bags, 5 posh magenta bags.
clear salmon bags contain 4 posh yellow bags, 2 pale violet bags, 3 mirrored violet bags.
posh olive bags contain 2 mirrored red bags, 3 faded gold bags.
faded fuchsia bags contain 5 bright gold bags, 3 pale tomato bags, 2 dotted bronze bags, 1 mirrored green bag.
striped maroon bags contain 4 posh maroon bags, 4 dim indigo bags, 5 shiny aqua bags, 4 posh lime bags.
dark violet bags contain 5 plaid tomato bags, 3 bright lime bags, 4 light lavender bags, 4 dark brown bags.
dim maroon bags contain 1 dark beige bag, 4 wavy gray bags, 5 shiny coral bags, 1 pale white bag.
wavy crimson bags contain 1 light tan bag, 5 dark beige bags.
plaid magenta bags contain 1 shiny turquoise bag, 1 dark lime bag, 5 dim salmon bags.
clear indigo bags contain 4 muted maroon bags.
clear olive bags contain 5 mirrored teal bags, 1 plaid lime bag, 3 dull magenta bags, 5 wavy gray bags.
mirrored white bags contain 3 pale gold bags.
wavy blue bags contain 1 dotted aqua bag, 5 dark green bags.
faded cyan bags contain 4 wavy gray bags, 5 vibrant bronze bags, 1 mirrored olive bag, 3 drab blue bags.
faded gray bags contain 2 drab brown bags, 4 dotted coral bags, 5 dim turquoise bags, 1 mirrored maroon bag.
dim coral bags contain 5 shiny olive bags, 3 light plum bags.
vibrant fuchsia bags contain 5 shiny chartreuse bags, 5 wavy bronze bags, 2 bright red bags.
dotted tomato bags contain 5 faded indigo bags, 3 vibrant maroon bags, 4 shiny coral bags.
faded salmon bags contain 3 dull silver bags, 2 wavy bronze bags, 2 drab teal bags.
vibrant orange bags contain 1 dotted beige bag.
muted violet bags contain 5 posh lime bags.
striped tan bags contain 3 muted lime bags.
drab violet bags contain 3 vibrant chartreuse bags, 5 posh turquoise bags, 1 bright cyan bag.
bright purple bags contain 2 vibrant bronze bags, 3 wavy beige bags, 2 plaid bronze bags.
vibrant maroon bags contain no other bags.
muted teal bags contain 2 bright turquoise bags.
bright plum bags contain 5 dark gold bags, 2 shiny turquoise bags, 1 dull yellow bag.
shiny crimson bags contain 3 wavy magenta bags.
wavy teal bags contain 5 faded indigo bags, 4 dotted gray bags, 3 pale chartreuse bags, 3 vibrant coral bags.
shiny blue bags contain 2 shiny salmon bags, 4 light tan bags, 1 dim salmon bag.
mirrored maroon bags contain 1 drab fuchsia bag, 3 dotted green bags, 3 muted white bags.
clear maroon bags contain 2 vibrant red bags, 5 bright maroon bags, 4 light olive bags.
bright salmon bags contain 1 dotted red bag, 4 vibrant beige bags, 3 dark maroon bags, 3 clear lavender bags.
pale gold bags contain 3 plaid olive bags.
faded lime bags contain 3 faded maroon bags, 5 mirrored aqua bags.
faded magenta bags contain 4 plaid orange bags, 5 vibrant violet bags, 1 dotted green bag, 3 wavy crimson bags.
wavy aqua bags contain 5 drab yellow bags, 5 posh bronze bags.
faded brown bags contain 3 mirrored green bags, 5 dim salmon bags, 4 vibrant blue bags, 1 wavy gray bag.
dark purple bags contain 4 pale beige bags, 3 drab lavender bags.
dull lime bags contain no other bags.
light orange bags contain 1 vibrant white bag, 1 striped magenta bag.
mirrored plum bags contain 1 clear green bag, 4 faded blue bags.
vibrant brown bags contain 4 dark crimson bags, 5 light plum bags.
shiny turquoise bags contain 1 dark lime bag.
dark plum bags contain 2 wavy coral bags, 2 striped gray bags, 4 muted blue bags, 2 dull aqua bags.
shiny red bags contain 1 plaid gray bag, 4 wavy beige bags, 5 dark red bags.
posh violet bags contain 5 striped chartreuse bags, 2 pale maroon bags, 1 dull lime bag.
light silver bags contain 2 clear silver bags, 1 dark indigo bag, 2 dim salmon bags, 2 drab salmon bags.
plaid orange bags contain 4 dim gold bags, 2 bright magenta bags, 4 drab lavender bags.
vibrant silver bags contain 5 posh plum bags, 3 vibrant aqua bags, 2 light lavender bags.
faded tomato bags contain 1 pale coral bag, 2 posh gold bags.
shiny silver bags contain 4 faded orange bags, 1 striped white bag, 2 faded turquoise bags, 5 striped gray bags.
plaid purple bags contain 2 posh olive bags, 3 pale maroon bags, 3 pale gold bags, 1 faded white bag.
light tomato bags contain 2 vibrant indigo bags, 4 dark orange bags, 5 muted bronze bags, 4 plaid tomato bags.
dull aqua bags contain 5 bright lime bags.
drab red bags contain 5 posh teal bags.
dotted gray bags contain 2 vibrant salmon bags, 4 mirrored chartreuse bags, 1 dotted tomato bag, 4 posh magenta bags.
dull bronze bags contain 3 mirrored brown bags.
shiny aqua bags contain no other bags.
dim gold bags contain no other bags.
pale blue bags contain 4 posh gray bags.
faded purple bags contain 5 shiny blue bags, 5 plaid salmon bags, 4 pale tomato bags, 2 dark gold bags.
striped teal bags contain 4 mirrored green bags.
shiny orange bags contain 4 faded lavender bags, 2 muted salmon bags, 2 dim indigo bags.
wavy yellow bags contain 5 clear silver bags, 2 shiny brown bags.
vibrant turquoise bags contain 1 vibrant magenta bag, 4 dull fuchsia bags, 5 mirrored green bags.
dark teal bags contain 5 dim tomato bags.
posh brown bags contain 3 dark orange bags.
vibrant gray bags contain 2 dark beige bags, 2 wavy teal bags, 3 light purple bags.
drab black bags contain 1 mirrored maroon bag, 3 pale silver bags, 3 dark brown bags, 1 shiny gray bag.
light blue bags contain 2 dim olive bags, 2 striped magenta bags.
muted turquoise bags contain 3 dim lime bags, 3 shiny coral bags.
faded red bags contain 5 clear gray bags.
bright chartreuse bags contain 4 plaid teal bags, 5 drab salmon bags, 5 wavy cyan bags.
light magenta bags contain 5 light aqua bags, 4 light crimson bags, 3 dark yellow bags, 1 light tomato bag.
striped coral bags contain 3 mirrored white bags.
shiny maroon bags contain 1 vibrant red bag, 3 bright red bags.
striped yellow bags contain 1 bright orange bag, 2 faded plum bags, 3 light olive bags, 3 shiny aqua bags.
dull olive bags contain 2 posh fuchsia bags, 2 dull coral bags, 2 faded red bags.
dotted yellow bags contain 1 drab salmon bag, 3 pale fuchsia bags.
light bronze bags contain 3 drab cyan bags, 5 mirrored orange bags, 4 plaid crimson bags.
shiny chartreuse bags contain 1 wavy cyan bag, 4 shiny tomato bags.
dull yellow bags contain no other bags.
faded plum bags contain 5 vibrant blue bags, 5 clear indigo bags, 5 posh teal bags, 4 posh plum bags.
wavy salmon bags contain 4 striped teal bags, 3 wavy tan bags, 1 clear white bag.
posh salmon bags contain 4 dull chartreuse bags, 4 shiny yellow bags, 2 dotted black bags, 3 clear lime bags.
dull white bags contain 2 dim olive bags, 4 vibrant bronze bags, 4 faded cyan bags.
shiny gold bags contain 5 bright maroon bags, 5 shiny aqua bags, 2 clear lime bags, 2 muted white bags.
posh plum bags contain 4 posh purple bags, 2 wavy beige bags, 5 plaid plum bags.
shiny magenta bags contain 4 shiny tan bags, 2 dull green bags, 3 mirrored purple bags.
wavy olive bags contain 4 vibrant olive bags, 2 clear fuchsia bags, 1 light plum bag, 2 dark violet bags.
muted lime bags contain 4 posh white bags, 4 shiny tomato bags.
light indigo bags contain 2 clear turquoise bags, 3 vibrant black bags, 3 striped lime bags.
muted yellow bags contain 3 mirrored tomato bags.
faded beige bags contain 5 clear red bags, 3 dull brown bags, 4 dark red bags, 1 vibrant magenta bag.
striped turquoise bags contain 2 bright aqua bags, 5 dim cyan bags, 1 pale lavender bag.
pale beige bags contain no other bags.
dull silver bags contain 3 bright lime bags, 2 pale tomato bags, 3 mirrored green bags.
clear cyan bags contain 1 vibrant blue bag, 2 faded cyan bags, 1 faded brown bag.
posh green bags contain 2 vibrant gray bags, 1 pale magenta bag.
muted beige bags contain 2 drab blue bags, 3 vibrant magenta bags, 5 pale tomato bags.
bright silver bags contain 4 dull brown bags, 4 vibrant violet bags, 4 dim violet bags.
mirrored bronze bags contain 2 bright indigo bags, 3 shiny coral bags.
dull red bags contain 4 dull plum bags, 1 striped black bag, 1 dim teal bag, 4 dim white bags.
dim chartreuse bags contain 3 drab maroon bags.
drab crimson bags contain 5 dull turquoise bags, 3 posh gold bags, 4 bright gold bags, 2 muted indigo bags.
wavy brown bags contain 1 muted white bag.
plaid violet bags contain 2 faded tomato bags.
muted salmon bags contain 1 light cyan bag, 1 vibrant blue bag.
mirrored salmon bags contain 1 dotted green bag, 2 plaid salmon bags.
posh lime bags contain 1 vibrant blue bag.
shiny tan bags contain 2 bright red bags, 1 dim maroon bag, 3 vibrant salmon bags.
vibrant aqua bags contain 5 shiny orange bags, 2 dull coral bags, 4 vibrant bronze bags, 5 dark indigo bags.
posh magenta bags contain 5 dim maroon bags, 2 wavy indigo bags.
posh red bags contain 4 dull black bags, 2 shiny tomato bags, 4 faded beige bags.
mirrored indigo bags contain 4 faded magenta bags, 1 light red bag, 3 muted gray bags, 2 plaid lavender bags.
drab indigo bags contain 4 dull tan bags, 2 dark coral bags.
vibrant lavender bags contain 5 posh turquoise bags, 4 posh bronze bags, 5 light tomato bags.
mirrored blue bags contain 1 striped bronze bag, 4 plaid salmon bags, 3 posh lime bags, 4 mirrored green bags.
plaid blue bags contain 4 bright violet bags, 5 clear red bags.
dark tan bags contain 3 faded chartreuse bags, 1 posh gold bag, 5 light chartreuse bags.
bright teal bags contain 3 pale yellow bags, 1 vibrant white bag, 3 shiny salmon bags, 1 plaid indigo bag.
dark gold bags contain 1 mirrored green bag.
plaid beige bags contain 5 dim cyan bags.
pale plum bags contain 4 striped olive bags, 1 mirrored violet bag.
drab orange bags contain 1 plaid cyan bag, 2 vibrant green bags, 4 striped crimson bags, 2 posh teal bags.
faded teal bags contain 4 muted salmon bags, 1 dim tomato bag, 5 clear white bags.
posh cyan bags contain 3 shiny gray bags, 2 posh indigo bags.
plaid tan bags contain 4 plaid silver bags, 2 dark beige bags, 3 plaid salmon bags, 5 light beige bags.
muted olive bags contain 5 vibrant salmon bags, 2 dull orange bags.
muted tan bags contain 5 wavy gold bags, 2 striped orange bags, 4 plaid lavender bags.
posh tan bags contain 3 shiny lavender bags, 5 vibrant red bags, 4 light bronze bags.
bright tomato bags contain 3 dull lime bags, 3 wavy gray bags.
dark turquoise bags contain 3 vibrant coral bags, 4 wavy beige bags.
faded indigo bags contain 4 wavy gray bags.
clear blue bags contain 2 pale yellow bags.
light gold bags contain 5 light olive bags, 4 clear white bags, 3 plaid silver bags, 2 bright maroon bags.
light lavender bags contain 2 dotted black bags, 4 plaid tomato bags, 4 dark orange bags, 5 shiny blue bags.
faded coral bags contain 5 pale gold bags, 4 dull black bags.
vibrant salmon bags contain 2 faded teal bags, 4 drab lavender bags, 5 clear teal bags, 1 dim olive bag.
muted orange bags contain 1 posh salmon bag, 2 light cyan bags, 5 shiny tomato bags, 4 dim olive bags.
clear black bags contain 3 wavy bronze bags, 4 wavy lime bags, 4 shiny black bags.
pale violet bags contain 1 faded violet bag, 3 pale chartreuse bags, 5 drab blue bags.
dotted plum bags contain 2 muted chartreuse bags, 3 vibrant turquoise bags, 5 posh brown bags.
plaid maroon bags contain 1 posh coral bag, 1 dull fuchsia bag.
dotted brown bags contain 1 posh lime bag, 5 dull turquoise bags.
pale green bags contain 3 drab magenta bags, 4 dim salmon bags, 1 vibrant chartreuse bag.
dark tomato bags contain 2 clear indigo bags, 1 light plum bag, 2 dull turquoise bags.
striped silver bags contain 5 dark red bags, 4 faded purple bags.
shiny fuchsia bags contain 2 dark gold bags, 3 dull tomato bags.
mirrored aqua bags contain 5 dark bronze bags.
dim beige bags contain 5 dull white bags.
dark chartreuse bags contain 4 light crimson bags, 3 dim salmon bags, 2 dark orange bags.
plaid chartreuse bags contain 4 drab blue bags.
dim green bags contain 4 muted bronze bags, 1 shiny indigo bag.
mirrored crimson bags contain 5 wavy fuchsia bags, 2 vibrant magenta bags.
clear yellow bags contain 3 plaid bronze bags, 1 light tan bag.
bright turquoise bags contain 3 shiny salmon bags.
drab brown bags contain 1 vibrant fuchsia bag.
dim bronze bags contain 2 dim aqua bags, 4 dim beige bags.
dim black bags contain 1 posh purple bag, 4 mirrored bronze bags, 5 posh plum bags.
plaid gold bags contain 4 posh silver bags, 5 light turquoise bags, 3 vibrant black bags.
drab lime bags contain 1 muted gold bag, 4 dotted red bags.
bright red bags contain 1 dull yellow bag, 4 mirrored gold bags.
vibrant white bags contain 2 dull lime bags, 2 faded indigo bags, 1 faded brown bag, 1 muted salmon bag.
drab fuchsia bags contain 3 pale beige bags, 3 dark orange bags.
striped tomato bags contain 1 dark lime bag, 5 dull coral bags.
faded green bags contain 2 wavy blue bags.
vibrant olive bags contain 3 bright tomato bags, 4 wavy beige bags.
dark coral bags contain 5 faded teal bags, 1 mirrored tomato bag, 3 dark orange bags, 5 plaid lime bags.
bright violet bags contain 4 dark lime bags.
wavy tan bags contain 4 light tan bags, 3 vibrant red bags, 2 mirrored olive bags.
dotted beige bags contain 5 striped gray bags, 4 posh plum bags, 1 bright turquoise bag, 4 striped fuchsia bags.
dotted turquoise bags contain 3 mirrored green bags, 4 posh gold bags, 5 drab plum bags.
striped beige bags contain 1 clear gold bag, 1 vibrant white bag, 3 faded cyan bags, 2 shiny gold bags.
posh silver bags contain 2 vibrant gold bags, 2 mirrored violet bags.
mirrored purple bags contain 2 dim yellow bags, 2 dull tomato bags.
shiny lime bags contain 4 clear olive bags, 4 mirrored silver bags, 1 muted tomato bag.
muted cyan bags contain 1 posh coral bag, 5 drab blue bags, 4 wavy lavender bags.
light aqua bags contain 1 dark orange bag.
shiny cyan bags contain 2 dark maroon bags, 5 shiny salmon bags, 5 muted salmon bags, 2 wavy bronze bags.
posh white bags contain 1 posh fuchsia bag.
vibrant plum bags contain 4 light crimson bags.
dotted blue bags contain 1 shiny tan bag, 3 light plum bags, 5 dotted gray bags.
posh maroon bags contain 5 mirrored violet bags.
dull violet bags contain 1 faded teal bag, 2 wavy cyan bags, 3 dull silver bags, 3 vibrant red bags.
posh gold bags contain 4 muted salmon bags, 4 dull plum bags, 3 muted bronze bags.
dim orange bags contain 2 dull coral bags.
dim aqua bags contain 1 drab maroon bag.
striped salmon bags contain 4 muted white bags.
dark cyan bags contain 3 plaid maroon bags.
wavy red bags contain 2 wavy maroon bags, 2 vibrant chartreuse bags, 5 wavy salmon bags.
light yellow bags contain 4 posh lime bags, 1 light white bag.
striped blue bags contain 5 plaid magenta bags, 5 vibrant gold bags.
dark olive bags contain 4 dim maroon bags, 2 shiny tan bags, 5 wavy green bags.
vibrant gold bags contain 1 dull beige bag, 4 posh turquoise bags.
muted white bags contain 1 dim indigo bag, 5 dull lime bags, 5 shiny aqua bags.
light violet bags contain 5 wavy bronze bags.
pale olive bags contain 1 dim gold bag, 2 shiny coral bags.
light gray bags contain 3 bright gold bags.
dim indigo bags contain 3 posh tomato bags, 5 pale tomato bags, 4 shiny aqua bags.
pale indigo bags contain 4 pale bronze bags, 5 light chartreuse bags.
muted red bags contain 3 clear white bags, 4 dull lavender bags, 5 muted purple bags.
plaid olive bags contain 3 dark orange bags, 3 dim gold bags.
dotted maroon bags contain 3 faded purple bags, 5 light green bags.
bright orange bags contain 1 shiny black bag, 2 dim lavender bags, 1 shiny olive bag.
wavy chartreuse bags contain 3 clear lime bags, 4 pale maroon bags.
mirrored turquoise bags contain 2 striped crimson bags, 4 vibrant bronze bags, 5 dotted lavender bags, 2 clear silver bags.
dull purple bags contain 4 posh crimson bags.
faded bronze bags contain 1 clear fuchsia bag, 2 light fuchsia bags, 2 pale chartreuse bags.
clear bronze bags contain 3 pale chartreuse bags, 5 dull tan bags, 1 vibrant tan bag.
vibrant magenta bags contain 4 shiny fuchsia bags, 2 shiny coral bags, 3 faded indigo bags, 4 pale tomato bags.
striped chartreuse bags contain 2 shiny orange bags, 3 mirrored tomato bags, 1 clear lime bag.
dotted green bags contain 1 pale beige bag, 2 mirrored bronze bags, 2 wavy crimson bags.
wavy white bags contain 3 posh magenta bags, 3 muted yellow bags, 3 wavy crimson bags, 4 vibrant olive bags.
muted plum bags contain 4 wavy gold bags.
faded violet bags contain 3 dark violet bags.
dull fuchsia bags contain 4 plaid indigo bags, 1 mirrored brown bag, 5 clear lime bags.
bright green bags contain 3 mirrored white bags, 5 dotted silver bags.
shiny violet bags contain 4 striped salmon bags.
dim fuchsia bags contain 3 striped red bags.
faded lavender bags contain 3 wavy tan bags, 2 clear lime bags.
dim cyan bags contain 4 drab white bags.
dark brown bags contain 5 clear gold bags, 3 vibrant blue bags.
clear lavender bags contain 5 striped turquoise bags, 1 light crimson bag, 5 light tan bags, 2 muted gold bags.
light green bags contain 3 striped silver bags, 4 bright silver bags, 2 light crimson bags.
pale lavender bags contain 5 clear violet bags.
dotted orange bags contain 3 dotted tomato bags, 2 dull plum bags, 5 posh purple bags, 2 drab turquoise bags.
bright black bags contain 3 posh chartreuse bags, 5 wavy indigo bags, 5 dull crimson bags, 2 clear turquoise bags.
dotted gold bags contain 5 striped white bags, 2 striped brown bags, 3 mirrored green bags, 3 dark violet bags.
plaid brown bags contain 3 striped chartreuse bags, 3 striped black bags, 2 bright chartreuse bags.
wavy coral bags contain 3 dim turquoise bags, 4 dim lime bags.
pale brown bags contain 4 dim white bags, 5 bright fuchsia bags, 2 clear orange bags.
mirrored teal bags contain 4 pale lavender bags, 5 vibrant maroon bags, 4 striped gray bags, 4 vibrant indigo bags.
posh orange bags contain 5 posh magenta bags, 4 posh violet bags, 2 plaid magenta bags, 4 muted cyan bags.
dim crimson bags contain 3 drab violet bags, 1 dotted aqua bag.
muted gray bags contain 4 vibrant lime bags, 1 dark maroon bag, 2 clear gold bags, 3 plaid gray bags.
clear brown bags contain 5 shiny tomato bags, 4 striped tan bags, 5 vibrant lavender bags, 1 pale white bag.
posh crimson bags contain 3 dim yellow bags, 4 shiny turquoise bags, 2 vibrant purple bags, 4 mirrored aqua bags.
plaid black bags contain 2 shiny tan bags, 1 pale olive bag, 2 wavy tan bags, 1 clear red bag.
dark crimson bags contain 3 drab fuchsia bags, 5 faded gold bags.
pale tan bags contain 5 posh black bags.
wavy bronze bags contain 1 clear lime bag.
wavy gold bags contain 2 dull lavender bags, 1 bright turquoise bag, 4 striped brown bags, 5 drab turquoise bags.
pale lime bags contain 2 faded cyan bags, 4 muted salmon bags, 4 shiny coral bags, 3 mirrored green bags.
dark magenta bags contain 4 faded chartreuse bags, 1 muted brown bag, 4 vibrant salmon bags, 2 dim indigo bags.
striped purple bags contain 3 mirrored olive bags.
dull crimson bags contain 2 clear orange bags.
dull beige bags contain 1 drab turquoise bag, 1 dark indigo bag, 1 dull white bag.
dotted aqua bags contain 4 dull chartreuse bags.
clear purple bags contain 2 muted beige bags, 3 dull black bags.
light crimson bags contain 1 faded brown bag, 1 vibrant red bag, 4 wavy lavender bags, 1 wavy gray bag.
clear fuchsia bags contain 1 dark maroon bag, 3 muted salmon bags.
muted crimson bags contain 5 light lime bags, 4 posh plum bags, 5 clear fuchsia bags, 1 wavy turquoise bag.
muted purple bags contain 3 dull gray bags, 5 posh gray bags.
shiny salmon bags contain 5 faded brown bags, 4 clear chartreuse bags.
plaid lavender bags contain 1 dim lime bag.
vibrant indigo bags contain 5 dim tomato bags, 2 striped beige bags, 2 mirrored olive bags.
mirrored cyan bags contain 3 plaid coral bags, 5 faded teal bags, 5 pale indigo bags, 3 bright fuchsia bags.
dim yellow bags contain 5 light crimson bags, 1 pale tomato bag.
dotted chartreuse bags contain 3 shiny blue bags.
light beige bags contain 3 bright teal bags, 1 pale tomato bag, 2 light blue bags.
dotted olive bags contain 3 bright indigo bags, 4 muted fuchsia bags.
pale white bags contain 1 vibrant maroon bag, 2 pale tomato bags, 2 bright magenta bags.
mirrored yellow bags contain 2 drab brown bags, 3 striped salmon bags, 4 clear olive bags, 1 dotted black bag.
light olive bags contain 2 bright magenta bags.
muted tomato bags contain 4 shiny lavender bags.
light chartreuse bags contain 5 light plum bags, 4 light olive bags, 3 dark indigo bags.
posh purple bags contain 2 wavy crimson bags.
bright maroon bags contain 4 faded indigo bags.
dull blue bags contain 3 dark brown bags, 3 dim indigo bags, 5 pale silver bags, 1 mirrored brown bag.
light coral bags contain 5 clear teal bags.
bright gray bags contain 3 muted black bags, 3 vibrant cyan bags.
posh fuchsia bags contain 3 clear gold bags, 1 dim salmon bag, 2 shiny salmon bags.
light white bags contain 3 dim cyan bags, 5 clear crimson bags, 3 dull fuchsia bags.
light teal bags contain 3 shiny fuchsia bags, 2 muted white bags, 3 shiny black bags.
plaid salmon bags contain 2 dotted black bags, 2 dark beige bags, 1 shiny coral bag.
wavy black bags contain 5 posh olive bags.
drab gray bags contain 3 mirrored tomato bags, 3 light crimson bags.
dim olive bags contain 5 clear chartreuse bags.
bright white bags contain 2 mirrored tan bags, 1 pale green bag, 5 dull magenta bags, 5 plaid lime bags.
striped olive bags contain 3 muted gold bags.
faded olive bags contain 1 muted indigo bag.
pale yellow bags contain 5 light olive bags, 5 plaid aqua bags, 1 clear white bag, 5 faded purple bags.
dull coral bags contain 4 light crimson bags, 5 shiny aqua bags, 5 wavy cyan bags, 3 dark beige bags.
vibrant beige bags contain 4 striped olive bags, 5 clear gold bags.
dark fuchsia bags contain 1 pale teal bag, 4 dull gray bags.
drab tomato bags contain 4 mirrored white bags.
clear crimson bags contain 4 pale tomato bags, 3 wavy gray bags, 4 drab blue bags, 1 mirrored olive bag.
dotted crimson bags contain 1 plaid crimson bag, 1 dark crimson bag, 1 striped beige bag, 4 pale fuchsia bags.
striped black bags contain 4 muted maroon bags.
shiny bronze bags contain 1 dotted tan bag, 1 vibrant beige bag, 5 faded tomato bags.
light cyan bags contain no other bags.
posh black bags contain 2 dim green bags.
striped gold bags contain 3 drab tan bags.
faded white bags contain 4 pale coral bags.
drab tan bags contain 4 clear gold bags, 5 drab silver bags.
light tan bags contain 2 dull lime bags, 1 muted salmon bag, 4 pale beige bags.
plaid indigo bags contain 3 plaid salmon bags, 1 vibrant maroon bag.
faded gold bags contain 3 dark coral bags.
dark salmon bags contain 5 bright gold bags, 1 pale white bag.
plaid bronze bags contain 3 drab gold bags, 4 dotted black bags.
shiny black bags contain 3 bright magenta bags, 2 dark indigo bags, 1 posh plum bag, 5 drab gold bags.
pale magenta bags contain 1 clear gold bag, 5 posh fuchsia bags, 2 faded cyan bags.
"""

typealias Color = String
struct Bag {
    let color: Color
    let containedColors: [(Int, Color)]
}


func parseBag(_ bag: String) -> (Int, Color) {
    let pattern = #"(\d*) ?(\w+ \w+) bags?"#
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(bag.startIndex..<bag.endIndex, in: bag)
    var foundCount = 1
    var foundColor = ""
    regex.enumerateMatches(in: bag, options: [], range: range) { (match, _, stop) in
        guard let match = match else { return }
        if match.range(at: 1).length > 0 {
            foundCount = Int(bag[Range(match.range(at: 1), in: bag)!])!
        }
        foundColor = String(bag[Range(match.range(at: 2), in: bag)!])
    }
    return (foundCount, foundColor)
}

func parse(input: String) -> [Color:Bag] {
    var colorMap: [Color:Bag] = [:]
    let lines = input.split(separator: "\n")
    for line in lines {
        let halves = line.components(separatedBy: " contain ")
        let (_, startColor) = parseBag(halves[0])
        let containedBags = halves[1].components(separatedBy: ", ")
        let bag = Bag(
            color: startColor,
            containedColors: containedBags.map { parseBag($0) }.filter({ (_, color) -> Bool in
                color != "no other"
            })
        )
        colorMap[startColor] = bag
    }
    return colorMap
}

let colorMap = parse(input: input)

func search(startingAt bag: Bag, for target: Color) -> Bool {
    if bag.containedColors.contains(where: { (_, color) -> Bool in
        color == target
    }) {
        return true
    } else {
        return bag.containedColors.filter { (_, color) -> Bool in
            search(startingAt: colorMap[color]!, for: target)
        }.count > 0
    }
}

func part1() {
    var count = 0
    for bag in colorMap.values {
        if search(startingAt: bag, for: "shiny gold") {
            count += 1
        }
    }
    print(count)
}

func countSubBags(color: Color) -> Int {
    let bag = colorMap[color]!
    var result = 0
    for (count, subColor) in bag.containedColors {
        let subCount = countSubBags(color: subColor)
        result += count * (subCount + 1)
    }
    return result
}

func part2() {
    print(countSubBags(color: "shiny gold"))
}

part2()
