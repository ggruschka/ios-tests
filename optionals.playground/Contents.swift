//: Playground - noun: a place where people can play

import UIKit

// entre esto:

var optionalString: String?

optionalString = "ola"

if let unwrappedVar = optionalString {
    print(unwrappedVar)
}

// y esto:

// esto no te compila, porque el print(_) recibe un Any, no un Any?. la implementación de esa función requiere
// que se le pase algo por parámetro, algo que no pueda ser nil

// en qué casos usarías "optionalString?". lo usaría en chaining

struct Smartphone {
    var model = "iPhone 6s"
}

struct Person {
    var name: String
    var smartphone: Smartphone?
}

struct House {
    var address: String
    var owner: Person
    var coowner: Person?
}

var guille = Person(name: "Guillermo", smartphone: nil)
var house = House(address: "Lo de Guille", owner: guille, coowner: nil)

if let model = house.coowner?.smartphone?.model {
    print(model)
} else {
    print("no se papi")
}

// esta línea por ejemplo nunca se ejecutó, porque en este punto no existía el coowner
house.coowner?.smartphone?.model = "iPhone 7"

if let model = house.coowner?.smartphone?.model {
    print(model)
} else {
    print("no se papi")
}

var fede = Person(name: "Fede", smartphone: Smartphone(model: "iPhone 8"))
house.coowner = fede

if let model = house.coowner?.smartphone?.model {
    print(model)
} else {
    print("no se papi")
}

// esta línea se ejecuta solamente si existe el coowner, y a su vez si existe el smartphone del coowner.
// basta con que uno de esos dos no exista, para que no se haga nada
// esta sí se ejecutó, porque ya existía fede como coowner, y además fede tiene smartphone
house.coowner?.smartphone?.model = "iPhone 9"

// acá es lo mismo, el let se ejecuta solamente si existía todo, si no, cae en el else
if let model = house.coowner?.smartphone?.model {
    print(model)
} else {
    print("no se papi")
}

// entiendo.
// no es como medio redundante? sabiendo que es Optional, para qué ponerle "?" en el chaining?
// si vos ves la línea
// house.coowner.smartphone.model = "algo"
// como desarrollador no te das cuenta que eso puede no estar haciendo nada
// además es una cuestión de que no tendría sentido lo que decís, porque coowner es tipo Person?, es decir Optional<Person>
// y la interfaz de Optional<T> no tiene la misma interfaz que T. Entonces no deberías poder llamar un método de T, sobre Optional<T>
// Optional es un struct
// el ? lo que hace es unwrappearlo, y una vez unwrappeado, ahí si estás teniendo la interfaz de T

// Es como !, pero en vez de forzarlo, si es nil no unrwappea nada y sale? exactamente
// el ! te da la interfaz de T, pero sin antes preguntar si era nil o no

// es como indireccionar un puntero en C, pero ahora podés forzarlo haciendo *pointer, o usar "?" y si no se puede indireccionar porque es nil, sale.
// por indireccionar me refiero a acceder al valor.

// si en C tenés int a= 4; int *pointer = &a, si quiero acceder al valor de pointer tengo que indireccionarlo, si pointer es nil rompe
// lo que digo es que "!" sería como hacer &pointer. en cambio ? sería (pointer != 0)?usalo:nolouses


