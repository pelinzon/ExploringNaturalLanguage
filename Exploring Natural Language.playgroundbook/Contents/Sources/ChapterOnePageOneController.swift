//
//  ChapterOnePageOneController.swift
//  Book_Sources
//
//  Created by Lucas Pelinzon on 13/03/19.
//

import UIKit
import PlaygroundSupport
import NaturalLanguage

@available(iOS 12.0, *)
@objc(_TtC26Exploring_Natural_Language27ChapterOnePageOneController)
public class ChapterOnePageOneController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    //MARK: - Properties
    let recognizer = NLLanguageRecognizer()
    var greeting = "Como você está fred?"
    
    //MARK: - Outlets
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var firstLanguageLabel: UILabel!
    @IBOutlet weak var secondLanguageLabel: UILabel!
    @IBOutlet weak var thirdLanguageLabel: UILabel!
    
    //MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        let possibleLanguages = getLanguagePossibilities(greeting)
        setLanguageLabels(possibleLanguages)
    }
    
    //MARK: - Custom Methods
    func getLanguagePossibilities(_ string: String) -> [(String, Int)] {
        recognizer.reset()
        recognizer.processString(string)
        let hypotheses = recognizer.languageHypotheses(withMaximum: 3)
        let sortedHypotheses = try! hypotheses.sorted(by: { $0.value > $1.value })
        var formattedHypotheses: [(String, Int)] = []
        
        for hypothesis in sortedHypotheses {
            let formattedLanguage = formatLanguageName(hypothesis.key)
            let formattedPercentage = Int((hypothesis.value * 100))
            formattedHypotheses.append((formattedLanguage, formattedPercentage))
        }
        return formattedHypotheses
    }
    
    func setLanguageLabels(_ possibleLanguages: [(String, Int)]){
        firstLanguageLabel.text =  "\(possibleLanguages[0].0) (\(possibleLanguages[0].1)% Confidence)"
        secondLanguageLabel.text =  "\(possibleLanguages[1].0) (\(possibleLanguages[1].1)% Confidence)"
        thirdLanguageLabel.text =  "\(possibleLanguages[2].0) (\(possibleLanguages[2].1)% Confidence)"
        
        if possibleLanguages[0].0 == "English" {
            dogImage.image = UIImage(named: "Fred-2.png")
        } else {
            dogImage.image = UIImage(named: "Fred-1.png")
        }
    }
    
    func formatLanguageName(_ language: NLLanguage) -> String {
        switch language {
        case NLLanguage.amharic:
            return("Amharic")
        case NLLanguage.arabic:
            return("Arabic")
        case NLLanguage.armenian:
            return("Armenian")
        case NLLanguage.bengali:
            return("Bengali")
        case NLLanguage.bulgarian:
            return("Bulgarian")
        case NLLanguage.burmese:
            return("Burmese")
        case NLLanguage.catalan:
            return("Catalan")
        case NLLanguage.cherokee:
            return("Cherokee")
        case NLLanguage.croatian:
            return("Croatian")
        case NLLanguage.czech:
            return("Czech")
        case NLLanguage.dutch:
            return("Dutch")
        case NLLanguage.english:
            return("English")
        case NLLanguage.finnish:
            return("Finnish")
        case NLLanguage.french:
            return("French")
        case NLLanguage.georgian:
            return("Georgian")
        case NLLanguage.german:
            return("German")
        case NLLanguage.greek:
            return("Greek")
        case NLLanguage.gujarati:
            return("Gujarati")
        case NLLanguage.hebrew:
            return("Hebrew")
        case NLLanguage.hindi:
            return("Hindi")
        case NLLanguage.hungarian:
            return("Hungarian")
        case NLLanguage.icelandic:
            return("Icelandic")
        case NLLanguage.indonesian:
            return("Indonesian")
        case NLLanguage.italian:
            return("Italian")
        case NLLanguage.japanese:
            return("Japanese")
        case NLLanguage.kannada:
            return("Kannada")
        case NLLanguage.khmer:
            return("Khmer")
        case NLLanguage.korean:
            return("Korean")
        case NLLanguage.lao:
            return("Lao")
        case NLLanguage.malay:
            return("Malay")
        case NLLanguage.marathi:
            return("Marathi")
        case NLLanguage.mongolian:
            return("Mongolian")
        case NLLanguage.norwegian:
            return("Norwegian")
        case NLLanguage.oriya:
            return("Oriya")
        case NLLanguage.persian:
            return("Persian")
        case NLLanguage.polish:
            return("Polish")
        case NLLanguage.portuguese:
            return("Portuguese")
        case NLLanguage.punjabi:
            return("Punjabi")
        case NLLanguage.romanian:
            return("Romanian")
        case NLLanguage.russian:
            return("Russian")
        case NLLanguage.simplifiedChinese:
            return("Simplified Chinese")
        case NLLanguage.sinhalese:
            return("Sinhlese")
        case NLLanguage.slovak:
            return("Slovak")
        case NLLanguage.spanish:
            return("Spanish")
        case NLLanguage.swedish:
            return("Swedish")
        case NLLanguage.tamil:
            return("Tamil")
        case NLLanguage.telugu:
            return("Telugu")
        case NLLanguage.thai:
            return("Thai")
        case NLLanguage.tibetan:
            return("Tibetan")
        case NLLanguage.traditionalChinese:
            return("Traditional Chinese")
        case NLLanguage.turkish:
            return("Turkish")
        case NLLanguage.ukrainian:
            return("Ukrainian")
        case NLLanguage.urdu:
            return("Urdu")
        case NLLanguage.vietnamese:
            return("Vietnamese")
        default:
            return("Undetermined")
        }
    }
    
    //MARK: - MessageHandler Methods
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .string(text):
            let possibleLanguages = getLanguagePossibilities(text)
            setLanguageLabels(possibleLanguages)
        default:
            break
        }
    }
}
