while let input = readLine() {
    var upperCount = 0, lowerCount = 0, spaceCount = 0, numberCount = 0
    
    input.forEach {
        switch $0.asciiValue! {
        case Character("a").asciiValue!...Character("z").asciiValue!:
            lowerCount += 1
        case Character("A").asciiValue!...Character("Z").asciiValue!:
            upperCount += 1
        case Character("0").asciiValue!...Character("9").asciiValue!:
            numberCount += 1
        case Character(" ").asciiValue!:
            spaceCount += 1
        default:
            break
        }
    }
    print ("\(lowerCount) \(upperCount) \(numberCount) \(spaceCount)")
}