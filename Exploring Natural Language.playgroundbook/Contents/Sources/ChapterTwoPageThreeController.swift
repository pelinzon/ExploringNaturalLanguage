//
//  ChapterTwoPageThreeController.swift
//  Book_Sources
//
//  Created by Lucas Pelinzon on 13/03/19.
//

import UIKit
import PlaygroundSupport
import NaturalLanguage

@available(iOS 12.0, *)
@objc(_TtC26Exploring_Natural_Language29ChapterTwoPageThreeController)
public class ChapterTwoPageThreeController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    //MARK: - Properties
    var magazines: [(String, String)] = [("Selling my Macbook Pro for 1500$", "Unknown"),
                     ("New battery technology released", "Unknown"),
                     ("FDA allows use of new medicine", "Unknown"),
                     ("Should firearms be more restricted?", "Unknown"),
                     ("Pluto is no longer a planet", "Unknown"),
                     ("The impact of atheism in society", "Unknown")]
    
    var articleTitle = "Apple announces the new iMac"
    let topicClassifier = try! NLModel(mlModel: TopicClassifier().model)
    
    //MARK: - Outlets
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var magazineOneType: UILabel!
    @IBOutlet weak var magazineTwoType: UILabel!
    @IBOutlet weak var magazineThreeType: UILabel!
    @IBOutlet weak var magazineFourType: UILabel!
    @IBOutlet weak var magazineFiveType: UILabel!
    @IBOutlet weak var magazineSixType: UILabel!
    
    //MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Custom Methods
    func classifyMagazines() {
        var magazineIndex = 0
        for magazine in magazines {
            let predictedLabel = topicClassifier.predictedLabel(for: magazine.0)!
            let formattedLabel = formatResult(predictedLabel)
            magazines[magazineIndex].1 = formattedLabel
            magazineIndex += 1
        }
        setLabels()
    }
    
    func classifyArticle(_ text: String) {
        let result = topicClassifier.predictedLabel(for: text)!
        let formattedResult = formatResult(result)
        classificationLabel.text = "The article talks about \(formattedResult)."
        dogImage.image = UIImage(named: "Fred-14.png")
    }
    
    func setLabels() {
        magazineOneType.text = magazines[0].1
        magazineTwoType.text = magazines[1].1
        magazineThreeType.text = magazines[2].1
        magazineFourType.text = magazines[3].1
        magazineFiveType.text = magazines[4].1
        magazineSixType.text = magazines[5].1
    }
    
    func formatResult(_ result: String) -> String{
        switch result {
        case "comp.graphics":
            return "Graphics"
        case "comp.os.ms-windows.misc":
            return "Windows"
        case "comp.sys.ibm.pc.hardware":
            return "PC"
        case "comp.sys.mac.hardware":
            return "Mac"
        case "comp.windows.x":
            return "Windows"
        case "misc.forsale":
            return "For Sale"
        case "rec.autos":
            return "Cars/Autos"
        case "rec.motorcycles":
            return "Motorcycles"
        case "rec.sport.baseball":
            return "Baseball"
        case "rec.sport.hockey":
            return "Hockey"
        case "talk.politics.misc":
            return "Politics"
        case "talk.politics.guns":
            return "Guns"
        case "talk.politics.mideast":
            return "Middle East"
        case "sci.crypt":
            return "Cryptocurrency"
        case "sci.electronics":
            return "Eletronics"
        case "sci.med":
            return "Medicine"
        case "sci.space":
            return "Space"
        case "talk.religion.misc":
            return "Religion"
        case "alt.atheism":
            return "Atheism"
        case "soc.religion.christian":
            return "Christianism"
        default:
            return "Unknown"
        }
    }
    
    //MARK: - MessageHandler Methods
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .string(msg):
            self.articleTitle = msg
            classifyArticle(articleTitle)
        case let .boolean(boolVar):
            if boolVar {
               classifyMagazines()
            }
        default:
            break
        }
    }
}
