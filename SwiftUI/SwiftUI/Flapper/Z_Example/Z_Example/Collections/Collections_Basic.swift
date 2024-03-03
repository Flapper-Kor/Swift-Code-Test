//
//  Collections_Basic.swift
//  Z_Example
//
//  Created by Flapper on 3/2/24.
//

import SwiftUI
import Collections



struct Collections_Basic: View {
    
    var collectionWrapper: CollectionWrapper = CollectionWrapper<Int>()
    
    var array: Array<String>
    var set: Set<Int>
    var orderedSet: OrderedSet<Int>
    
    
    init(){
        
        
        self.array = Array(arrayLiteral: "123", "332","1234")
        self.set = Set([1,2,3,4,5])
        self.orderedSet = OrderedSet<Int>(self.set)
        self.orderedSet.sort(by: > )
        
        print(type(of: self.array), self.array)
        print(type(of: self.set), self.set)
        print(type(of: self.orderedSet), self.orderedSet)
        
//        collectionWrapper.print_Info()
        
        //        var i = self.orderedSet.enumerated().makeIterator()
        
        print(self.orderedSet)
        
        
        
        self.collectionWrapper.collection = self.orderedSet
        
        
        self.orderedSet.append(123)
        
        print(collectionWrapper)
        
    }
    
    
    enum collectionType{
        case array
        case set
        case dictionary
        
        case orderedSet
    }
    
    var collection_info : String = ""
    var body: some View {
        VStack
        {
            Text(self.collectionWrapper.description)
                .lineLimit(10)
                .multilineTextAlignment(.center)
                .foregroundStyle(.purple)
                .font(.footnote)
            
            Spacer()
            
            HStack{
                Button("ContentShow"){
                    
//                    self.collection_info += self.collectionWrapper.collection!
                }
                
                
                
                Button("collectionType"){
//                    self.collectionWrapper
                }
            }
            ScrollView{
                
            }
        }
    }
}

extension VStack{
    @inlinable public init(_ spacing: CGFloat? = nil, @ViewBuilder content: () -> Content){
        self.init(alignment: .center, spacing: 0) {
            content()
        }
    }
    public typealias Body = Never
}




class CollectionWrapper
<Element>
: CustomStringConvertible, ObservableObject

where
Element: Hashable
{
    private var _collection: (any Collection)?{
        didSet{

        }
        willSet{
            self.current = newValue?.first as? Element
            self.currentIndex = 0
        }
    }
    
    public var type: Any.Type? {
        get {
            guard let c = self.collection else {return nil}
            return Swift.type(of: c)
        }
    }
    
    public var collection: (any Collection)? {
        get { self._collection }
        set { self._collection = newValue }
    }
    
    private var _current: Element?
    var current: Element?{
        get { self._current }
        set { self._current = newValue }
    }
    
    private var _currentIndex: Int?
    var currentIndex: Int?{
        get { self._currentIndex }
        set { self._currentIndex = newValue }
    }
    
    
    // 컬렉션에 대한 정보 및 특성 나열
    var isNil: Bool                             { get { return self.collection == nil } }
    var isEmpty: Bool?                          { get { return self.collection?.isEmpty } }
    var isRandomAccessableCollection: Bool?     { get { return self.collection is any RandomAccessCollection } }
    
    
    // 생성자들
    init()                              { }
    init(collection: (any Collection))  { self.collection = collection }
    
    
    
    func append(_ element: Element){
        if self.type is Set<Element>.Type{
            if var i = (self.collection as? Set<Element>){
                i.insert(element)
            }
        }
        if self.type is Array<Element>.Type{
            if var i = (self.collection as? Array<Element>){
                i.append(element)
            }
        }
    }
    
    public var description: String {
        var string:String = ""
        
        if self.isNil {
            string = "nil"
        }
        else if self.isEmpty!{
            string = self.type.debugDescription
        }
        else{
            string += "Type                 : " + ((self.isNil) ? "nil" : (((self.type!).self as? CustomStringConvertible)?.description ?? self.type.debugDescription)) + "\n"
            string += "Contents             : " + ((self.isNil) ? "nil" : ((self.collection as? CustomStringConvertible)?.description ?? self.collection.debugDescription)) + "\n"
            string += "RandomAcessability   : " + ((self.isNil) ? "nil" : (self.isRandomAccessableCollection)!.description) + "\n"
            string += "Current Index        : " + ((self.isNil) ? "nil" : (self.currentIndex!.description)) + "\n"
            string += "Current              : " + ((self.isNil) ? "nil" : ((self.current as? CustomStringConvertible)?.description ?? self.current.debugDescription))
        }
        return string
    }
}

