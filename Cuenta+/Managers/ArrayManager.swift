//
//  ArrayManager.swift
//  Cuenta+
//
//  Created by Alex Dearden on 28/07/2023.
//

///: The idea is for this struct to act as a manager for any type of array
/// this way, we don't have to create one for each array type we might have
/// and the views don't have to do any of this work, they just pass the logic off to the manager
/// this wouid also allow better testing
/// we can test the manager and not need to do anything with views

import Foundation

protocol ArrayManageable {
    associatedtype Element
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
}

///: Note that this conforms to the `ArrayManageable` protocol but is very restrictive
/// it sort of defeats the purpose of having a genericl`Element` if we are **typecasting** it to `String`
class VideoManager: ArrayManageable, ObservableObject {
    typealias Element = Video

    func push(_ element: Video) {
        
    }
    
    func pop() -> Video? {
        print("pop called inside VideoManager")
        return nil
    }
    
    func peek() -> Video? {
        return nil
    }
}

///: The protoclol might be overkill here but in the future, if we need something else to handle the arrays, we can make another type conform to it
/// though still not sure if I should use it
struct Stack<Element>: ArrayManageable {
    private var array = [Element]()
    var count: Int { array.count }
    var isEmpty: Bool { array.isEmpty }
 
    init() { }
    
    init(_ items: [Element]) {
        self.array = items
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        array.popLast()
    }
    
    func peek() -> Element? {
        array.last
    }
}

///: This will make all **Stacks** made up of `equatable` elements to be `equatable`
/// only if the `elements` are `Equatable` though
/// that's what the conditional `where Element: Equatable { }` means

extension Stack: Equatable where Element: Equatable { }

///: Same thing for `Hashable`
extension Stack: Hashable where Element: Hashable { }

///: Same thing for `Codable`
/// but write each protocol conformace separagtely or it will only allow elements that conform to `Codable`
/// if we use `Codable` protocol and that will be more restrictive

extension Stack: Encodable where Element: Encodable { }
extension Stack: Decodable where Element: Decodable { }
