let input = readLine()!
var result = ""

input.forEach {
    switch $0 {
    case "a"..."z":
        let unicode = UnicodeScalar(($0.asciiValue! - 97 + 13) % 26 + 97)
        result.append(String(unicode))
    case "A"..."Z":
        let unicode = UnicodeScalar(($0.asciiValue! - 65 + 13) % 26 + 65)
        result.append(String(unicode))
    default:
        result.append($0)
    }
}
print(result)