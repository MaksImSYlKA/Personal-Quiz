//
//  Question.swift
//  Personal Quiz
//
//  Created by Максим Сылка on 22.01.2024.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
            case .dog:
                "Вам нравится быть с друзьями. Вы окружайте себя людьми, которые вам нравятся и всегда готовы помочь."
            case .cat:
                "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
            case .rabbit:
                "Вам нравится всё мягкая. Вы здоровы и полны энергии."
            case .turtle:
                "Ваша сила – в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
}
