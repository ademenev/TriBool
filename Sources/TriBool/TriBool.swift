public enum TriBool : ExpressibleByBooleanLiteral {
    
    public typealias BooleanLiteralType = Bool
    case `true`
    case `false`
    case indeterminate

    public init() {
        self = .indeterminate
    }

    public init(_ value: Bool) {
        self.init(booleanLiteral: value)
    }

    public init(booleanLiteral value: Bool) {
        if value {
            self = .true
        } else {
            self = .false
        }
    }

    public var isIndeterminate: Bool {
        switch self {
        case .indeterminate:
            return true
        default:
            return false
        }
    }

    public var isTrue: Bool {
        switch self {
        case .true:
            return true
        default:
            return false
        }
    }
 
    public var isFalse: Bool {
        switch self {
        case .false:
            return true
        default:
            return false
        }
    }

    public var optBool: Bool? {
        switch self {
        case .indeterminate:
            return nil
        default:
            return self == .true
        }
    }

}

prefix operator ??
prefix operator !?

public func && (lhs: TriBool, rhs: TriBool) -> TriBool {
    if lhs.isIndeterminate || rhs.isIndeterminate {
        return .indeterminate
    }
    return lhs.isTrue && rhs.isTrue ? .true : .false
}

public func && (lhs: TriBool, rhs: Bool) -> TriBool {
    if lhs.isIndeterminate {
        return .indeterminate
    }
    return lhs.isTrue && rhs ? .true : .false
}

public func && (lhs: Bool, rhs: TriBool) -> TriBool {
    if rhs.isIndeterminate {
        return .indeterminate
    }
    return rhs.isTrue && lhs ? .true : .false
}

public func || (lhs: TriBool, rhs: TriBool) -> TriBool {
    if lhs.isTrue || rhs.isTrue {
        return .true
    }
    return lhs.isIndeterminate || rhs.isIndeterminate ? .indeterminate : .false
}

public func || (lhs: TriBool, rhs: Bool) -> TriBool {
    if lhs.isIndeterminate {
        return rhs ? .true : false
    }
    return lhs.isTrue || rhs ? .true : .false
}

public func || (lhs: Bool, rhs: TriBool) -> TriBool {
    if rhs.isIndeterminate {
        return lhs ? .true : false
    }
    return rhs.isTrue || lhs ? .true : .false
}

public func ^ (lhs: TriBool, rhs: TriBool) -> TriBool {
    if lhs.isIndeterminate || rhs.isIndeterminate {
        return .indeterminate
    }
    return lhs.isTrue != rhs.isTrue ? .true : .false
}

public func ^ (lhs: TriBool, rhs: Bool) -> TriBool {
    if lhs.isIndeterminate {
        return .indeterminate
    }
    return lhs.isTrue != rhs ? .true : .false
}

public func ^ (lhs: Bool, rhs: TriBool) -> TriBool {
    if rhs.isIndeterminate {
        return .indeterminate
    }
    return rhs.isTrue != lhs ? .true : .false
}


public prefix func ??(value: TriBool) -> Bool {
    return value.isTrue
}

public prefix func !?(value: TriBool) -> Bool {
    return value.isFalse
}

public prefix func !(value: TriBool) -> TriBool {
        switch value {
        case .true:
            return .false
        case .false:
            return .true
        default:
            return .indeterminate
        }
}
