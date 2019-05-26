//#-hidden-code
import PlaygroundSupport

let proxy = PlaygroundPage.current.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
 # Categorizing the News
 
 The last dataset we are going to take a look at is the [20 Newsgroups Dataset](http://qwone.com/~jason/20Newsgroups/). Its data is comprised of 20000 documents split into 20 different newsgroups. This kind of classification may come in handy when we want to quickly assign huge amounts of data into predefined categories.
 
 ## Using the Dataset
 
 To implement the model and help Fred categorize the magazines for us, let’s change the ``enableClassification`` variable below to ``true``. Upon running your code, they should all be correctly organized based on their newsgroup.
 */
  var enableClassification = /*#-editable-code*/false/*#-end-editable-code*/
/*:
 Let’s also try altering the ``articleTitle`` string below to a different article name to check if the algorithm correctly guesses what it’s about. Use a title you would expect to see in an article of something you enjoy, such as science, technology and so on.
 */
 var articleTitle = /*#-editable-code*/"Apple announces the new iMac"/*#-end-editable-code*/
/*:
 ## Wrapping Up
 
 Great work! In this Playground Book, you have learned the main concepts behind natural language processing and were able to play with some of the best publicly available datasets! 😄
 
 I sincerely hope you have enjoyed your journey, and this Book inspires you to **build great things** using the Natural Language Framework. 😍
 */
//#-hidden-code
proxy.send(.string(articleTitle))
proxy.send(.boolean(enableClassification))

if enableClassification {
    PlaygroundPage.current.assessmentStatus = .pass(message: "Hope you enjoyed this Playground Book. Thank you! 😁")
}
//#-end-hidden-code
