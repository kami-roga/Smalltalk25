
Object subclass: #GolfPlayer
  instanceVariableNames: 
    ' name handicap grossScores handicapStrokes '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #GolfTeam
  instanceVariableNames: 
    ' player1 player2 '
  classVariableNames: ''
  poolDictionaries: '' !
Object subclass: #GolfTournament
  instanceVariableNames: 
    ' tournament course handicapStrokes teams '
  classVariableNames: ''
  poolDictionaries: ''   !


!GolfPlayer class methods !
  
fromString: aString 

		"creating an instance of player from formatted string"
    | player |
    #CodeTrackerBlock.  "Last Modified  15:10:41 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player := self new.
    player initializeWith: aString.
    ^player! !



!GolfPlayer class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  17:02:21 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!GolfPlayer methods !
 
fromString: aString 

		"creating an instance of player from formatted string"
    | player |
    #CodeTrackerBlock.  "Last Modified  15:07:25 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player := self new.
    player initializeWith: aString.
    ^player! !



!GolfPlayer methods !
   
grossScores
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^grossScores! !



!GolfPlayer methods !
   
grossScores: aValue
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    grossScores := aValue! !



!GolfPlayer methods !
  
handicap
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^handicap! !



!GolfPlayer methods !
 
handicap: aValue
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    handicap := aValue! !



!GolfPlayer methods !

handicapStrokes
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^handicapStrokes! !



!GolfPlayer methods !
   
handicapStrokes: aValue
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    handicapStrokes := aValue! !



!GolfPlayer methods !
  
initializeWith: aString 

			"setting up a GolfPlayer from a string"
    | var gross |
    #CodeTrackerBlock.  "Last Modified  16:43:34 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    var := aString asArrayOfSubstringsSeparatedBy: $=.
    name := var first.
    handicap := (var two asInteger).
    gross := var three.
    grossScores := gross asOrderedCollection collect: [:s | Integer fromString: s asString].! !



!GolfPlayer methods !

name
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^name! !



!GolfPlayer methods !
 
name: aValue
    #CodeTrackerBlock.  "Last Modified  16:42:51 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    name := aValue! !



!GolfPlayer methods !

netScoreForHole: holeNumber
   
        "calculate gross score"
    #CodeTrackerBlock.  "Last Modified  16:41:10 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(handicapStrokes at: holeNumber) <= handicap
        ifTrue: [(grossScores at: holeNumber)-1]
        ifFalse: [grossScores at: holeNumber].! !



!GolfTeam class methods !

computeTeamNetScore

		"taking the lowest of the two net scores and storing the result as the teamNetScore"
    | teamNetScore player1 player2 |
    #CodeTrackerBlock.  "Last Modified  14:05:11 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teamNetScore := (1 to: 18) collect: [:i | (player1 netScore at: i) min: (player2 netScore at: i)].! !



!GolfTeam class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  17:03:21 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!GolfTeam methods !
   
addPlayers: players 

	  "assigning player one and player two"
    #CodeTrackerBlock.  "Last Modified  13:50:09 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player1 := players first.
    player2 := players second.! !



!GolfTeam methods !
 
finalScore

	"final scores"
    | netScores |
    #CodeTrackerBlock.  "Last Modified  10:08:01 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    netScores := OrderedCollection new.
    1 to: 18 do: [:holeNumber |
        netScores add: ((player1 netScoreForHole: holeNumber) min: (player2 netScoreForHole: holeNumber))].
    ^netScores inject: 0 into: [:sum :each | sum + each].! !



!GolfTeam methods !
  
player1
    #CodeTrackerBlock.  "Last Modified  09:05:29 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^player1! !



!GolfTeam methods !
 
player1: aPlayer 

		  "defining player1 as aPlayer"
    #CodeTrackerBlock.  "Last Modified  09:07:16 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player1 := aPlayer.! !



!GolfTeam methods !
   
player2
    #CodeTrackerBlock.  "Last Modified  09:05:29 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^player2! !



!GolfTeam methods !
 
player2: aPlayer 

		  "defining player2 as aPlayer"
    #CodeTrackerBlock.  "Last Modified  09:06:42 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player2 := aPlayer! !



!GolfTeam methods !

playersNames

		"retrieves player names"
    #CodeTrackerBlock.  "Last Modified  10:03:52 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^player1 name , ' & ' , player2 name.! !



!GolfTeam methods !
   
teamGrossScore

		"adds player1 and player2 grossScore for team grossTotal"
    | grossTotal |
    #CodeTrackerBlock.  "Last Modified  13:39:46 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    grossTotal := (player1 grossScore + player2 grossScore).
    ^grossTotal! !



!GolfTeam methods !

teamNetScore

		"adds netScore of player1 and player2 to get fNetScore"
    | netTotal |
    #CodeTrackerBlock.  "Last Modified  13:37:41 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "adds player1 and player2 net score for team net score"
    netTotal := (player1 netScore + player2 netScore).
    ^netTotal! !



!GolfTeam methods !
 
teamWith: p1 and: p2 

		  "passing players to a team through two individual GolfPlayer objects"
    #CodeTrackerBlock.  "Last Modified  14:18:32 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player1 := p1.
    player2 := p2.! !



!GolfTournament class methods !
  
fromString: aString 

		"fromString method"
    | var aPlayer |
    #CodeTrackerBlock.  "Last Modified  15:25:18 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    var := aString asArrayOfSubstringsSeparatedBy: $=.
    aPlayer := GolfPlayer new.
    aPlayer name: var first.
    aPlayer handicap: var second asInteger.
    aPlayer grossScore: (
        var third asOrdererdCollection collect: [:aChar | Integer fromString: aChar asString]).
    ^aPlayer.! !



!GolfTournament class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  17:02:21 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!GolfTournament methods !
 
course
    #CodeTrackerBlock.  "Last Modified  15:41:53 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^course! !



!GolfTournament methods !
 
course: aValue
    #CodeTrackerBlock.  "Last Modified  15:41:53 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    course := aValue! !



!GolfTournament methods !

createPlayerFrom: aLine 

		"first player of team by creating a new GolfPlayer and starts a new GolfTeam object to assaign as player1"
    | player curr |
    #CodeTrackerBlock.  "Last Modified  14:51:26 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player := GolfPlayer fromString: aLine.
    curr := GolfTeam new.
    curr player1: player.! !



!GolfTournament methods !
  
createPlayersFrom: fileStream 

	"first player of team by creating a new GolfPlayer and starts a new GolfTeam object to assaign as player1"
    | player player2 aTeam |
    #CodeTrackerBlock.  "Last Modified  16:04:13 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player := GolfPlayer fromString: fileStream nextLine.
    aTeam := GolfTeam new.
    player2 := GolfPlayer fromString: fileStream nextLine.
    aTeam player1: player.
    aTeam player2: player2.
    player handicapStrokes: handicapStrokes.
    player2 handicapStrokes: handicapStrokes.
    ^self teams add: aTeam.! !



!GolfTournament methods !
 
createSecondPlayerFrom: aLine 

		"creates another GolfPlayer on the same  and assigns it as player2 to the existing GolfTeam object"
    | player curr |
    #CodeTrackerBlock.  "Last Modified  14:53:23 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    player := GolfPlayer fromString: aLine.
    curr player2: player.
    teams add: curr.! !



!GolfTournament methods !

handicapStrokes
    #CodeTrackerBlock.  "Last Modified  15:41:53 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^handicapStrokes! !



!GolfTournament methods !
   
handicapStrokes: aValue
    #CodeTrackerBlock.  "Last Modified  15:41:53 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    handicapStrokes := aValue! !



!GolfTournament methods !
  
processBack9Strokes: aLine 

	"reads values from Back9Strokes"
    | var temp |
    #CodeTrackerBlock.  "Last Modified  15:56:53 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    var := aLine asArrayOfSubstringsSeparatedBy: $=.
    temp := (var two asArrayOfSubstringsSeparatedBy: Character space) collect: [:s | s asInteger].
    handicapStrokes addAll: temp.! !



!GolfTournament methods !
   
processFront9Strokes: aLine 

	"takes the values in the Front9Strokes"
    | var |
    #CodeTrackerBlock.  "Last Modified  15:43:14 06/04/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    var := aLine asArrayOfSubstringsSeparatedBy: $=.
    handicapStrokes := (
        (var two asArrayOfSubstringsSeparatedBy: Character space) collect: [:s | s asInteger]) asOrderedCollection.! !



!GolfTournament methods !

readingTheFile

	"reading the file"
    | fs |
    #CodeTrackerBlock.  "Last Modified  10:20:09 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fs := File pathNameReadOnly: 'Data\2022Memorial.txt'.
    3 timesRepeat: [fs nextLine].
    self processFront9Strokes: fs nextLine.
    self processBack9Strokes: fs nextLine.
    [fs atEnd]
        whileFalse:[
            fs nextLine.
            self createPlayersFrom: fs.].
    teams := teams asSortedCollection: [:a :b | a finalScore < b finalScore].
    teams do: [:team |
        Transcript
            show: team playersNames;
            show: ' ' , (team finalScore) asString;
            cr.].! !



!GolfTournament methods !
  
teams

		"initialize"
    #CodeTrackerBlock.  "Last Modified  15:50:50 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teams ifNil: [teams := OrderedCollection new].
    ^teams! !



!GolfTournament methods !
 
teams: aValue
    #CodeTrackerBlock.  "Last Modified  15:41:53 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teams := aValue! !



!GolfTournament methods !
  
tournament
    #CodeTrackerBlock.  "Last Modified  15:41:53 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^tournament! !



!GolfTournament methods !
 
tournament: aValue
    #CodeTrackerBlock.  "Last Modified  15:41:53 06/04/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Golf. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    tournament := aValue! !
