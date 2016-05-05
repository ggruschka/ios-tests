//: Playground - noun: a place where people can play

import UIKit



extension Int {
    
    func isPrime() throws -> Bool {
        switch self {
        case 0, 1, 2:
            return true
        default:
            for index in 2...self {
                if self % index == 0 && index != self {
                    return false
                }
            }
            return true
        }
    }
    
}

//porqué Int.Primeblah y porqué let message
// el Int. es porque el ErrorType está declarado adentro de la extensión de Int
// y el let message es porque adentro de PrimeCalculationError declaré un case que "wrappea" datos. El enum de Swift soporta eso. Y para agarrar ese valor, usás let, o var

// el case contra qué está matcheando ZeroNotSupported? qué case. ese case no matchea contra nada, adentro de un enum el "case" es para decir que es un caso posible del enum, podés hacer:

enum PersonasInteligentes {
    case Guille
    case Fede
    case Hernan
}

var hola: PersonasInteligentes?
hola = .Guille // en este caso funciona, porque el . hace referencia al tipo que espera recibir la variable

switch hola {
case .Some(.Fede): //porqué el punto? en Swift podés usar punto para abreviar cosas que el compilador ya sabe y es redundante. Ejemplo
    print("es fede")
case .Some(.Guille):
    break
case .Some(.Hernan):
    break
case .None:
    print("estaba vacío")
}

// esto es lo que te contaba el otro día por Telegram.
// un ? es un Optional, que es un enum definido algo así:

enum Optional<Wrapped> {
    case Some(Wrapped)
    case None
}

var hola2: Optional<Int> = Optional.Some(3)
var estaEsNil = Optional<Int>.None
// por eso podés hacer pattern matching de la forma que mostré arriba



// si personas inteligentes está declarado en otro lado, o lejos de hola =.guille puede ser poco expresivo, o no? No. mirá:

var selectedIntelligentPerson: PersonasInteligentes?


//el try catch funciona como el switch case, usa "pattern matching". El error que nos viene en este caso particular es Int.PrimeCalculationError.ZeroNotSupported("El cero bla bla bla")
// y eso matchea con nuestro catch, y usamos let para poder tener el mensaje en una variable. si no te interesa el mensaje podés usar _

// noentiednno

// case What is ZeroNotSupporteD? por ejemplo, en isPrime, el case matchea 1,2 contra self



















selectedIntelligentPerson = .Hernan // se entiende perfecto
// hay alguna forma de saltar a lo que infiere? o expandirlo?
