//
//  ChapterOnePageTwoController.swift
//  Book_Sources
//
//  Created by Lucas Pelinzon on 13/03/19.
//

import UIKit
import PlaygroundSupport
import NaturalLanguage

@available(iOS 12.0, *)
@objc(_TtC26Exploring_Natural_Language27ChapterOnePageTwoController)
public class ChapterOnePageTwoController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    //MARK: - Properties
    var text = "São Paulo is filled with great people and things to do."
    
    //MARK: - Outlets
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    //MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Custom Methods
    func countWords(_ text: String){
        let tokenizer = NLTokenizer(unit: .word)
        tokenizer.setLanguage(.english)
        tokenizer.string = text

        let tokens = tokenizer.tokens(for: text.startIndex..<text.endIndex)
        countLabel.text = "Sentence contains \(tokens.count) tokens."
    }
    
    func classifyWords(text: String){
        let tagger = NLTagger(tagSchemes: [.tokenType, .language, .lexicalClass, .nameType, .lemma, .nameTypeOrLexicalClass])
        tagger.string = text
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .nameTypeOrLexicalClass, options: options) { tag, tokenRange in
            if tag != nil {
                wordsLabel.text?.append("\(String(text[tokenRange]))\n")
                dogImage.image = UIImage(named: "Fred-4.png")
            }
            return true
        }
    }

    //MARK: - MessageHandler Methods
    public func receive(_ message: PlaygroundValue) {
        countWords(text)
        classifyWords(text: text)
    }
}
