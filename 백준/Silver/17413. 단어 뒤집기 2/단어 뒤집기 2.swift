let text = readLine()!
var word = ""
var tag = ""

text.forEach {
    if $0 == "<" {
        print(word.reversed() + "", terminator: "")
        tag.append($0)
        word = ""
    } else if $0 == ">" {
        tag.append($0)
        print(tag, terminator: "")
        tag = ""
    } else {
        if tag.first == "<" {
            tag.append($0)
        } else if $0 == " " {
            if word.isEmpty {
                print($0, terminator: "")
            } else {
                print(word.reversed() + " ", terminator: "")
                word = ""
            }
        } else {
            word.append($0)
        }
    }
}

if !word.isEmpty {
    print(word.reversed() + "", terminator: "")
}