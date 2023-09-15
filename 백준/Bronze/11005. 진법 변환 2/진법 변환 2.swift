func getRest(_ number: Int) -> String {
    switch number {
    case 0...9:
        return String(number)
    default:
        return String(UnicodeScalar(64 + number - 9)!)
    }
}

var input = readLine()!.split(separator: " ").compactMap({Int($0)})
var result = ""

while input[0] != 0 {
    if input[0] % input[1] != 0 {
        result.append(getRest(input[0] % input[1]))
    } else {
        result.append("0")
    }
    
    input[0] /= input[1]
}

result.reversed().forEach {
    print($0, terminator: "")
}
