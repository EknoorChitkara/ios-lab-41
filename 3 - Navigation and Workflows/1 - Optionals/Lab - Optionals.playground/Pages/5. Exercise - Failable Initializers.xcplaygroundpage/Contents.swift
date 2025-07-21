/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    let ram: Int
    let yearManufactured: Int
    
    init?(ram: Int, yearManufactured: Int) {
        if ram > 0, yearManufactured > 1970, yearManufactured < 2020 {
            self.ram = ram
            self.yearManufactured = yearManufactured
        } else {
            return nil  // only fail when the conditions are not met
        }
    }

}

//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
var myComp: Computer? = Computer(ram: 8, yearManufactured: 2019)
var yourComp: Computer? = Computer(ram: -1, yearManufactured: 2019)

if let computer1 = myComp {
    print("Valid computer — RAM: \(computer1.ram)GB, Year: \(computer1.yearManufactured)")
} else {
    print("validComputer is nil")
}

if let computer2 = yourComp {
    print("Invalid computer — RAM: \(computer2.ram)GB, Year: \(computer2.yearManufactured)")
} else {
    print("invalidComputer is nil")
}

/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */
