
Object subclass: #Lottery
  instanceVariableNames: 
    ' tickets '
  classVariableNames: 
    ' prizeClass '
  poolDictionaries: '' !
Object subclass: #LotteryPlay
  instanceVariableNames: 
    ' match5 bonus '
  classVariableNames: ''
  poolDictionaries: '' !
Object subclass: #LotteryPrize
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''    !
LotteryPrize subclass: #MegaMillions
  instanceVariableNames: 
    ' megamillionsPrizeDict '
  classVariableNames: ''
  poolDictionaries: '' !
LotteryPrize subclass: #Powerball
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: '' !
Object subclass: #LotteryReader
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''   !
Object subclass: #LotteryResult
  instanceVariableNames: 
    ' matchedCount bonusCount category prizeAmount '
  classVariableNames: ''
  poolDictionaries: ''   !
Object subclass: #LotteryTicket
  instanceVariableNames: 
    ' id plays '
  classVariableNames: ''
  poolDictionaries: ''   !


!Lottery class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  13:08:38 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!Lottery class methods !
   
prizeClass

		  "powerball"
    #CodeTrackerBlock.  "Last Modified  13:52:48 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^prizeClass.! !



!Lottery class methods !
 
prizeClass: aClass 

		  "powerball"
    #CodeTrackerBlock.  "Last Modified  11:44:37 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    prizeClass := aClass.! !



!Lottery methods !
 
beMegamillions

		"megamillions"
    #CodeTrackerBlock.  "Last Modified  11:46:48 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self class prizeClass: MegaMillions.! !



!Lottery methods !
  
bePowerball

		"powerball"
    #CodeTrackerBlock.  "Last Modified  11:43:20 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self class prizeClass: Powerball.! !



!Lottery methods !
   
loadTickets

		"Initializes a LotteryReader, calls allTickets, and stores the collection in tickets."
    | reader |
    #CodeTrackerBlock.  "Last Modified  23:18:36 06/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    reader := LotteryReader new.
    tickets := reader allTickets.! !



!Lottery methods !
  
netProfitForGame: game 

		"calculates how much we won/lost"
    | winnings cost |
    #CodeTrackerBlock.  "Last Modified  23:23:18 06/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    winnings := self totalWinningsForGame: game.
    cost := tickets size * 20.
    ^winnings - cost! !



!Lottery methods !
 
showWinnings

	"displays winnings"
    | winningGame totalWinnings |
    #CodeTrackerBlock.  "Last Modified  14:03:46 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    winningGame := LotteryPlay fromArray: #( '2' '6' '31' '45' '53' '25' ).
    ^totalWinnings := self totalWinnings: winningGame.! !



!Lottery methods !
  
tickets
    #CodeTrackerBlock.  "Last Modified  23:19:19 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^tickets! !



!Lottery methods !
   
tickets: aValue
    #CodeTrackerBlock.  "Last Modified  23:19:19 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    tickets := aValue! !



!Lottery methods !
  
totalWinnings: winningPlay 

	  "Iterates over all tickets and totals up their winnings using totalGamePrize"
    #CodeTrackerBlock.  "Last Modified  13:57:35 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^tickets inject: 0 into: [:sum :ticket | sum + (ticket totalGamePrize: winningPlay)]! !



!LotteryPlay class methods !
   
from: fs 

		"creating match5 and bonus"
    | buf aPlay |
    #CodeTrackerBlock.  "Last Modified  14:56:39 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    aPlay := LotteryPlay new.
    buf := fs nextLine asArrayOfSubstringsSeparatedBy: Character space.
    aPlay match5: (buf copyFrom: 1 to: 5).
    aPlay bonus: (buf at: 6).
    ^aPlay! !



!LotteryPlay class methods !

fromArray: anArray 

		"creating match5 and bonus"
    | aPlay |
    #CodeTrackerBlock.  "Last Modified  13:17:55 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    aPlay := LotteryPlay new.
    aPlay match5: (anArray copyFrom: 1 to: 5).
    aPlay bonus: (anArray at: 6).
    ^aPlay! !



!LotteryPlay class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  11:02:30 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!LotteryPlay methods !
 
bonus
    #CodeTrackerBlock.  "Last Modified  11:41:02 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^bonus! !



!LotteryPlay methods !
   
bonus: aValue
    #CodeTrackerBlock.  "Last Modified  11:41:02 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    bonus := aValue! !



!LotteryPlay methods !
  
match5

		"initialize match5"
    #CodeTrackerBlock.  "Last Modified  15:27:49 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    match5 ifNil: [match5 := OrderedCollection new].
    ^match5! !



!LotteryPlay methods !
  
match5: aValue
    #CodeTrackerBlock.  "Last Modified  11:41:02 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    match5 := aValue! !



!LotteryPlay methods !

matchAgainst: winningNumbers bonus: winningBonus 

		"Return an array with the number of matches (from match5) and whether the bonus matches."
    | matchCount bonusMatched |
    #CodeTrackerBlock.  "Last Modified  13:51:10 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    matchCount := (self match5 union: winningNumbers) size.
    bonusMatched := (self bonus = winningBonus).
    ^Array with: matchCount with: bonusMatched! !



!LotteryPlay methods !
  
valueWithWinningPlay: winningPlay 

	"getting winning play"
    | matchInfo |
    #CodeTrackerBlock.  "Last Modified  13:46:39 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    matchInfo := self matchAgainst: winningPlay match5 bonus: winningPlay bonus.
    ^Lottery prizeClass new prizeDict at: matchInfo ifAbsent: [0].! !



!LotteryPrize class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:14:18 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!LotteryPrize methods !

categoryToPrize: aCategory 

	"checking category subclasses for amount, otherwise sets to 0"
    #CodeTrackerBlock.  "Last Modified  09:25:20 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "returns default behavior if subclass doesn't override."
    ^0.! !



!LotteryReader class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  11:16:29 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!LotteryReader methods !
   
allTickets

	"loading objects"
    | tickets ticketNumber fs aTicket |
    #CodeTrackerBlock.  "Last Modified  11:48:59 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "loading all objects"
    tickets := OrderedCollection new.
    ticketNumber := 1.
    fs := File pathNameReadOnly: 'Data\LotteryNumbers.txt'.
    [fs atEnd]
        whileFalse:[
            aTicket := LotteryTicket from: fs number: ticketNumber.
            tickets add: aTicket.
            ticketNumber := ticketNumber + 1.].
    fs close.
    ^tickets! !



!LotteryResult class methods !
  
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  13:09:08 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!LotteryResult methods !
   
assignPrizeFrom: aPrizeResult 

		"takes aPrizeResult (LotteryPrize object) and sends message to categoryToPrizeAt: to set the prizeAmount"
    #CodeTrackerBlock.  "Last Modified  09:39:13 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "categoryToPrizeAt: method is in the LotteryPrize superclass. Returns 0 if the prize dictionaries from subclass
	MegaMillions or Powerball does not override it."
    prizeAmount := aPrizeResult categoryToPrizeAt: self category.! !



!LotteryResult methods !

bonusCount
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^bonusCount! !



!LotteryResult methods !
   
bonusCount: aValue
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    bonusCount := aValue! !



!LotteryResult methods !
  
category
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^category! !



!LotteryResult methods !
   
category: aValue
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    category := aValue! !



!LotteryResult methods !
  
matchedCount
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^matchedCount! !



!LotteryResult methods !
   
matchedCount: aValue
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    matchedCount := aValue! !



!LotteryResult methods !
  
prizeAmount
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^prizeAmount! !



!LotteryResult methods !
 
prizeAmount: aValue
    #CodeTrackerBlock.  "Last Modified  23:31:23 06/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    prizeAmount := aValue! !



!LotteryTicket class methods !
  
from: fs number: ticketNumber 

		"instantiate ticket"
    | aTicket aPlay |
    #CodeTrackerBlock.  "Last Modified  14:57:30 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "going over ticket lines"
    aTicket := LotteryTicket new.
    aTicket id: ticketNumber.
    10 timesRepeat: [
        aPlay := LotteryPlay from: fs.
        aTicket plays add: aPlay.].
    fs nextLine.
    ^aTicket! !



!LotteryTicket class methods !
  
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:58:24 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!LotteryTicket methods !
   
id
    #CodeTrackerBlock.  "Last Modified  13:59:08 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^id! !



!LotteryTicket methods !
   
id: aValue
    #CodeTrackerBlock.  "Last Modified  13:59:08 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    id := aValue! !



!LotteryTicket methods !
  
plays

		"initialize plays"
    #CodeTrackerBlock.  "Last Modified  14:31:27 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    plays ifNil: [plays := OrderedCollection new].
    ^plays! !



!LotteryTicket methods !
 
plays: aValue
    #CodeTrackerBlock.  "Last Modified  13:59:08 06/05/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    plays := aValue! !



!LotteryTicket methods !

totalGamePrize: winningPlay 

	  "Sums the prizeAmount for all results returned by valueWithGame "
    #CodeTrackerBlock.  "Last Modified  14:01:37 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self plays) inject: 0 into: [:sum :play | sum + (play valueWithWinningPlay: winningPlay)]! !



!LotteryTicket methods !
   
valueWithGame: aGame 

	"Applies the game's evaluatePlay: method to all  plays in the ticket. Collects all LotteryResult objects."
    #CodeTrackerBlock.  "Last Modified  13:48:00 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^plays collect: [:play | aGame valueWithWinningPlay: play].! !



!MegaMillions class methods !
  
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  15:48:51 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!MegaMillions methods !

categoryToPrizeAt: category 

		  "Look up the prize amount for the given category in the MegaMillions prize dictionary"
    #CodeTrackerBlock.  "Last Modified  23:48:42 06/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self megaPrizeDict) at: category ifAbsent: [0].! !



!MegaMillions methods !

prizeDict

	"Returns the prize dictionary for Powerball. Caches the dictionary in powerballPrizeDict"
    | mega |
    #CodeTrackerBlock.  "Last Modified  13:40:24 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    mega ifNil: [
        mega := Dictionary new.
        mega at: (Array with: 5 with: true) put: 5000000000.
        mega at: (Array with: 5 with: false) put: 1000000.
        mega at: (Array with: 4 with: true) put: 10000.
        mega at: (Array with: 4 with: false) put: 500.
        mega at: (Array with: 3 with: true) put: 200.
        mega at: (Array with: 3 with: false) put: 10.
        mega at: (Array with: 2 with: true) put: 10.
        mega at: (Array with: 1 with: true) put: 4.
        mega at: (Array with: 0 with: true) put: 2.].
    ^mega! !



!Powerball class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  15:48:35 06/05/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!Powerball methods !
   
categoryToPrizeAt: category 

		  "Look up the prize amount for the given category in the Powerball prize dictionary"
    #CodeTrackerBlock.  "Last Modified  23:47:56 06/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self pbPrizeDict) at: category ifAbsent: [0].! !



!Powerball methods !

prizeDict

	"returns prize dictionary for powerball"
    | power |
    #CodeTrackerBlock.  "Last Modified  13:40:04 06/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Lottery. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    power ifNil: [
        power := Dictionary new.
        power at: (Array with: 5 with: true) put: 5000000000.
        power at: (Array with: 5 with: false) put: 1000000.
        power at: (Array with: 4 with: true) put: 50000.
        power at: (Array with: 4 with: false) put: 100.
        power at: (Array with: 3 with: true) put: 100.
        power at: (Array with: 3 with: false) put: 7.
        power at: (Array with: 2 with: true) put: 7.
        power at: (Array with: 1 with: true) put: 4.
        power at: (Array with: 0 with: true) put: 4.].
    ^power! !
