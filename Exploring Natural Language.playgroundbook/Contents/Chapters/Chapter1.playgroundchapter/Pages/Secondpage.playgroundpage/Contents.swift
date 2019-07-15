//#-hidden-code
import PlaygroundSupport

let proxy = PlaygroundPage.current.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
# Tokenizing Elements

Another cool thing that you can do with the Natural Language Framework is **Tokenization**. In other words, you’re able to easily split strings into smaller components – called **tokens** – and execute actions on them afterwards. This is an important concept that is used throughout this Playground Book.

Strings may be split into different units, such as words, sentences and paragraphs. We are going to use words in the next example, where we will split the sentence variable into words.
*/
let sentence = "São Paulo is filled with great people and things to do."
/*:
Tap *Run My Code* to check it out. Our good boy should be able to split the sentence appropriately and tell us how many words there are. 😎

This can come in handy in multiple applications, such as dictionary apps, translators and any other projects that take advantage of **word tagging**. Now it’s now time to [go the next page](@next) and look into the Custom NLP Models.
*/
//#-hidden-code
proxy.send(.string("Code has been run."))

PlaygroundPage.current.assessmentStatus = .pass(message: "Awesome! Once you're ready, ready over to the next page 😁")
//#-end-hidden-code
