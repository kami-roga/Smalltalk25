
Object subclass: #NFLBoxPoolAnalyzer
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''   !
Object subclass: #NFLBoxPoolGrid
  instanceVariableNames: 
    ' rows totalGames '
  classVariableNames: ''
  poolDictionaries: ''   !
Object subclass: #NFLBoxPoolGridRow
  instanceVariableNames: 
    ' rowNumber digits count percentage '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #NFLDatabase
  instanceVariableNames: 
    ' games teams '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #NFLGame
  instanceVariableNames: 
    ' date id season week gameType homeTeamWasFavorite vegasLine overUnder temperature roof surface startTime overtime venue visitorTeam homeTeam '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #NFLTeamInGame
  instanceVariableNames: 
    ' teamName conferenceDivision coach q1 q2 q3 q4 overtime '
  classVariableNames: ''
  poolDictionaries: '' !
ViewManager subclass: #NFLBoxPoolUI
  instanceVariableNames: 
    ' db games analyzer allGrid wonGrid allRows wonRows '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '   !
ViewManager subclass: #NFLUI
  instanceVariableNames: 
    ' db games menuSelection lastFilterString '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '    !
WindowDialog subclass: #NFLFilterDialog
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '    !
CompositePane subclass: #NFLUIComposite2
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '   !


!NFLBoxPoolAnalyzer class methods !
  
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:52:27 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLBoxPoolAnalyzer methods !
  
analyzeGames: games 

"Analyze all games and return a NFLBoxPoolGrid object populated with counts and percentages."
    | grid |
    #CodeTrackerBlock.  "Last Modified  12:47:53 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    grid := NFLBoxPoolGrid new.
    games do: [:game | grid incrementCountForPair: (game lastDigitOfScore).].
    grid finalCountAndPercentage.
    ^grid! !



!NFLBoxPoolGrid class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:53:54 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLBoxPoolGrid methods !
  
finalCountAndPercentage

		"after all the counts, set the percentage for each row"
    #CodeTrackerBlock.  "Last Modified  13:22:15 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    totalGames = 0
        ifTrue:[^self].
    self rows do: [:aRow | aRow percentage: ((aRow count asFloat / totalGames * 100) roundTo: 0.001).].! !



!NFLBoxPoolGrid methods !
 
incrementCountForPair: aPair 

			"given a sorted array aPair, increment the count for that combination"
    | aRow |
    #CodeTrackerBlock.  "Last Modified  13:14:12 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    aRow := self rows detect: [:each | each digits = aPair] ifNone: [nil].
    aRow isNil
        ifTrue:[
            aRow := NFLBoxPoolGridRow new.
            aRow digits: aPair.
            aRow count: 1.
            self rows add: aRow.]
        ifFalse:[aRow count: aRow count + 1.].

	"Each time a game is processed and a digit pair count is incremented, totalGames is incremented by 1"
    totalGames := self totalGames + 1.! !



!NFLBoxPoolGrid methods !
   
rows

		"initilize the grid with an empty rows collection"
    #CodeTrackerBlock.  "Last Modified  11:12:45 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^rows ifNil: [rows := OrderedCollection new]! !



!NFLBoxPoolGrid methods !
   
rows: aCollection 

		  "rows is a collection"
    #CodeTrackerBlock.  "Last Modified  11:20:55 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    rows := aCollection.! !



!NFLBoxPoolGrid methods !
   
sortedRowsByPercentage

		"returns the rows sorted in descending order by percentage"
    #CodeTrackerBlock.  "Last Modified  11:27:01 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self rows asSortedCollection: [:a :b | a percentage > b percentage]! !



!NFLBoxPoolGrid methods !
  
totalGames

	"always get a number for totalGames"
    #CodeTrackerBlock.  "Last Modified  12:46:50 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^totalGames ifNil: [totalGames := 0]! !



!NFLBoxPoolGrid methods !

totalGames: aValue
    #CodeTrackerBlock.  "Last Modified  11:12:23 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    totalGames := aValue! !



!NFLBoxPoolGridRow class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:48:25 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLBoxPoolGridRow methods !
   
count

	"number of occurrences"
    #CodeTrackerBlock.  "Last Modified  13:02:58 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^count ifNil: [0]! !



!NFLBoxPoolGridRow methods !
  
count: aValue
    #CodeTrackerBlock.  "Last Modified  11:29:45 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    count := aValue! !



!NFLBoxPoolGridRow methods !

digits
    #CodeTrackerBlock.  "Last Modified  11:29:45 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^digits! !



!NFLBoxPoolGridRow methods !
   
digits: aValue
    #CodeTrackerBlock.  "Last Modified  11:29:45 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    digits := aValue! !



!NFLBoxPoolGridRow methods !
  
percentage
    #CodeTrackerBlock.  "Last Modified  11:29:45 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^percentage! !



!NFLBoxPoolGridRow methods !
   
percentage: aValue
    #CodeTrackerBlock.  "Last Modified  11:29:45 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    percentage := aValue! !



!NFLBoxPoolGridRow methods !
  
rowNumber
    #CodeTrackerBlock.  "Last Modified  12:53:16 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^rowNumber! !



!NFLBoxPoolGridRow methods !
 
rowNumber: aValue
    #CodeTrackerBlock.  "Last Modified  12:53:16 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    rowNumber := aValue! !



!NFLBoxPoolUI class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  11:38:24 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLBoxPoolUI class methods !
  
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  16:39:45 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!NFLBoxPoolUI methods !

allGrid
    #CodeTrackerBlock.  "Last Modified  14:52:57 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^allGrid! !



!NFLBoxPoolUI methods !
  
allGrid: aValue
    #CodeTrackerBlock.  "Last Modified  14:52:57 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    allGrid := aValue! !



!NFLBoxPoolUI methods !
 
allRows
    #CodeTrackerBlock.  "Last Modified  13:59:36 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^allRows! !



!NFLBoxPoolUI methods !
  
allRows: aValue
    #CodeTrackerBlock.  "Last Modified  13:59:36 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    allRows := aValue! !



!NFLBoxPoolUI methods !
 
analyzer
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^analyzer! !



!NFLBoxPoolUI methods !

analyzer: aValue
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    analyzer := aValue! !



!NFLBoxPoolUI methods !
   
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | comboDropdown gridList mainView segoeUI8 xDU yDU |
    #CodeTrackerBlock.  "Last Modified  16:39:45 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #generated.
    xDU := (SysFont width + 1 roundTo: 2) / 4.
    yDU := SysFont height / 8.
    mainView := self topPaneClass new.

		"Temporary Variables"
    comboDropdown := DropDownList new.
    gridList := CPColumnarListBox new.

		"Font Definitions"
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    mainView
        owner: self;
        setName: 'mainView';
        when: #maximized send: #winMaximized to: mainView;
        when: #minimized send: #winMinimized to: mainView;
        when: #restored send: #winRestored to: mainView;
        labelWithoutPrefix: '100 Box Pool';
        noSmalltalkMenuBar;
        backColor: Color buttonFace;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -189 * xDU;
                 topRatio: 1 / 2;
                 topInset: -2592 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -189 * xDU;
                 bottomRatio: 1 / 2;
                 bottomInset: -2592 / 19 * yDU).
    self addView: mainView.
    gridList "CPColumnarListBox"
        owner: self;
        setName: 'gridList';
        when: #select send: #gridListSelectionChanged: to: self with: gridList;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -71 * xDU;
                 topRatio: 0;
                 topInset: 448 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -73 * xDU;
                 bottomRatio: 1;
                 bottomInset: 232 / 19 * yDU);
        startGroup;
        noTabStop;
        font: SysFont;
        headerColor: (
            RGBColor red: 255 green: 255 blue: 128);
        canResize: true;
        canReorder: true;
        fields: (
            OrderedCollection new
                 addLast: (
                    CPCLBField new
                         header: '#';
                         justification: #center;
                         selector: #rowNumber);
                 addLast: (
                    CPCLBField new
                         header: 'Combination';
                         justification: #center;
                         selector: #digits);
                 addLast: (
                    CPCLBField new
                         header: 'Count';
                         justification: #center;
                         selector: #count);
                 addLast: (
                    CPCLBField new
                         header: 'Percentage';
                         justification: #center;
                         selector: #percentage);
                 yourself).
    mainView addSubpane: gridList.
    comboDropdown "DropDownList"
        owner: self;
        setName: 'comboDropdown';
        when: #changed: send: #populateGridList to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 152 * xDU;
                 topRatio: 0;
                 topInset: 128 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -220 * xDU;
                 bottomRatio: 0;
                 bottomInset: -352 / 19 * yDU);
        startGroup;
        noTabStop;
        font: SysFont;
        contents: #( 'All' 'Won' ).
    mainView addSubpane: comboDropdown! !



!NFLBoxPoolUI methods !
   
db
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^db! !



!NFLBoxPoolUI methods !

db: aValue
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    db := aValue! !



!NFLBoxPoolUI methods !
   
games
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games! !



!NFLBoxPoolUI methods !
  
games: aValue
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    games := aValue! !



!NFLBoxPoolUI methods !
 
gridListSelectionChanged: aPane 

	"Callback for the #select event in gridList [CPColumnarListBox].
		(Generated by WindowBuilder Pro)"

	"takes the digits of the selected item and reverses the order (altCombo) and prepares
	a collection to hold items to be selected to store rows that match the criteria. Finds all matching
	items that match the selection or its reverse."
    | selectedItem altCombo itemsToSelect |
    #CodeTrackerBlock.  "Last Modified  16:35:10 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedItem := aPane selectedItems isEmpty
        ifTrue:[^self]
        ifFalse:[aPane selectedItems first].
    altCombo := selectedItem digits reversed.
    itemsToSelect := OrderedCollection new.
    aPane contents do: [:anItem |
        ((anItem digits = selectedItem digits) or: [anItem digits = altCombo])
            ifTrue:[itemsToSelect add: anItem]].
    aPane selectedItems: itemsToSelect.! !



!NFLBoxPoolUI methods !
   
initWindow

	"initilaize Box Pool UI window"
    #CodeTrackerBlock.  "Last Modified  14:59:40 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    super initWindow.
    db := NFLDatabase new.
    games := db allGames.
    (self paneNamed: 'comboDropdown') value: 'All'.
    self populateGridList.! !



!NFLBoxPoolUI methods !

populateAllGridAndRows

	"load in data when 'all' is selected from dropdown"
    #CodeTrackerBlock.  "Last Modified  15:03:50 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "load in the data into gridList for the allGrid (selected 'All')"
    analyzer := NFLBoxPoolAnalyzer new.
    allGrid := analyzer analyzeGames: games.
    allGrid finalCountAndPercentage.
    allRows := allGrid sortedRowsByPercentage.
    allRows keysAndValuesDo: [:index :aRow | aRow rowNumber: index.].! !



!NFLBoxPoolUI methods !

populateGridList

	"calls methods to load in either the allGrid or wonGrid based on dropdown seleciton (value = ' ')"
    | dropdownValue |
    #CodeTrackerBlock.  "Last Modified  15:46:55 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    dropdownValue := (self paneNamed: 'comboDropdown') value.
    self populateAllGridAndRows.
    self populateWonGridAndRows.

	"if nothing is selected in the dropdow, automatically load gridList with data from the allGrid"
    (dropdownValue isNil or: [dropdownValue = 'All'])
        ifTrue:[(self paneNamed: 'gridList') contents: allRows]
        ifFalse:[
            (self paneNamed: 'gridList') contents: wonRows.
            (self paneNamed: 'gridList') multipleSelect].! !



!NFLBoxPoolUI methods !
 
populateWonGridAndRows

	"load in data when 'won' is selected from dropdown"
    | pair |
    #CodeTrackerBlock.  "Last Modified  15:04:24 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "load in the data into gridList for the wonGrid (selected 'Won')"
    wonGrid := NFLBoxPoolGrid new.
    games do: [:game |
        pair := Array with: (game homeTeam totalPoints \\ 10) with: (game visitorTeam totalPoints \\ 10).
        wonGrid incrementCountForPair: pair.].
    wonGrid finalCountAndPercentage.
    wonRows := wonGrid sortedRowsByPercentage.
    wonRows keysAndValuesDo: [:index :aRow | aRow rowNumber: index.].! !



!NFLBoxPoolUI methods !
  
views
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^views! !



!NFLBoxPoolUI methods !
  
views: aValue
    #CodeTrackerBlock.  "Last Modified  11:41:28 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    views := aValue! !



!NFLBoxPoolUI methods !
 
wonGrid
    #CodeTrackerBlock.  "Last Modified  14:52:57 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^wonGrid! !



!NFLBoxPoolUI methods !
  
wonGrid: aValue
    #CodeTrackerBlock.  "Last Modified  14:52:57 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    wonGrid := aValue! !



!NFLBoxPoolUI methods !
 
wonRows
    #CodeTrackerBlock.  "Last Modified  14:09:17 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^wonRows! !



!NFLBoxPoolUI methods !
  
wonRows: aValue
    #CodeTrackerBlock.  "Last Modified  14:09:17 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    wonRows := aValue! !



!NFLDatabase class methods !

add: game 

	"adding a game to the database"
    #CodeTrackerBlock.  "Last Modified  14:58:30 06/25/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self games add: game.! !



!NFLDatabase class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:45:33 06/25/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLDatabase methods !
 
allGames

	"loading in games from .csv file"
    | fileStream row game id |
    #CodeTrackerBlock.  "Last Modified  10:26:21 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fileStream := File pathNameReadOnly: 'Data/nfl-copy.csv'.
    id := 1.
    [fileStream atEnd]
        whileFalse:[
            row := fileStream nextLine.
            game := (NFLGame fromString: row id: id).
            self games add: game.
            id := id + 1.].
    fileStream close.
    ^games.! !



!NFLDatabase methods !
 
games

		"ordered collection of games"
    #CodeTrackerBlock.  "Last Modified  14:57:03 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games ifNil: [games := OrderedCollection new].! !



!NFLDatabase methods !
   
games: aCollection 

		  "assigning games instance variable"
    #CodeTrackerBlock.  "Last Modified  14:57:27 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    games := aCollection! !



!NFLDatabase methods !

teams
    #CodeTrackerBlock.  "Last Modified  16:05:55 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teams! !



!NFLDatabase methods !
   
teams: aValue
    #CodeTrackerBlock.  "Last Modified  16:05:55 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teams := aValue! !



!NFLFilterDialog class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  15:32:03 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLFilterDialog class methods !
   
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  15:32:03 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!NFLFilterDialog methods !
 
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | filterlistbox mainView staticText1 xDU yDU |
    #CodeTrackerBlock.  "Last Modified  15:32:03 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #generated.
    xDU := (SysFont width + 1 roundTo: 2) / (SysFont width roundTo: 2).
    yDU := 1.
    mainView := self topPaneClass new.

		"Temporary Variables"
    filterlistbox := ListBox new.
    staticText1 := StaticText new.
    mainView
        owner: self;
        setName: 'mainView';
        alignRelativeToScreen;
        when: #maximized send: #winMaximized to: mainView;
        when: #minimized send: #winMinimized to: mainView;
        when: #restored send: #winRestored to: mainView;
        addModalBorderStyle;
        labelWithoutPrefix: 'New Dialog';
        noSmalltalkMenuBar;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2 / ((SysFont width roundTo: 2) / 4);
                 leftInset: -114 * xDU;
                 topRatio: 1 / 2 / (SysFont height / 8);
                 topInset: -1040 / 19 * yDU;
                 rightRatio: 1 / 2 / ((SysFont width roundTo: 2) / 4);
                 rightInset: -114 * xDU;
                 bottomRatio: 1 / 2 / (SysFont height / 8);
                 bottomInset: -1040 / 19 * yDU).
    self addView: mainView.
    filterlistbox "ListBox"
        owner: self;
        setName: 'filterlistbox';
        addBorderStyle;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 32 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -200 * xDU;
                 bottomRatio: 0;
                 bottomInset: -96 * yDU);
        startGroup;
        noTabStop;
        font: SysFont.
    mainView addSubpane: filterlistbox.
    staticText1
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 32 * xDU;
                 topRatio: 0;
                 topInset: 128 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -76 * xDU;
                 bottomRatio: 0;
                 bottomInset: -288 / 19 * yDU);
        contents: 'Enter block:';
        startGroup;
        noTabStop;
        font: SysFont.
    mainView addSubpane: staticText1! !



!NFLGame class methods !
   
fromString: aString id: anId 

					 "converts csv data into instances of aGame"
    | var aGame visitorFields homeFields |
    #CodeTrackerBlock.  "Last Modified  09:44:45 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    var := aString asArrayOfSubstringsDelimitedBy: Character tab.
    aGame := self new.
    aGame id: anId.
    aGame date: (Date fromString: (var at: 1)).
    aGame season: (var at: 2) asInteger.
    aGame week: (var at: 3) asInteger.
    aGame gameType: (var at: 4).
    aGame homeTeamWasFavorite: (
        (var at: 5) notEmpty
            ifTrue:[(var at: 5) = 'true']
            ifFalse:[nil]).
    aGame vegasLine: (
        (var at: 6) notEmpty
            ifTrue:[(var at: 6) asInteger]
            ifFalse:[nil]).
    aGame overUnder: (
        (var at: 7) notEmpty
            ifTrue:[(var at: 7) asInteger]
            ifFalse:[nil]).

	 "temperature (not reported for domes)"
    aGame temperature: (
        (var at: 8) notEmpty
            ifTrue:[(var at: 8) asInteger]
            ifFalse:[nil]).
    aGame roof: (var at: 9).
    aGame surface: (var at: 10).
    aGame startTime: (var at: 11).
    aGame overtime: (var at: 12) = 'true'.
    aGame venue: (var at: 13).

	"Extract slices for visitor and home teams"
    visitorFields := var copyFrom: 14 to: 21.
    homeFields := var copyFrom: 22 to: 29.

	 "Create NFLTeamInGame instances from slices"
    aGame visitorTeam: (NFLTeamInGame fromFields: visitorFields).
    aGame homeTeam: (NFLTeamInGame fromFields: homeFields).
    ^aGame! !



!NFLGame class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:39:16 06/25/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLGame methods !
 
atsWinner

		"determines the atsWinner by adjusting the favorite's score with the vegas Line, and then returning the resulting winner (favorite or underdog, or nil)"
    | favorite underdog adjustedScore |
    #CodeTrackerBlock.  "Last Modified  16:10:20 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    vegasLine isNil
        ifTrue:[^nil].
    favorite := self vegasFavorite.
    underdog := self vegasUnderdog.
    adjustedScore := (favorite totalPoints) + vegasLine.
    (adjustedScore > underdog totalPoints)
        ifTrue:[^favorite].
    (adjustedScore < underdog totalPoints)
        ifTrue:[^underdog].
    ^nil.! !



!NFLGame methods !

date
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^date! !



!NFLGame methods !
 
date: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    date := aValue! !



!NFLGame methods !

dayOfWeek

	"Returns the weekday name for this game's date, e.g. 'Sunday', 'Monday', etc."
    #CodeTrackerBlock.  "Last Modified  09:11:15 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self date dayName! !



!NFLGame methods !
  
gameType
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^gameType! !



!NFLGame methods !
 
gameType: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    gameType := aValue! !



!NFLGame methods !

homeTeam
    #CodeTrackerBlock.  "Last Modified  16:51:23 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^homeTeam! !



!NFLGame methods !
 
homeTeam: aValue
    #CodeTrackerBlock.  "Last Modified  16:51:23 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    homeTeam := aValue! !



!NFLGame methods !

homeTeamWasFavorite
    #CodeTrackerBlock.  "Last Modified  09:09:42 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^homeTeamWasFavorite! !



!NFLGame methods !
   
homeTeamWasFavorite: aBoolean 

		  "assigns the passed boolean (aBoolean) to the instance variable."
    #CodeTrackerBlock.  "Last Modified  16:33:32 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    homeTeamWasFavorite := aBoolean! !



!NFLGame methods !

id
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^id! !



!NFLGame methods !
 
id: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    id := aValue! !



!NFLGame methods !

isConferenceChampionship

		"associates string 'C' to method to be called for menubar selections"
    #CodeTrackerBlock.  "Last Modified  11:01:36 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self gameType = 'C'.! !



!NFLGame methods !

isDivisionPlayoff

		"associates string 'D' to method to be called for menubar selections"
    #CodeTrackerBlock.  "Last Modified  11:00:50 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self gameType = 'D'.! !



!NFLGame methods !
   
isPlayoff

		"associates either 'W', 'D', 'C', or 'S' to method to be called for the Playoffs menubar selection"
    #CodeTrackerBlock.  "Last Modified  13:10:42 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self isWildCard or: [self isDivisionPlayoff or: [self isConferenceChampionship or: [self isSuperbowl]]]! !



!NFLGame methods !
  
isRegularSeason

		"associates string 'R' to method to be called for menubar selections"
    #CodeTrackerBlock.  "Last Modified  10:58:58 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self gameType = 'R'.! !



!NFLGame methods !
 
isSuperbowl

		"associates string 'S' to method to be called for menubar selections"
    #CodeTrackerBlock.  "Last Modified  11:02:05 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self gameType = 'S'.! !



!NFLGame methods !
 
isWildCard

		"associates string 'W' to method to be called for menubar selections"
    #CodeTrackerBlock.  "Last Modified  11:00:03 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self gameType = 'W'.! !



!NFLGame methods !
  
lastDigitOfScore

		"obtains the last digit of each team's total score"
    | homeDigit visitorDigit |
    #CodeTrackerBlock.  "Last Modified  11:08:22 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    homeDigit := self homeTeam totalPoints \\ 10. "get the last digit of home team's score with modulus"
    visitorDigit := self visitorTeam totalPoints \\ 10. "get the last digit of visitor team's score with modulus"
    ^(homeDigit <= visitorDigit)
        ifTrue:[Array with: homeDigit with: visitorDigit]
        ifFalse:[Array with: visitorDigit with: homeDigit]! !



!NFLGame methods !
   
marginOfVictory

		"margin of victory calc"
    #CodeTrackerBlock.  "Last Modified  17:24:23 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self homeTeam totalPoints - visitorTeam totalPoints) abs.! !



!NFLGame methods !

overtime
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^overtime! !



!NFLGame methods !
 
overtime: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    overtime := aValue! !



!NFLGame methods !

overUnder
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^overUnder! !



!NFLGame methods !
   
overUnder: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    overUnder := aValue! !



!NFLGame methods !
  
overUnderResult

 "retrieves totalPoints from NFLTeamInGame. Return true if total points exceed overUnder, false if below, or nil if missing."
    | total |
    #CodeTrackerBlock.  "Last Modified  16:20:55 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    overUnder isNil
        ifTrue:[^nil].
    total := visitorTeam totalPoints + homeTeam totalPoints.
    (total > overUnder)
        ifTrue:[^true].
    (total < overUnder)
        ifTrue:[^false].
    ^nil.! !



!NFLGame methods !

roof
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^roof! !



!NFLGame methods !
 
roof: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    roof := aValue! !



!NFLGame methods !

season
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^season! !



!NFLGame methods !
 
season: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    season := aValue! !



!NFLGame methods !

startTime
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^startTime! !



!NFLGame methods !
   
startTime: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    startTime := aValue! !



!NFLGame methods !
  
summary

		"returns the summar in winner-first formatting"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  09:03:08 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := self visitorTeam.
    home := self homeTeam.
    ^(visitor totalPoints > home totalPoints)
        ifTrue:[visitor teamSummary , ', ' , home teamSummary]
        ifFalse:[home teamSummary , ', ' , visitor teamSummary]! !



!NFLGame methods !
  
surface
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^surface! !



!NFLGame methods !
   
surface: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    surface := aValue! !



!NFLGame methods !
  
temperature
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^temperature! !



!NFLGame methods !
   
temperature: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    temperature := aValue! !



!NFLGame methods !
  
totalPoints

		"getting total points for a game"
    #CodeTrackerBlock.  "Last Modified  17:28:19 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self homeTeam totalPoints + self visitorTeam totalPoints).! !



!NFLGame methods !
  
vegasFavorite

		"assigns the home team to the vegas favorite if it returns true, or the visitor team if false"
    #CodeTrackerBlock.  "Last Modified  16:06:12 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^homeTeamWasFavorite
        ifTrue:[homeTeam]
        ifFalse:[visitorTeam].! !



!NFLGame methods !

vegasLine
    #CodeTrackerBlock.  "Last Modified  09:09:42 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^vegasLine! !



!NFLGame methods !
   
vegasLine: aValue
    #CodeTrackerBlock.  "Last Modified  09:09:42 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    vegasLine := aValue! !



!NFLGame methods !
  
vegasUnderdog

		"assigns the vegasUnderdig tithe visitor team if it returns true, or the home team if it returns false"
    #CodeTrackerBlock.  "Last Modified  16:07:20 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^homeTeamWasFavorite
        ifTrue:[visitorTeam]
        ifFalse:[homeTeam].! !



!NFLGame methods !
   
venue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^venue! !



!NFLGame methods !
   
venue: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    venue := aValue! !



!NFLGame methods !
  
visitorTeam
    #CodeTrackerBlock.  "Last Modified  16:51:23 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^visitorTeam! !



!NFLGame methods !
   
visitorTeam: aValue
    #CodeTrackerBlock.  "Last Modified  16:51:23 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitorTeam := aValue! !



!NFLGame methods !
  
week
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^week! !



!NFLGame methods !
 
week: aValue
    #CodeTrackerBlock.  "Last Modified  16:22:10 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    week := aValue! !



!NFLGame methods !

winner

	"calls Team method that calculates the winner and this method returns winning team of the game"
    #CodeTrackerBlock.  "Last Modified  15:57:07 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^NFLTeamInGame winnerBetween: self visitorTeam and: self homeTeam! !



!NFLTeamInGame class methods !
 
fromFields: teamFields 

	"takes the slices from NFLGame for the visitor and home fields to get fully initialized team objects"
    | team |
    #CodeTrackerBlock.  "Last Modified  09:41:41 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    team := self new.
    team teamName: (teamFields at: 1) asString.
    team conferenceDivision: (teamFields at: 2).
    team coach: (teamFields at: 3).
    team q1: (teamFields at: 4) asInteger.
    team q2: (teamFields at: 5) asInteger.
    team q3: (teamFields at: 6) asInteger.
    team q4: (teamFields at: 7) asInteger.
    team overtime: (teamFields at: 8) asInteger.
    ^team! !



!NFLTeamInGame class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  15:26:15 06/25/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLTeamInGame class methods !
 
winnerBetween: visitorTeam and: homeTeam 

		  "given two teams, it returns the winning team instance or nil if it is a tie"
    #CodeTrackerBlock.  "Last Modified  15:42:07 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (visitorTeam isWinner: homeTeam)
        ifTrue:[^visitorTeam].
    (homeTeam isWinner: visitorTeam)
        ifTrue:[^homeTeam].
    ^nil "tie"! !



!NFLTeamInGame methods !
 
coach
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^coach! !



!NFLTeamInGame methods !
 
coach: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coach := aValue! !



!NFLTeamInGame methods !

conferenceDivision
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^conferenceDivision! !



!NFLTeamInGame methods !
   
conferenceDivision: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    conferenceDivision := aValue! !



!NFLTeamInGame methods !
  
isWinner: otherTeam 

		  "compares this teams total to the other team to see if it is the winner"
    #CodeTrackerBlock.  "Last Modified  09:01:56 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self totalPoints > otherTeam totalPoints.! !



!NFLTeamInGame methods !

overtime
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^overtime! !



!NFLTeamInGame methods !
   
overtime: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    overtime := aValue! !



!NFLTeamInGame methods !
  
q1
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^q1! !



!NFLTeamInGame methods !
   
q1: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    q1 := aValue! !



!NFLTeamInGame methods !
  
q2
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^q2! !



!NFLTeamInGame methods !
   
q2: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    q2 := aValue! !



!NFLTeamInGame methods !
  
q3
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^q3! !



!NFLTeamInGame methods !
   
q3: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    q3 := aValue! !



!NFLTeamInGame methods !
  
q4
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^q4! !



!NFLTeamInGame methods !
   
q4: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    q4 := aValue! !



!NFLTeamInGame methods !
  
teamName
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamName! !



!NFLTeamInGame methods !
   
teamName: aValue
    #CodeTrackerBlock.  "Last Modified  16:56:52 06/25/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teamName := aValue! !



!NFLTeamInGame methods !
  
teamSummary

"returns the team and the total points they have"
    #CodeTrackerBlock.  "Last Modified  09:00:17 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamName , ' ' , (self totalPoints asString)! !



!NFLTeamInGame methods !
 
totalPoints

"returns the total points scored by this team in the game"
    #CodeTrackerBlock.  "Last Modified  08:59:11 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(q1 + q2 + q3 + q4 + overtime).! !



!NFLUI class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  16:58:08 06/25/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLUI class methods !
 
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  16:35:01 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!NFLUI methods !
   
composite

		"associates the composite pane to the composite window"
    #CodeTrackerBlock.  "Last Modified  14:54:52 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self paneNamed: 'composite'! !



!NFLUI methods !

createMenus: aPane 

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    #CodeTrackerBlock.  "Last Modified  16:35:01 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #generated.
    aPane menuWindow
         yourself;
         addMenu: (
            Menu new
                 title: 'Selections';
                 owner: self;
                 appendItem: 'All' selector: #selectAll;
                 appendItem: 'Regular Season' selector: #selectRegularSeason;
                 appendItem: 'Playoffs' selector: #selectPlayoffs;
                 appendItem: 'Wild Card' selector: #selectWildCard;
                 appendItem: 'Division' selector: #selectDivision;
                 appendItem: 'Conference Championship' selector: #selectConferenceChampionship;
                 appendItem: 'Super Bowl' selector: #selectSuperbowl;
                 appendSeparator;
                 appendItem: 'Select Filter' selector: #selectFilter)! !



!NFLUI methods !
   
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | composite gamesList mainView segoeUI8 xDU yDU |
    #CodeTrackerBlock.  "Last Modified  16:35:01 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #generated.
    xDU := (SysFont width + 1 roundTo: 2) / 4.
    yDU := SysFont height / 8.
    mainView := self topPaneClass new.

		"Temporary Variables"
    composite := NFLUIComposite2 new.
    gamesList := CPColumnarListBox new.

		"Font Definitions"
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    mainView
        owner: self;
        setName: 'mainView';
        when: #maximized send: #winMaximized to: mainView;
        when: #minimized send: #winMinimized to: mainView;
        when: #restored send: #winRestored to: mainView;
        labelWithoutPrefix: 'NFL Games since "The Merger"';
        noSmalltalkMenuBar;
        backColor: Color buttonFace;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -291 * xDU;
                 topRatio: 1 / 2;
                 topInset: -2992 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -291 * xDU;
                 bottomRatio: 1 / 2;
                 bottomInset: -2992 / 19 * yDU).
    self addView: mainView.
    gamesList "CPColumnarListBox"
        owner: self;
        setName: 'gamesList';
        when: #select send: #updateGameDetailsOnSelection to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 12 * xDU;
                 topRatio: 0;
                 topInset: 224 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -558 * xDU;
                 bottomRatio: 0;
                 bottomInset: -3776 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI8;
        headerColor: Color black;
        fields: (
            OrderedCollection new
                 addLast: (
                    CPCLBField new
                         header: 'ID';
                         justification: #center;
                         selector: #id);
                 addLast: (
                    CPCLBField new
                         header: 'Date';
                         justification: #center;
                         selector: #date);
                 addLast: (
                    CPCLBField new
                         header: 'Season';
                         justification: #center;
                         selector: #season);
                 addLast: (
                    CPCLBField new
                         header: 'Week';
                         justification: #center;
                         selector: #week);
                 addLast: (
                    CPCLBField new
                         header: 'Type';
                         justification: #center;
                         selector: #gameType);
                 addLast: (
                    CPCLBField new
                         header: 'Venue';
                         justification: #center;
                         selector: #venue);
                 addLast: (
                    CPCLBField new
                         header: 'Summary';
                         justification: #center;
                         selector: #summary);
                 yourself).
    mainView addSubpane: gamesList.
    composite "NFLUIComposite2"
        owner: self;
        setName: 'composite';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 4 * xDU;
                 topRatio: 0;
                 topInset: 3808 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -568 * xDU;
                 bottomRatio: 0;
                 bottomInset: -5024 / 19 * yDU);
        startGroup;
        noTabStop.
    mainView addSubpane: composite.
    self createMenus: mainView! !



!NFLUI methods !
 
db
    #CodeTrackerBlock.  "Last Modified  13:43:10 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^db! !



!NFLUI methods !
   
db: aValue
    #CodeTrackerBlock.  "Last Modified  13:43:10 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    db := aValue! !



!NFLUI methods !
  
filteredGamesForMenuSelection

		"filters the games by what menubar selection is chosen"
    #CodeTrackerBlock.  "Last Modified  13:12:54 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection isNil
        ifTrue:[^games].
    menuSelection = 'All'
        ifTrue:[^games].
    menuSelection = 'Regular Season'
        ifTrue:[^games select: [:g | g isRegularSeason]].
    menuSelection = 'Wild Card'
        ifTrue:[^games select: [:g | g isWildCard]].
    menuSelection = 'Division'
        ifTrue:[^games select: [:g | g isDivisionPlayoff]].
    menuSelection = 'Conference Championship'
        ifTrue:[^games select: [:g | g isConferenceChampionship]].
    menuSelection = 'Super Bowl'
        ifTrue:[^games select: [:g | g isSuperbowl]].
    menuSelection = 'Playoffs'
        ifTrue:[^games select: [:g | g isPlayoff]].
    ^games! !



!NFLUI methods !

games
    #CodeTrackerBlock.  "Last Modified  13:43:10 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games! !



!NFLUI methods !
 
games: aValue
    #CodeTrackerBlock.  "Last Modified  13:43:10 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    games := aValue! !



!NFLUI methods !

initWindow

	"initilize loading of window and checking if a game row is selected to call displayGameDetails"
    #CodeTrackerBlock.  "Last Modified  14:48:17 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "initialize window"
    super initWindow.
    db := NFLDatabase new.
    games := db allGames.
    menuSelection := 'All'.
    self populateGamesList.

		"Colors"
    (self paneNamed: 'gamesList')
        backColor2: (
            Color red: 153.0 green: 50.0 blue: 204.0);
        foreColor: Color yellow.! !



!NFLUI methods !
   
lastFilterString
    #CodeTrackerBlock.  "Last Modified  08:52:30 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^lastFilterString! !



!NFLUI methods !
   
lastFilterString: aValue
    #CodeTrackerBlock.  "Last Modified  08:52:30 07/01/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    lastFilterString := aValue! !



!NFLUI methods !
  
menuSelection
    #CodeTrackerBlock.  "Last Modified  11:08:21 06/30/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^menuSelection! !



!NFLUI methods !
 
menuSelection: aString 

		  "gets the assoicated choice that is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  11:09:03 06/30/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := aString! !



!NFLUI methods !
   
open

		"shows the window and loads data into UI"
    #CodeTrackerBlock.  "Last Modified  09:33:35 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    super open.
    self populateGamesList.! !



!NFLUI methods !
   
populateGamesList

	"NFLDatabase loads in all the games"
    | pane rows allGames |
    #CodeTrackerBlock.  "Last Modified  14:30:29 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    pane := self paneNamed: 'gamesList'.
    allGames := NFLDatabase new allGames.
    rows := allGames collect: [:game |
        | row|row := OrderedCollection new.
        row add: (game id asString).
        row add: (game date printString).
        row add: (game season asString).
        row add: (game week asString).
        row add: game gameType.
        row add: game venue.
        row add: game summary.].
    pane contents: allGames.! !



!NFLUI methods !
  
selectAll

		"'All' is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  15:05:48 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := 'All'.
    self updateGamesListOnMenuSelection.
    self composite clearGameDetailsFields.! !



!NFLUI methods !
  
selectConferenceChampionship

	"'Conference Championship' is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  15:05:58 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := 'Conference Championship'.
    self updateGamesListOnMenuSelection.
    self composite clearGameDetailsFields.! !



!NFLUI methods !

selectDivision

	"'Division' is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  15:04:42 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := 'Division'.
    self updateGamesListOnMenuSelection.
    self composite clearGameDetailsFields.! !



!NFLUI methods !

selectedItem

		"returning the selected game object/row from its selection"
    #CodeTrackerBlock.  "Last Modified  14:18:44 06/26/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self paneNamed: 'gamesList') selectedItem.! !



!NFLUI methods !
 
selectFilter

	"calls TextPromtDialog for block entry. Calls CompilerInterface to	check block. Error class handles error wrapping dialog."
    | filterString aBlock filteredGames |
    #CodeTrackerBlock.  "Last Modified  10:05:10 07/01/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "calls TextPromtDialog class when clicking 'Select Filter' from menubar"
    filterString := TextPromptDialog title: 'Custom Game Filter' prompt: 'Enter a game filter block:' default: (
            lastFilterString ifNil: ['[:game | game ]']).
    filterString isNil
        ifTrue:[^self].
    lastFilterString := filterString.
        [
        aBlock := CompilerInterface evaluate: filterString.
        filteredGames := self games select: aBlock.
        (self paneNamed: 'gamesList') contents: filteredGames.
        self composite clearGameDetailsFields.] on: Error do: [:error |
        MessageBox warning: error.
        self selectFilter].! !



!NFLUI methods !
   
selectPlayoffs

	"'Playoffs' is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  15:04:52 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := 'Playoffs'.
    self updateGamesListOnMenuSelection.
    self composite clearGameDetailsFields.! !



!NFLUI methods !

selectRegularSeason

		"'Regular Season' is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  15:05:02 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := 'Regular Season'.
    self updateGamesListOnMenuSelection.
    self composite clearGameDetailsFields.! !



!NFLUI methods !
  
selectSuperbowl

	"'Superbowl' is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  15:05:11 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := 'Super Bowl'.
    self updateGamesListOnMenuSelection.
    self composite clearGameDetailsFields.! !



!NFLUI methods !

selectWildCard

	"'Wild Card' is selected from the menubar"
    #CodeTrackerBlock.  "Last Modified  15:05:23 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    menuSelection := 'Wild Card'.
    self updateGamesListOnMenuSelection.
    self composite clearGameDetailsFields.! !



!NFLUI methods !
  
updateGameDetailsOnSelection

	"getting NFLGame object from a selected row to update fields"
    | selectedRow game |
    #CodeTrackerBlock.  "Last Modified  15:04:29 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedRow := (self paneNamed: 'gamesList') selectedItem.
    selectedRow ifNotNil: [
        game := selectedRow.
        self composite displayGameDetails: game.].! !



!NFLUI methods !
 
updateGamesListOnMenuSelection

		"updates the list based on what is selected in the menubar, and calls filteredGamesForMenuSelection for proper filtering"
    | pane rows filteredGames |
    #CodeTrackerBlock.  "Last Modified  13:02:28 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    pane := self paneNamed: 'gamesList'.
    filteredGames := self filteredGamesForMenuSelection.
    rows := filteredGames collect: [:game |
        | row|row := OrderedCollection new.
        row add: (game id asString).
        row add: (game date printString).
        row add: (game season asString).
        row add: (game week asString).
        row add: game gameType.
        row add: game venue.
        row add: game summary.
        row yourself].
    pane contents: filteredGames.! !



!NFLUI methods !
   
views
    #CodeTrackerBlock.  "Last Modified  09:51:51 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^views! !



!NFLUI methods !
 
views: aValue
    #CodeTrackerBlock.  "Last Modified  09:51:51 06/26/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    views := aValue! !



!NFLUIComposite2 class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:13:28 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!NFLUIComposite2 class methods !
   
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  14:34:23 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!NFLUIComposite2 methods !
 
addSubpanes

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | atsHomeCheck atsVisitorCheck coachHome coachVisitor finalHome finalVisitor halfHome halfVisitor homeConferenceDivision homeEntry homeLine otHome otVisitor ouHomeCheck ouVisitorCheck q1Home q1Visitor q2Home q2Visitor q3Home q3Visitor q4Home q4Visitor segoeUI10 segoeUI8 staticText1 staticText10 staticText11 staticText12 staticText13 staticText14 staticText15 staticText16 staticText2 staticText3 staticText4 staticText5 staticText6 staticText7 staticText8 staticText9 visitorConferenceDivision visitorEntry visitorLine wonHomeCheck wonVisitorCheck xDU yDU |
    #CodeTrackerBlock.  "Last Modified  14:34:23 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #generated.
    xDU := (SysFont width + 1 roundTo: 2) / 4.
    yDU := SysFont height / 8.

		"Temporary Variables"
    atsHomeCheck := CheckBox new.
    atsVisitorCheck := CheckBox new.
    coachHome := EntryField new.
    coachVisitor := EntryField new.
    finalHome := EnhancedEntryField new.
    finalVisitor := EnhancedEntryField new.
    halfHome := EnhancedEntryField new.
    halfVisitor := EnhancedEntryField new.
    homeConferenceDivision := EnhancedEntryField new.
    homeEntry := EntryField new.
    homeLine := EnhancedEntryField new.
    otHome := EnhancedEntryField new.
    otVisitor := EnhancedEntryField new.
    ouHomeCheck := CheckBox new.
    ouVisitorCheck := CheckBox new.
    q1Home := EnhancedEntryField new.
    q1Visitor := EnhancedEntryField new.
    q2Home := EnhancedEntryField new.
    q2Visitor := EnhancedEntryField new.
    q3Home := EnhancedEntryField new.
    q3Visitor := EnhancedEntryField new.
    q4Home := EnhancedEntryField new.
    q4Visitor := EnhancedEntryField new.
    staticText1 := StaticText new.
    staticText10 := StaticText new.
    staticText11 := StaticText new.
    staticText12 := StaticText new.
    staticText13 := StaticText new.
    staticText14 := StaticText new.
    staticText15 := StaticText new.
    staticText16 := StaticText new.
    staticText2 := StaticText new.
    staticText3 := StaticText new.
    staticText4 := StaticText new.
    staticText5 := StaticText new.
    staticText6 := StaticText new.
    staticText7 := StaticText new.
    staticText8 := StaticText new.
    staticText9 := StaticText new.
    visitorConferenceDivision := EnhancedEntryField new.
    visitorEntry := EntryField new.
    visitorLine := EnhancedEntryField new.
    wonHomeCheck := CheckBox new.
    wonVisitorCheck := CheckBox new.

		"Font Definitions"
    segoeUI10 := Font new fromByteArray: #[
        243 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    self framingBlock: (
        LayoutFrame new
             leftRatio: 1 / 2;
             leftInset: -286 * xDU;
             topRatio: 1 / 2;
             topInset: -656 / 19 * yDU;
             rightRatio: 1 / 2;
             rightInset: -286 * xDU;
             bottomRatio: 1 / 2;
             bottomInset: -656 / 19 * yDU).
    staticText1
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 6 * xDU;
                 topRatio: 0;
                 topInset: 416 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -32 * xDU;
                 bottomRatio: 0;
                 bottomInset: -576 / 19 * yDU);
        contents: 'Visitor';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText1.
    staticText2
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 6 * xDU;
                 topRatio: 0;
                 topInset: 928 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -30 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1088 / 19 * yDU);
        contents: 'Home';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText2.
    visitorEntry "EntryField"
        owner: self;
        setName: 'visitorEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 36 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -104 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: visitorEntry.
    wonVisitorCheck "CheckBox"
        owner: self;
        setName: 'wonVisitorCheck';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 324 * xDU;
                 topRatio: 0;
                 topInset: 320 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -332 * xDU;
                 bottomRatio: 0;
                 bottomInset: -672 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    self addSubpane: wonVisitorCheck.
    atsVisitorCheck "CheckBox"
        owner: self;
        setName: 'atsVisitorCheck';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 348 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -358 * xDU;
                 bottomRatio: 0;
                 bottomInset: -576 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    self addSubpane: atsVisitorCheck.
    ouVisitorCheck "CheckBox"
        owner: self;
        setName: 'ouVisitorCheck';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 374 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -384 * xDU;
                 bottomRatio: 0;
                 bottomInset: -576 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    self addSubpane: ouVisitorCheck.
    coachVisitor "EntryField"
        owner: self;
        setName: 'coachVisitor';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 446 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -512 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: coachVisitor.
    staticText3
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 60 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -82 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'Team';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText3.
    staticText4
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 116 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -128 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: '1Q';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText4.
    staticText5
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 146 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -158 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: '2Q';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText5.
    staticText6
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 232 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -244 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: '4Q';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText6.
    staticText7
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 164 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -196 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'Halftime';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText7.
    staticText8
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 204 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -216 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: '3Q';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText8.
    staticText9
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 254 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -284 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'Overtime';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText9.
    staticText10
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 290 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -310 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'Final';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText10.
    staticText11
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 320 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -340 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'Won';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText11.
    staticText12
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 346 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -362 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'ATS';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText12.
    staticText13
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 372 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -388 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'O/U';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText13.
    staticText14
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 406 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -424 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'Line';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText14.
    staticText15
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 466 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -492 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        contents: 'Coach';
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: staticText15.
    homeEntry "EntryField"
        owner: self;
        setName: 'homeEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 36 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -104 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: homeEntry.
    wonHomeCheck "CheckBox"
        owner: self;
        setName: 'wonHomeCheck';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 324 * xDU;
                 topRatio: 0;
                 topInset: 800 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -332 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1152 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    self addSubpane: wonHomeCheck.
    atsHomeCheck "CheckBox"
        owner: self;
        setName: 'atsHomeCheck';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 348 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -358 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1088 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    self addSubpane: atsHomeCheck.
    ouHomeCheck "CheckBox"
        owner: self;
        setName: 'ouHomeCheck';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 374 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -384 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1088 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    self addSubpane: ouHomeCheck.
    coachHome "EntryField"
        owner: self;
        setName: 'coachHome';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 446 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -512 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    self addSubpane: coachHome.
    q1Visitor "EnhancedEntryField"
        owner: self;
        setName: 'q1Visitor';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 114 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -130 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q1Visitor.
    q1Home "EnhancedEntryField"
        owner: self;
        setName: 'q1Home';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 114 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -130 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q1Home.
    q2Visitor "EnhancedEntryField"
        owner: self;
        setName: 'q2Visitor';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 144 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -160 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q2Visitor.
    q3Visitor "EnhancedEntryField"
        owner: self;
        setName: 'q3Visitor';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 202 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -218 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q3Visitor.
    halfVisitor "EnhancedEntryField"
        owner: self;
        setName: 'halfVisitor';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 172 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -188 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: halfVisitor.
    q4Visitor "EnhancedEntryField"
        owner: self;
        setName: 'q4Visitor';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 230 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -246 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q4Visitor.
    otVisitor "EnhancedEntryField"
        owner: self;
        setName: 'otVisitor';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 260 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -276 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: otVisitor.
    finalVisitor "EnhancedEntryField"
        owner: self;
        setName: 'finalVisitor';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 292 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -308 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: finalVisitor.
    q2Home "EnhancedEntryField"
        owner: self;
        setName: 'q2Home';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 144 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -160 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q2Home.
    q3Home "EnhancedEntryField"
        owner: self;
        setName: 'q3Home';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 202 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -218 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q3Home.
    halfHome "EnhancedEntryField"
        owner: self;
        setName: 'halfHome';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 172 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -188 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: halfHome.
    q4Home "EnhancedEntryField"
        owner: self;
        setName: 'q4Home';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 230 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -246 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: q4Home.
    otHome "EnhancedEntryField"
        owner: self;
        setName: 'otHome';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 260 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -276 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: otHome.
    finalHome "EnhancedEntryField"
        owner: self;
        setName: 'finalHome';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 292 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -308 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: finalHome.
    visitorLine "EnhancedEntryField"
        owner: self;
        setName: 'visitorLine';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 396 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -434 * xDU;
                 bottomRatio: 0;
                 bottomInset: -616 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: visitorLine.
    homeLine "EnhancedEntryField"
        owner: self;
        setName: 'homeLine';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 396 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -434 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1128 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10;
        centered.
    self addSubpane: homeLine.
    visitorConferenceDivision "EnhancedEntryField"
        owner: self;
        setName: 'visitorConferenceDivision';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 530 * xDU;
                 topRatio: 0;
                 topInset: 384 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -550 * xDU;
                 bottomRatio: 0;
                 bottomInset: -600 / 19 * yDU);
        startGroup;
        noTabStop;
        font: SysFont.
    self addSubpane: visitorConferenceDivision.
    staticText16
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 506 * xDU;
                 topRatio: 0;
                 topInset: 64 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -574 * xDU;
                 bottomRatio: 0;
                 bottomInset: -320 / 19 * yDU);
        centered;
        contents: 'Conference and Division';
        startGroup;
        noTabStop;
        font: SysFont.
    self addSubpane: staticText16.
    homeConferenceDivision "EnhancedEntryField"
        owner: self;
        setName: 'homeConferenceDivision';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 530 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -550 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1112 / 19 * yDU);
        startGroup;
        noTabStop;
        font: SysFont.
    self addSubpane: homeConferenceDivision! !



!NFLUIComposite2 methods !
   
clearGameDetailsFields

" clears all the fields when selecting a menubar item since a specific game is not currently selected"
    #CodeTrackerBlock.  "Last Modified  14:36:11 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (self paneNamed: 'visitorEntry') contents: ''.
    (self paneNamed: 'homeEntry') contents: ''.
    (self paneNamed: 'q1Visitor') contents: ''.
    (self paneNamed: 'q1Home') contents: ''.
    (self paneNamed: 'q2Visitor') contents: ''.
    (self paneNamed: 'q2Home') contents: ''.
    (self paneNamed: 'q3Visitor') contents: ''.
    (self paneNamed: 'q3Home') contents: ''.
    (self paneNamed: 'q4Visitor') contents: ''.
    (self paneNamed: 'q4Home') contents: ''.
    (self paneNamed: 'halfVisitor') contents: ''.
    (self paneNamed: 'halfHome') contents: ''.
    (self paneNamed: 'otVisitor') contents: ''.
    (self paneNamed: 'otHome') contents: ''.
    (self paneNamed: 'finalVisitor') contents: ''.
    (self paneNamed: 'finalHome') contents: ''.
    (self paneNamed: 'coachVisitor') contents: ''.
    (self paneNamed: 'coachHome') contents: ''.
    (self paneNamed: 'visitorLine') contents: ''.
    (self paneNamed: 'homeLine') contents: ''.

	"Uncheck all checkboxes"
    (self paneNamed: 'wonVisitorCheck') uncheck.
    (self paneNamed: 'wonHomeCheck') uncheck.
    (self paneNamed: 'atsVisitorCheck') uncheck.
    (self paneNamed: 'atsHomeCheck') uncheck.
    (self paneNamed: 'ouVisitorCheck') uncheck.
    (self paneNamed: 'ouHomeCheck') uncheck.! !



!NFLUIComposite2 methods !

displayCoachesFrom: aGame 

		"gets what needs to be displayed for the coaches"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  14:36:39 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    (self paneNamed: 'coachVisitor') contents: visitor coach.
    (self paneNamed: 'coachHome') contents: home coach.! !



!NFLUIComposite2 methods !
   
displayConferenceDivisionFrom: aGame 

		"dispalys the conference/division of the home or visitor team"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  15:13:37 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    (self paneNamed: 'visitorConferenceDivision') contents: (visitor conferenceDivision ifNil: ['']).
    (self paneNamed: 'homeConferenceDivision') contents: (home conferenceDivision ifNil: ['']).! !



!NFLUIComposite2 methods !
   
displayFinalScoresFrom: aGame 

		"gets what needs to be displayed for the final scores"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  14:36:52 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    (self paneNamed: 'finalVisitor') contents: visitor totalPoints asString.
    (self paneNamed: 'finalHome') contents: home totalPoints asString.! !



!NFLUIComposite2 methods !

displayGameDetails: aGame 

	"retrieving details to display at bottom whenever a game is selected"
    #CodeTrackerBlock.  "Last Modified  15:14:15 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self displayTeamNamesFrom: aGame.
    self displayQuarterScoresFrom: aGame.
    self displayHalftimeScoresFrom: aGame.
    self displayOvertimeScoresFrom: aGame.
    self displayFinalScoresFrom: aGame.
    self displayCoachesFrom: aGame.
    self displayConferenceDivisionFrom: aGame.

	"checkboxes"
    self updateWinCheckForGame: aGame.
    self updateATSCheckForGame: aGame.
    self updateOUCheckForGame: aGame.
    self updateLineFieldsForGame: aGame.! !



!NFLUIComposite2 methods !

displayHalftimeScoresFrom: aGame 

		"gets what needs to be displayd for half time scores"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  14:37:03 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    (self paneNamed: 'halfVisitor') contents: ((visitor q1 + visitor q2) asString).
    (self paneNamed: 'halfHome') contents: ((home q1 + home q2) asString).! !



!NFLUIComposite2 methods !
   
displayOvertimeScoresFrom: aGame 

	"gets what is to be displayed for the overtime"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  14:37:12 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    aGame overtime
        ifTrue:[
            (self paneNamed: 'otVisitor') contents: visitor overtime asString.
            (self paneNamed: 'otHome') contents: home overtime asString.
            (self paneNamed: 'otVisitor') enable.
            (self paneNamed: 'otHome') enable.]
        ifFalse:[
            (self paneNamed: 'otVisitor') contents: ''.
            (self paneNamed: 'otHome') contents: ''.
            (self paneNamed: 'otVisitor') disable.
            (self paneNamed: 'otHome') disable.].! !



!NFLUIComposite2 methods !
  
displayQuarterScoresFrom: aGame 

		"gets what is to be displayed in each quarter"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  14:37:22 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    (self paneNamed: 'q1Visitor') contents: visitor q1 asString.
    (self paneNamed: 'q1Home') contents: home q1 asString.
    (self paneNamed: 'q2Visitor') contents: visitor q2 asString.
    (self paneNamed: 'q2Home') contents: home q2 asString.
    (self paneNamed: 'q3Visitor') contents: visitor q3 asString.
    (self paneNamed: 'q3Home') contents: home q3 asString.
    (self paneNamed: 'q4Visitor') contents: visitor q4 asString.
    (self paneNamed: 'q4Home') contents: home q4 asString.! !



!NFLUIComposite2 methods !

displayTeamNamesFrom: aGame 

	"gets what is displayed for team names"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  14:37:34 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    (self paneNamed: 'visitorEntry') contents: (visitor teamName).
    (self paneNamed: 'homeEntry') contents: (home teamName).! !



!NFLUIComposite2 methods !
  
initWindow

	"initializes composite"
    #CodeTrackerBlock.  "Last Modified  15:10:18 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    super initWindow.
    self clearGameDetailsFields.! !



!NFLUIComposite2 methods !
   
selectedGame: selectedGame 

		  "has composite handle the game fields"
    #CodeTrackerBlock.  "Last Modified  14:34:48 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (self paneNamed: 'composite') selecetdGame: selectedGame.! !



!NFLUIComposite2 methods !
  
updateATSCheckForGame: aGame 

		"checks/unchecks vistor or home team box based on atsWinner result in a game"
    | atsWinner |
    #CodeTrackerBlock.  "Last Modified  14:38:08 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "check ATS box based on higher number after adding vegasLine value"
    atsWinner := aGame atsWinner.
    (self paneNamed: 'atsVisitorCheck') uncheck.
    (self paneNamed: 'atsHomeCheck') uncheck.
    atsWinner = aGame visitorTeam
        ifTrue:[(self paneNamed: 'atsVisitorCheck') check].
    atsWinner = aGame homeTeam
        ifTrue:[(self paneNamed: 'atsHomeCheck') check].! !



!NFLUIComposite2 methods !

updateLineFieldsForGame: aGame 

		"updating line fields based on favorite and over/under results"
    | favorite underdog favoritePane underdogPane |
    #CodeTrackerBlock.  "Last Modified  14:38:44 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (aGame vegasLine isNil or: [aGame overUnder isNil])
        ifTrue:[
            (self paneNamed: 'visitorLine') contents: ''.
            (self paneNamed: 'homeLine') contents: ''.
            ^self].
    favorite := aGame vegasFavorite.
    underdog := aGame vegasUnderdog.
    favoritePane := (favorite = aGame homeTeam)
        ifTrue:[self paneNamed: 'homeLine']
        ifFalse:[self paneNamed: 'visitorLine'].
    underdogPane := (underdog = aGame homeTeam)
        ifTrue:[self paneNamed: 'homeLine']
        ifFalse:[self paneNamed: 'visitorLine'].
    favoritePane contents: (aGame vegasLine) asString.
    underdogPane contents: (aGame overUnder) asString.! !



!NFLUIComposite2 methods !
  
updateOUCheckForGame: aGame 

				"determines whether o/u box is checked based on results from overUnderResult in NFLGame class"
    | visitor home ouResult |
    #CodeTrackerBlock.  "Last Modified  14:39:01 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.

		"Get Over/Under result from the game"
    ouResult := aGame overUnderResult.
    ouResult ifNil: [
        (self paneNamed: 'ouVisitorCheck') uncheck.
        (self paneNamed: 'ouHomeCheck') uncheck.
        ^self].
    ouResult
        ifTrue:[ "Over wins"
            (self paneNamed: 'ouVisitorCheck') check.
            (self paneNamed: 'ouHomeCheck') uncheck.]
        ifFalse:[ "Under wins"
            (self paneNamed: 'ouVisitorCheck') uncheck.
            (self paneNamed: 'ouHomeCheck') check.].! !



!NFLUIComposite2 methods !
  
updateWinCheckForGame: aGame 

"gets the winner by calling game winner (NFLTeamInGame class>>winnerBetween:and:).
If winner is nil, it's a tie, so uncheck both. If winner equals visitor, check visitor's won box and uncheck home's."
    | visitor home winningTeam |
    #CodeTrackerBlock.  "Last Modified  14:39:08 06/30/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    visitor := aGame visitorTeam.
    home := aGame homeTeam.
    winningTeam := aGame winner.
    winningTeam isNil
        ifTrue:[ "Tie game: uncheck both"
            (self paneNamed: 'wonVisitorCheck') uncheck.
            (self paneNamed: 'wonHomeCheck') uncheck.]
        ifFalse:[
            winningTeam = visitor
                ifTrue:[
                    (self paneNamed: 'wonVisitorCheck') check.
                    (self paneNamed: 'wonHomeCheck') uncheck.]
                ifFalse:[
                    (self paneNamed: 'wonVisitorCheck') uncheck.
                    (self paneNamed: 'wonHomeCheck') check.].].! !
