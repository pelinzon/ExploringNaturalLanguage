//#-hidden-code
import PlaygroundSupport

let proxy = PlaygroundPage.current.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
# An Introduction to Natural Language
 
Hey there! In this playground book, you will learn the basics of natural language processing (NLP) and the **Natural Language Framework**, which was introduced at WWDC 2018. It features everything that’s present on ``NSLinguisticTagger`` in a easy to use Swift interface, adding the ability to use **Custom NLP Models**!
 
* Important: This Playground Book is best experienced in Landscape with the LiveView alongside the code.
 
 Here’s a couple of things it can do 😁:
 
 - Find the languages present on a string
 - Break it into words
 - Identify parts of speech (such as verbs, adjectives and even entities)
 - Transform words into their stem form
 - And so much more!
 
Pretty exciting, right? In this chapter, we’ll go through a couple of concepts of NLP and get to know some real-life applications.  Let’s dive right in!
 
## Identifying Languages
 
First, let me introduce you to **Fred**. He’s the good boy sitting right next to us, and he’s here to help you understand the concepts behind NLP. However, I tried to talk to him in Portuguese and he seems pretty confused. Let’s try modifying the code below to ask how he’s doing in English, shall we? 😍
 */
var greeting = /*#-editable-code*/"Como você está, Fred?"/*#-end-editable-code*/
/*:
Once you’ve changed the ``greeting`` variable above to English, tap *Run My Code* to check if the dog understands you.

 ## Multiple Languages in a Sentence
 
A confidence level is also provided for the languages it believes the sentence contains. This can come in handy if a sentence has words in more than one language, and you want to identify a language other than the dominant one.
 
* Experiment: If you speak more than one language, try modifying the greeting to see if our good boy is smart enough to identify it. 😃

 Once you’re done, let’s [head over to next page](@next) to check out **Tokenization**.
 */
//#-hidden-code
proxy.send(.string(greeting))

if greeting != "Como você está, Fred?" {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Awesome! Once you're ready, ready over to the next page 😁")
}
//#-end-hidden-code
