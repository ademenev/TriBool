import TriBool
import Foundation

import Quick
import Nimble

let trueValue: TriBool = true
let falseValue: TriBool = false
let indeterminateValue: TriBool = .indeterminate

class TriBoolTestSpec: QuickSpec {

	override func spec() {
        describe("constructor") {
            describe("without parameters") {
                it("creates .indeterminate") {
                    expect(TriBool()).to(equal(TriBool.indeterminate))
                }
            }
            describe("with true") {
                it("creates .true") {
                    expect(TriBool(booleanLiteral: true)).to(equal(TriBool.true))
                }
            }
            describe("with false") {
                it("creates .false") {
                    expect(TriBool(booleanLiteral: false)).to(equal(TriBool.false))
                }
            }
        }
        describe("isIndeterminate") {
            it("returns true for .indeterminate") {
                expect(indeterminateValue.isIndeterminate).to(beTrue())
            }
            it("returns false for .true") {
                expect(trueValue.isIndeterminate).to(beFalse())
            }
            it("returns false for .false") {
                expect(falseValue.isIndeterminate).to(beFalse())
            }
        }

        describe("isTrue") {
            it("returns false for .indeterminate") {
                expect(indeterminateValue.isTrue).to(beFalse())
            }
            it("returns true for .true") {
                expect(trueValue.isTrue).to(beTrue())
            }
            it("returns false for .false") {
                expect(falseValue.isTrue).to(beFalse())
            }
        }
        
        describe("isFalse") {
            it("returns false for .indeterminate") {
                expect(indeterminateValue.isFalse).to(beFalse())
            }
            it("returns false for .true") {
                expect(trueValue.isFalse).to(beFalse())
            }
            it("returns true for .false") {
                expect(falseValue.isFalse).to(beTrue())
            }
        }
        
        describe("optBool") {
            it("returns nil for .indeterminate") {
                expect(indeterminateValue.optBool).to(beNil())
            }
            it("returns true for .true") {
                expect(trueValue.optBool).to(beTrue())
            }
            it("returns false for .false") {
                expect(falseValue.optBool).to(beFalse())
            }
        }
        
        describe("??") {
            it("is alias for isTrue") {
                expect(indeterminateValue.isTrue).to(equal(??indeterminateValue))
                expect(trueValue.isTrue).to(equal(??trueValue))
                expect(falseValue.isTrue).to(equal(??falseValue))
            }
        }
        
        describe("!?") {
            it("is alias for isFalse") {
                expect(indeterminateValue.isFalse).to(equal(!?indeterminateValue))
                expect(trueValue.isFalse).to(equal(!?trueValue))
                expect(falseValue.isFalse).to(equal(!?falseValue))
            }
        }

        describe("&&") {
            it("just works") {
                expect(indeterminateValue && indeterminateValue).to(equal(indeterminateValue))
                expect(indeterminateValue && trueValue).to(equal(indeterminateValue))
                expect(indeterminateValue && falseValue).to(equal(indeterminateValue))

                expect(trueValue && indeterminateValue).to(equal(indeterminateValue))
                expect(trueValue && trueValue).to(equal(trueValue))
                expect(trueValue && falseValue).to(equal(falseValue))

                expect(falseValue && indeterminateValue).to(equal(indeterminateValue))
                expect(falseValue && trueValue).to(equal(falseValue))
                expect(falseValue && falseValue).to(equal(falseValue))

                expect(indeterminateValue && true).to(equal(indeterminateValue))
                expect(indeterminateValue && false).to(equal(indeterminateValue))

                expect(trueValue && true).to(equal(trueValue))
                expect(trueValue && false).to(equal(falseValue))

                expect(falseValue && true).to(equal(falseValue))
                expect(falseValue && false).to(equal(falseValue))

                expect(true && indeterminateValue).to(equal(indeterminateValue))
                expect(true && trueValue).to(equal(trueValue))
                expect(true && falseValue).to(equal(falseValue))

                expect(false && indeterminateValue).to(equal(indeterminateValue))
                expect(false && trueValue).to(equal(falseValue))
                expect(false && falseValue).to(equal(falseValue))

            }
        }
        describe("||") {
            it("just works") {
                expect(indeterminateValue || indeterminateValue).to(equal(indeterminateValue))
                expect(indeterminateValue || trueValue).to(equal(trueValue))
                expect(indeterminateValue || falseValue).to(equal(indeterminateValue))

                expect(trueValue || indeterminateValue).to(equal(trueValue))
                expect(trueValue || trueValue).to(equal(trueValue))
                expect(trueValue || falseValue).to(equal(trueValue))

                expect(falseValue || indeterminateValue).to(equal(indeterminateValue))
                expect(falseValue || trueValue).to(equal(trueValue))
                expect(falseValue || falseValue).to(equal(falseValue))

                expect(indeterminateValue || true).to(equal(trueValue))
                expect(indeterminateValue || false).to(equal(indeterminateValue))

                expect(trueValue || true).to(equal(trueValue))
                expect(trueValue || false).to(equal(trueValue))

                expect(falseValue || true).to(equal(trueValue))
                expect(falseValue || false).to(equal(falseValue))

                expect(true || indeterminateValue).to(equal(trueValue))
                expect(true || trueValue).to(equal(trueValue))
                expect(true || falseValue).to(equal(trueValue))

                expect(false || indeterminateValue).to(equal(indeterminateValue))
                expect(false || trueValue).to(equal(trueValue))
                expect(false || falseValue).to(equal(falseValue))
            }
        }
        
        describe("^") {
            it("just works") {
                expect(indeterminateValue ^ indeterminateValue).to(equal(indeterminateValue))
                expect(indeterminateValue ^ trueValue).to(equal(indeterminateValue))
                expect(indeterminateValue ^ falseValue).to(equal(indeterminateValue))

                expect(trueValue ^ indeterminateValue).to(equal(indeterminateValue))
                expect(trueValue ^ trueValue).to(equal(falseValue))
                expect(trueValue ^ falseValue).to(equal(trueValue))

                expect(falseValue ^ indeterminateValue).to(equal(indeterminateValue))
                expect(falseValue ^ trueValue).to(equal(trueValue))
                expect(falseValue ^ falseValue).to(equal(falseValue))

                expect(indeterminateValue ^ true).to(equal(indeterminateValue))
                expect(indeterminateValue ^ false).to(equal(indeterminateValue))

                expect(trueValue ^ true).to(equal(falseValue))
                expect(trueValue ^ false).to(equal(trueValue))

                expect(falseValue ^ true).to(equal(trueValue))
                expect(falseValue ^ false).to(equal(falseValue))

                expect(true ^ indeterminateValue).to(equal(indeterminateValue))
                expect(true ^ trueValue).to(equal(falseValue))
                expect(true ^ falseValue).to(equal(trueValue))

                expect(false ^ indeterminateValue).to(equal(indeterminateValue))
                expect(false ^ trueValue).to(equal(trueValue))
                expect(false ^ falseValue).to(equal(falseValue))
            }
        }

        describe("!") {
            it("just works") {
                expect(!indeterminateValue).to(equal(indeterminateValue))
                expect(!trueValue).to(equal(falseValue))
                expect(!falseValue).to(equal(trueValue))
            }
        }
    }
}
