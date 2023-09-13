import Foundation

var text = readLine()!.replacingOccurrences(of: "()", with: "$")
var leftBracket = 0
var totalCount = 0

text.forEach {
    switch $0 {
    case "(":
        leftBracket += 1
    case ")":
        leftBracket -= 1
        totalCount += 1
    default:
        totalCount += leftBracket
    }
}
print(totalCount)
