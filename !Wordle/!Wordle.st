
Object subclass: #Wordle
  instanceVariableNames: 
    ' guesses history '
  classVariableNames: ''
  poolDictionaries: ''    !


!Wordle class methods !
  
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:35:50 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!Wordle methods !
   
allWords

	"loads all five letter words from file"
    | fs words line |
    #CodeTrackerBlock.  "Last Modified  15:54:09 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    words := OrderedCollection new.
    fs := File pathNameReadOnly: 'Data\fiveLetterWords.txt'.
    [fs atEnd]
        whileFalse:[
            line := fs nextLine.
            words add: line.].
    fs close.
    ^words! !



!Wordle methods !
   
colorForGuess: guess against: answer 

	"returns a 5 element array of colors corresponding to each letter in the guess."
    | color unmatched letter |
    #CodeTrackerBlock.  "Last Modified  09:11:18 06/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    color := Array new: 5.
    unmatched := Bag new.

	"mark greens and stores unmatched letters into an array"

	"puts 'G' at the guess index if it is = answer index answer"

	"adds letter to 'unmatched' Bag collection to check again for a yellow assignment and keep count of each element inside."

	"only applies to positions not already marked green. Removes letter from the 'unmacthed' array if it is misplaced and marks yellow. 
	 Marks black for remaining letters still in 'unmatched'."

	 "if the letter is in the unmatched collection and the letter in the guess is = a letter in the answer, the color array will add 'Y' for a misplaced letter at that index."

	 "if the letter is absent from the word and not in the 'unmatched' collection, then we know it is not in the word at all and is marked 'B'."
    1 to: 5 do: [:index |
        letter := guess at: index.
        (letter = (answer at: index))
            ifTrue:[color at: index put: 'G']
            ifFalse:[unmatched add: (answer at: index)].].
    1 to: 5 do: [:index |
        (color at: index) ifNil: [
            letter := guess at: index.
            (unmatched includes: letter)
                ifTrue:[
                    color at: index put: 'Y'.
                    unmatched remove: letter ifAbsent: [].]
                ifFalse:[color at: index put: 'B'.].].].
    ^color! !



!Wordle methods !
   
guesses

		"stores guesses into an initially empty collection. keep guesses in the order they were made."
    #CodeTrackerBlock.  "Last Modified  09:55:52 06/10/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    guesses isNil
        ifTrue:[guesses := OrderedCollection new].
    ^guesses! !



!Wordle methods !
  
guesses: aCollection 

		  "guesses is an ordered collection"
    #CodeTrackerBlock.  "Last Modified  09:43:45 06/10/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    guesses := aCollection! !



!Wordle methods !
   
history
    #CodeTrackerBlock.  "Last Modified  15:08:15 06/10/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^history! !



!Wordle methods !
 
history: aValue 

		  "initialize history to be consistent across methods"
    #CodeTrackerBlock.  "Last Modified  15:11:42 06/10/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    history isNil
        ifTrue:[history := OrderedCollection new].
    ^history! !



!Wordle methods !
 
suggestGuessFrom: history 

			"suggests valid candidate words based on results from other methods that determine what criteria is met"
    #CodeTrackerBlock.  "Last Modified  11:58:32 06/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "use different word lists in different contexts"
    ^self validWordsFrom: self allWords fitsClueHistory: history.

	"returns the collection of all words that could fit for the next guess"! !



!Wordle methods !
  
validWordsFrom: dictionary fitsClueHistory: history 

	"Return all words from dictionary that fit the clue history."
    #CodeTrackerBlock.  "Last Modified  11:53:11 06/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^dictionary select: [:candidateWord |
        self word: candidateWord fitsClueHistory: history].! !



!Wordle methods !
  
word: candidateWord fitsClueHistory: history 

		"returns true if the word meets the clues in the color pattern"
    | guess pattern |
    #CodeTrackerBlock.  "Last Modified  13:10:50 06/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Wordle. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "method takes a word 'candidateWord' as an argument"

	"loops through the history that checks that the clues apply to valid words, and only returns what words satify the color match .
	The list of suggestions will always decrease or stay the same."

	"history is a collection of the guess + color pair. We want to access each element and assign it to the corresponding color and letter 
	at position i"

	"Return true if candidateWord fits all clues in history"
    ^(history detect: [:entry |
        guess := entry at: 1.
        pattern := entry at: 2.
        (self colorForGuess: guess against: candidateWord) ~= pattern] ifNone: [nil]) isNil.

		"if no mismatched entry is found (candidateWord fits all clues/colors), we return Nil"

		"our test data will be formated as #('guess (string)', 'color (string)' so we can use first and second to access these values."! !
