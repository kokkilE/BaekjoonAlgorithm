import Foundation

final class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    let identifier = UUID()
    let data: Int
    var prev: Node?
    var next: Node?
    
    init(_ data: Int, prev: Node? = nil, next: Node? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

final class Deque {
    var head: Node?
    var tail: Node?
    var size = 0
    
    func pushFront(_ data: Int) {
        let node = Node(data)
        
        if head == nil {
            head = node
            tail = node
            size += 1
            
            return
        }
        
        head?.prev = node
        node.next = head
        head = node
        size += 1
    }
    
    func pushBack(_ data: Int) {
        let node = Node(data)
        
        if head == nil {
            head = node
            tail = node
            size += 1
            
            return
        }
        
        tail?.next = node
        node.prev = tail
        tail = node
        size += 1
    }
    
    func popFront() -> Int {
        guard let data = head?.data else { return -1 }
        
        if head == tail {
            head = nil
            tail = nil
            size -= 1
            
            return data
        }
        
        head?.next?.prev = nil
        head = head?.next
        
        size -= 1
        
        return data
    }
    
    func popBack() -> Int {
        guard let data = tail?.data else { return -1 }
        
        if head == tail {
            head = nil
            tail = nil
            size -= 1
            
            return data
        }
        
        tail?.prev?.next = nil
        tail = tail?.prev
        
        size -= 1
        
        return data
    }
    
    func empty() -> Int {
        return size == 0 ? 1 : 0
    }
    
    func front() -> Int {
        guard let data = head?.data else { return -1 }
        
        return data
    }
    
    func back() -> Int {
        guard let data = tail?.data else { return -1 }
        
        return data
    }
}

let numberOfCommand = Int(readLine()!)!
var command = [[String]]()

for _ in 0..<numberOfCommand {
    command.append(readLine()!.split(separator: " ").compactMap( { $0.description } ))
}

let deque = Deque()
command.forEach {
    switch $0.first {
    case "push_front":
        deque.pushFront(Int($0.last!)!)
    case "push_back":
        deque.pushBack(Int($0.last!)!)
    case "pop_front":
        print(deque.popFront())
    case "pop_back":
        print(deque.popBack())
    case "size":
        print(deque.size)
    case "empty":
        print(deque.empty())
    case "front":
        print(deque.front())
    case "back":
        print(deque.back())
    default:
        return
    }
}