func getRest(_ text: String) -> Int {
    switch text {
    case "0"..."9":
        return Int(UnicodeScalar(text)!.value - 48)
    default:
        return Int(UnicodeScalar(text)!.value - 55)
    }
}

var input = readLine()!.split(separator: " ").compactMap({String($0)})
var result = 0
var implement = 1

while !input[0].isEmpty {
    result += getRest(String(input[0].removeLast())) * implement
    implement *= Int(input[1])!
}

print(result)