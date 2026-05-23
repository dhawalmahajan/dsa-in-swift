//
//  SystemDesign.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 18/05/26.
//
enum SystemDesignDemo {
    case oops(OOPS)
    case solid(SolidPrinciples)
    case pattern(DesignPatterns)
    case realExample(AppsDemo)
}
enum OOPS {
    case staticAndDynamicPolymorphism
    case staticPolymorphism
    case inheritance
    case abstraction
    case encapsulation
}
enum SolidPrinciples {
    case liskovSubstitution
    case openClose
    case singleResponsibility
    case dependencyInversion
    case interfaceSegregation
}

enum DesignPatterns {
    case strategyPattern
    case abstractFactory
    case singleton
    case decoratorPattern
}
enum AppsDemo {
    case documentEditor
    case tomatoApp
}
//enum SystemDesignDemo {
//
//    // MARK: OOPS
//    
//    // MARK: SOLID
//
//    
//
//    // MARK: Design Patterns
//
//   
//
//    // MARK: Real Examples
//
//
//
//    // MARK: - Segregation by Type (no functions)
//    
//
//    var category: Category {
//        switch self {
//        case .staticAndDynamicPolymorphism, .staticPolymorphism:
//            return .oops
//        case .liskovSubstitution, .openClose, .singleResponsibility, .dependencyInversion, .interfaceSegregation:
//            return .solid
//        case .strategyPattern, .abstractFactory, .singleton, .decoratorPattern:
//            return .pattern
//        case .documentEditor, .tomatoApp:
//            return .realExample
//        }
//    }
//}
