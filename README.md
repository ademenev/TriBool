# TriBool

Swift enum for 3-state boolean logic, with support functions and operators.

TriBool enum is similar to the built-in Bool type, but for 3-state boolean logic. The three states are true, false, and indeterminate, where the first two states are equivalent to those of the Bool type and the last state represents an unknown boolean value (that may be true or false, we don't know).

## Motivation

Although 3-state booleans can be represented in Swift using `Optional<Bool>`, semantically they are different. Optional `nil` represents a **missing** value, and 3-state boolean indeterminate represents an **unknown** value. It's not missing, we just do not know what it is.

## Usage

### Creating

```swift
let indeterminateValue = TriBool()
let trueValue = TriBool(true)
let falseValue = TriBool(false)
```
or

```swift
let indeterminateValue : TriBool = .indeterminate
let trueValue : TriBool = .true
let falseValue : TriBool = .false
```

`TriBool` conforms to `ExpressibleByBooleanLiteral` protocol, and can be created from literal Bool values:

```swift
let trueValue : TriBool = true
let falseValue : TriBool = false
```

### Checking values

```swift
print(trueValue.isTrue) // true
print(falseValue.isTrue) // false
print(indeterminateValue.isTrue) // false

print(trueValue.isFalse) // false
print(falseValue.isFalse) // true
print(indeterminateValue.isFalse) // false

print(trueValue.isIndeterminate) // false
print(falseValue.isIndeterminate) // false
print(indeterminateValue.isIndeterminate) // true
```

### Converting to Optional\<Bool\>

```swift
print(trueValue.optBool) // Optional(true)
print(falseValue.optBool) // Optional(false)
print(indeterminateValue.optBool) // nil
```


### Operators
#### Prefix operators

`??` - same as isTrue

```swift
print(??trueValue) // true
print(??falseValue) // false
print(??indeterminateValue) // false
```

`!?` - same as isFalse

```swift
print(!?trueValue) // false
print(!?falseValue) // true
print(!?indeterminateValue) // false
```

`!` - negation

```swift
print(!trueValue) // false
print(!falseValue) // true
print(!?indeterminateValue) // indeterminate
```

#### Infix operators

Infix operators `&&`, `||` and `^` (logical AND, logical OR, and logical exclusive OR, respectively)  can be used with two TriBool values, or a TriBool and Bool:

<table>
  <tr>
    <th colspan="4"><code>&&</code> truth table (two Tribool's)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
    <th>indeterminate</th>
  </tr>
  <tr>
    <th>true</th>
    <td>true</td>
    <td>false</td>
    <td>indeterminate</td>
  </tr>
  <tr>
    <th>false</th>
    <td>false</td>
    <td>false</td>
    <td>false</td>
  </tr>
  <tr>
    <th>indeterminate</th>
    <td>indeterminate</td>
    <td>false</td>
    <td>indeterminate</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="3"><code>&&</code> truth table (Tribool and Bool)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
  </tr>
  <tr>
    <th>true</th>
    <td>true</td>
    <td>false</td>
  </tr>
  <tr>
    <th>false</th>
    <td>false</td>
    <td>false</td>
  </tr>
  <tr>
    <th>indeterminate</th>
    <td>indeterminate</td>
    <td>false</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="4"><code>&&</code> truth table (Bool and Tribool)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
    <th>indeterminate</th>
  </tr>
  <tr>
    <th>true</th>
    <td>true</td>
    <td>false</td>
    <td>indeterminate</td>
  </tr>
  <tr>
    <th>false</th>
    <td>false</td>
    <td>false</td>
    <td>false</td>
  </tr>
</table>


<table>
  <tr>
    <th colspan="4"><code>||</code> truth table (two Tribool's)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
    <th>indeterminate</th>
  </tr>
  <tr>
    <th>true</th>
    <td>true</td>
    <td>true</td>
    <td>true</td>
  </tr>
  <tr>
    <th>false</th>
    <td>true</td>
    <td>false</td>
    <td>indeterminate</td>
  </tr>
  <tr>
    <th>indeterminate</th>
    <td>true</td>
    <td>indeterminate</td>
    <td>indeterminate</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="3"><code>||</code> truth table (Tribool and Bool)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
  </tr>
  <tr>
    <th>true</th>
    <td>true</td>
    <td>true</td>
  </tr>
  <tr>
    <th>false</th>
    <td>true</td>
    <td>false</td>
  </tr>
  <tr>
    <th>indeterminate</th>
    <td>true</td>
    <td>indeterminate</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="4"><code>||</code> truth table (Bool and Tribool)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
    <th>indeterminate</th>
  </tr>
  <tr>
    <th>true</th>
    <td>true</td>
    <td>true</td>
    <td>true</td>
  </tr>
  <tr>
    <th>false</th>
    <td>true</td>
    <td>false</td>
    <td>indeterminate</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="4"><code>^</code> truth table (two Tribool's)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
    <th>indeterminate</th>
  </tr>
  <tr>
    <th>true</th>
    <td>false</td>
    <td>true</td>
    <td>indeterminate</td>
  </tr>
  <tr>
    <th>false</th>
    <td>true</td>
    <td>false</td>
    <td>indeterminate</td>
  </tr>
  <tr>
    <th>indeterminate</th>
    <td>indeterminate</td>
    <td>indeterminate</td>
    <td>indeterminate</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="3"><code>^</code> truth table (Tribool and Bool)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
  </tr>
  <tr>
    <th>true</th>
    <td>false</td>
    <td>true</td>
  </tr>
  <tr>
    <th>false</th>
    <td>true</td>
    <td>false</td>
  </tr>
  <tr>
    <th>indeterminate</th>
    <td>indeterminate</td>
    <td>indeterminate</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="4"><code>^</code> truth table (Bool and Tribool)</th>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <th>true</th>
    <th>false</th>
    <th>indeterminate</th>
  </tr>
  <tr>
    <th>true</th>
    <td>false</td>
    <td>true</td>
    <td>indeterminate</td>
  </tr>
  <tr>
    <th>false</th>
    <td>true</td>
    <td>false</td>
    <td>indeterminate</td>
  </tr>
</table>
