
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
    ' games teams coaches '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #NFLDivisionSeason
  instanceVariableNames: 
    ' season conferenceDivision teamSeasons '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #NFLGame
  instanceVariableNames: 
    ' date id season week gameType homeTeamWasFavorite vegasLine overUnder temperature roof surface startTime overtime venue visitorTeam homeTeam '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #NFLHeadCoach
  instanceVariableNames: 
    ' games name '
  classVariableNames: ''
  poolDictionaries: ''  !
Object subclass: #NFLTeamInGame
  instanceVariableNames: 
    ' teamName conferenceDivision coach q1 q2 q3 q4 overtime game '
  classVariableNames: ''
  poolDictionaries: ''    !
Object subclass: #NFLTeamSeason
  instanceVariableNames: 
    ' teamName games season nextSeason '
  classVariableNames: ''
  poolDictionaries: ''   !
ViewManager subclass: #NFLBoxPoolUI
  instanceVariableNames: 
    ' db games analyzer allGrid wonGrid allRows wonRows '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '   !
ViewManager subclass: #NFLDivisionSeasonsUI
  instanceVariableNames: 
    ' allDivisionSeasons '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '  !
ViewManager subclass: #NFLHeadCoachUI
  instanceVariableNames: 
    ' database coachStatsList displayedCoachStatsList latestFilterBlock '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants ' !
ViewManager subclass: #NFLTeamSeasonsUI
  instanceVariableNames: 
    ' allTeamSeasons filteredTeamSeasons latestFilterBlock teamSeasonToShowOnOpen '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants ' !
ViewManager subclass: #NFLUI
  instanceVariableNames: 
    ' db games menuSelection lastFilterString gamesToShowOnOpen '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '  !
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
    #CodeTrackerBlock.  "Last Modified  10:13:34 07/02/25"
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
    | comboDropdown gridList mainView segoeUI10 segoeUI8 xDU yDU |
    #CodeTrackerBlock.  "Last Modified  10:13:34 07/02/25"
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
    segoeUI10 := Font new fromByteArray: #[
        243 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
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
                 leftInset: -75 * xDU;
                 topRatio: 0;
                 topInset: 448 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -69 * xDU;
                 bottomRatio: 1;
                 bottomInset: 232 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI8;
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
        font: segoeUI10;
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
    | itemsToSelect selectedItem altCombo |
    #CodeTrackerBlock.  "Last Modified  10:13:30 07/02/25"
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
    aPane selectedItems: itemsToSelect.
    (self paneNamed: 'gridList') refresh.! !



!NFLBoxPoolUI methods !

initWindow

	"initilaize Box Pool UI window"
    #CodeTrackerBlock.  "Last Modified  10:12:29 07/02/25"
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
 
allCurrentHeadCoaches

	"reads in the current head coaches file"
    | fileStream coachNames line parts |
    #CodeTrackerBlock.  "Last Modified  12:00:39 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coachNames := OrderedCollection new.
    fileStream := File pathNameReadOnly: 'Data/currentHeadCoaches-copy.txt'.
    [fileStream atEnd]
        whileFalse:[
            line := fileStream nextLine.
            (line isNil or: [line isEmpty])
                ifFalse:[
                    parts := line asArrayOfSubstringsDelimitedBy: Character tab.
                    (parts size >= 2)
                        ifTrue:[coachNames add: (parts at: 2)].].].
    fileStream close.
    ^coachNames.! !



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
 
allTeamsInGames

        "extracts all TeamInGame objects with allGames"
    | temp |
    #CodeTrackerBlock.  "Last Modified  15:57:57 07/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "extracts all TeamInGame objects with allGames"
    temp := OrderedCollection new.
    self allGames do: [:game |
        temp add: game homeTeam.
        temp add: game visitorTeam.].
    ^temp.! !



!NFLDatabase methods !

coaches

		"put all the coaches into an ordered collection"
    #CodeTrackerBlock.  "Last Modified  10:23:01 07/07/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^coaches ifNil: [coaches := OrderedCollection new].! !



!NFLDatabase methods !
  
coaches: aValue
    #CodeTrackerBlock.  "Last Modified  10:22:28 07/07/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coaches := aValue! !



!NFLDatabase methods !
  
coachStatsFromGames: allGames 

	"Return an OrderedCollection of NFLHeadCoachStats, one per unique coach."
    | coachesByName coachesCollection |
    #CodeTrackerBlock.  "Last Modified  10:22:05 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coachesByName := Dictionary new.
    allGames do: [:game |
        (OrderedCollection with: game homeTeam with: game visitorTeam) do: [:teamInGame |
            | coachName coach|coachName := teamInGame coach.
            coach := coachesByName at: coachName ifAbsentPut: [| newCoach|newCoach := NFLHeadCoach new.
            newCoach name: coachName.
            newCoach games: OrderedCollection new.
            newCoach].
            coach games add: game.].].
    coachesCollection := coachesByName values asOrderedCollection.
    ^coachesCollection asSortedCollection: [:a :b | a name < b name].! !



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



!NFLDivisionSeason class methods !
  
allDivisionSeasonsFromTeamSeasons: allTeamSeasons 

	"Given a collection of NFLTeamSeason objects, returns a collection of NFLDivisionSeason objects for each unique division/season pair"
    | grouped divisionSeasons |
    #CodeTrackerBlock.  "Last Modified  13:42:30 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    grouped := Dictionary new.
    allTeamSeasons do: [:ts |
        | key list|key := Array with: ts conferenceDivision with: ts season. "key consisting of the division and season for this team season"
        list := grouped at: key ifAbsentPut: [OrderedCollection new]. "Get list of team seasons or create a new list if none exist."
        list add: ts].
    divisionSeasons := OrderedCollection new. "collection to hold the resulting NFLDivisionSeason objects"
    grouped keysDo: [:key |
        | divSeasonsObj tsList|tsList := grouped at: key. "get list of team seasons for this division/season"
        divSeasonsObj := self fromTeamSeasons: tsList conferenceDivision: (key at: 1) season: (key at: 2). "new NFLDivisionSeason for this division/season, using grouped team season"
        divisionSeasons add: divSeasonsObj].
    ^divisionSeasons! !



!NFLDivisionSeason class methods !
 
fromTeamSeasons: teamSeasons conferenceDivision: aDivision season: aSeason 

	"Build and return a new NFLDivisionSeason for a division/season from its NFLTeamSeason objects."
    | obj filteredTeamSeasons |
    #CodeTrackerBlock.  "Last Modified  13:27:08 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    filteredTeamSeasons := teamSeasons select: [:ts |
        ts conferenceDivision = aDivision and: [ts season = aSeason]].
    obj := self new.
    obj conferenceDivision: aDivision.
    obj season: aSeason.
    obj teamSeasons: filteredTeamSeasons.
    ^obj! !



!NFLDivisionSeason class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:23:02 07/09/25"
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



!NFLDivisionSeason methods !
   
bestResult

	"gets the best string result"
    | maximum |
    #CodeTrackerBlock.  "Last Modified  22:53:24 07/13/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    maximum := 0.
    teamSeasons do: [:aTeamSeason |
        (aTeamSeason strengthPoints > maximum)
            ifTrue:[maximum := aTeamSeason strengthPoints]].
    maximum = 5
        ifTrue:[^'Won Super Bowl'].
    maximum = 4
        ifTrue:[^'Lost Super Bowl'].
    maximum = 3
        ifTrue:[^'Lost Conference Ch.'].
    maximum = 2
        ifTrue:[^'Lost in Div. Round'].
    maximum = 1
        ifTrue:[^'Lost in WC Round'].
    ^'Missed Playoffs'.! !



!NFLDivisionSeason methods !
  
conferenceDivision
    #CodeTrackerBlock.  "Last Modified  16:19:33 07/09/25"
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



!NFLDivisionSeason methods !
   
conferenceDivision: aValue
    #CodeTrackerBlock.  "Last Modified  16:19:33 07/09/25"
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



!NFLDivisionSeason methods !
  
conferenceDivisionName

		"formatted names"
    | code conferenceMap divisionMap conference division |
    #CodeTrackerBlock.  "Last Modified  16:22:42 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    code := self conferenceDivision asUppercase.
    conferenceMap := Dictionary new.
    conferenceMap at: $A put: 'AFC'.
    conferenceMap at: $N put: 'NFC'.
    divisionMap := Dictionary new.
    divisionMap at: $E put: 'East'.
    divisionMap at: $W put: 'West'.
    divisionMap at: $C put: 'Central'.
    divisionMap at: $N put: 'North'.
    divisionMap at: $S put: 'South'.
    conference := conferenceMap at: code first.
    division := divisionMap at: code two.
    ^conference , ' ' , division.! !



!NFLDivisionSeason methods !
  
divisionAndOpponentTeamsIn: aGame 

	"Returns (divisionTeam . opponentTeam), or nil if neither team is in the division."
    | divTeam oppTeam arr |
    #CodeTrackerBlock.  "Last Modified  16:50:49 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    divTeam := self divisionTeamInGame: aGame.
    divTeam isNil
        ifTrue:[^nil].
    oppTeam := (divTeam = aGame homeTeam)
        ifTrue:[aGame visitorTeam]
        ifFalse:[aGame homeTeam].
    arr := Array new: 2.
    arr at: 1 put: divTeam.
    arr at: 2 put: oppTeam.
    ^arr.! !



!NFLDivisionSeason methods !
 
divisionTeamInGame: aGame 

	"Returns the team in this division in aGame, or nil if neither team is in the division."
    #CodeTrackerBlock.  "Last Modified  16:43:02 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(aGame homeTeam conferenceDivision = self conferenceDivision)
        ifTrue:[aGame homeTeam]
        ifFalse:[
            (aGame visitorTeam conferenceDivision = self conferenceDivision)
                ifTrue:[aGame visitorTeam]
                ifFalse:[nil]].! !



!NFLDivisionSeason methods !
  
losses

	"counts the wins for a team in a season"
    #CodeTrackerBlock.  "Last Modified  14:31:01 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:sum :ts | sum + ts lossesNotInDivision]! !



!NFLDivisionSeason methods !
 
netRecord

		"net points"
    #CodeTrackerBlock.  "Last Modified  15:18:22 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self nonDivisionPfRecord - self nonDivisionPaRecord).! !



!NFLDivisionSeason methods !

nonDivisionPaRecord

	"Points allowed (PA) to opponent team that is outside their division"
    #CodeTrackerBlock.  "Last Modified  09:59:36 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:sum :ts | sum + ts nonDivisionPaRecord].! !



!NFLDivisionSeason methods !
  
nonDivisionPfRecord

	"Points for (PF) a team when playing against another team outside their division"
    #CodeTrackerBlock.  "Last Modified  10:00:08 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:sum :ts | sum + ts nonDivisionPfRecord].! !



!NFLDivisionSeason methods !
  
numberOfPlayoffTeams

"Return the number of teams in this division that made the playoffs this season."
    #CodeTrackerBlock.  "Last Modified  15:54:19 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(teamSeasons select: [:aTeamSeason | aTeamSeason madePlayoffs]) size.! !



!NFLDivisionSeason methods !
   
numberOfTeamsInDivision

"Return the number of teams in this division that made the playoffs this season."
    #CodeTrackerBlock.  "Last Modified  15:59:19 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(teamSeasons select: [:teamSeason | teamSeason conferenceDivision = self conferenceDivision]) size.! !



!NFLDivisionSeason methods !
  
pointsAllowed

		"Points allowed"
    #CodeTrackerBlock.  "Last Modified  15:32:15 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:sum :ts | sum + ts pointsAllowed].! !



!NFLDivisionSeason methods !
  
pointsFor

	"Points scored (PF) a team when playing against teams that are within their division"
    #CodeTrackerBlock.  "Last Modified  10:00:38 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:sum :ts | sum + ts pointsFor].! !



!NFLDivisionSeason methods !
  
season
    #CodeTrackerBlock.  "Last Modified  14:58:08 07/09/25"
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



!NFLDivisionSeason methods !
   
season: aValue
    #CodeTrackerBlock.  "Last Modified  14:58:08 07/09/25"
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



!NFLDivisionSeason methods !
  
strengthTotal

		"calls strengthPoints from NFLTeamSeason to get results from each season to add up points"
    #CodeTrackerBlock.  "Last Modified  16:20:41 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:total :team | total + team strengthPoints]! !



!NFLDivisionSeason methods !

teamSeasons

		"seasons for teams collection"
    #CodeTrackerBlock.  "Last Modified  11:53:12 07/10/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teamSeasons ifNil: [teamSeasons := OrderedCollection new].
    ^teamSeasons! !



!NFLDivisionSeason methods !
 
teamSeasons: aValue
    #CodeTrackerBlock.  "Last Modified  11:49:23 07/10/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teamSeasons := aValue! !



!NFLDivisionSeason methods !

ties

	"counts the wins for a team in a season"
    #CodeTrackerBlock.  "Last Modified  14:30:38 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:sum :ts | sum + ts tiesNotInDivision]! !



!NFLDivisionSeason methods !
 
winningPercentage

        "calc winning % for a Division's season"
    | totalGames result |
    #CodeTrackerBlock.  "Last Modified  16:44:44 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #CodeTrackerBlock. "Last Modified	14:47:44 07/07/25"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    totalGames := self wins + self losses + self ties.
    totalGames = 0
        ifTrue:[^0.0].
    result := ((self wins + (self ties / 2.0)) / totalGames) * 100.
    ^result roundTo: 0.001! !



!NFLDivisionSeason methods !
 
wins

	"counts the wins for a team in a season"
    #CodeTrackerBlock.  "Last Modified  14:30:02 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasons inject: 0 into: [:sum :ts | sum + ts winsNotInDivision]! !



!NFLDivisionSeasonsUI class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:52:08 07/09/25"
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



!NFLDivisionSeasonsUI class methods !
  
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  11:10:18 07/14/25"
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



!NFLDivisionSeasonsUI methods !

allDivisionSeasons

	"collection of all division seasons"
    #CodeTrackerBlock.  "Last Modified  15:01:35 07/09/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^allDivisionSeasons ifNil: [allDivisionSeasons := OrderedCollection new].! !



!NFLDivisionSeasonsUI methods !
 
allDivisionSeasons: aValue
    #CodeTrackerBlock.  "Last Modified  15:00:04 07/09/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    allDivisionSeasons := aValue! !



!NFLDivisionSeasonsUI methods !
   
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | divisionSeasonsList mainView segoeUI8 xDU yDU |
    #CodeTrackerBlock.  "Last Modified  11:10:18 07/14/25"
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
    divisionSeasonsList := CPColumnarListBox new.

		"Font Definitions"
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    mainView
        owner: self;
        setName: 'mainView';
        when: #maximized send: #winMaximized to: mainView;
        when: #minimized send: #winMinimized to: mainView;
        when: #restored send: #winRestored to: mainView;
        labelWithoutPrefix: 'New Window';
        noSmalltalkMenuBar;
        backColor: Color buttonFace;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -319 * xDU;
                 topRatio: 1 / 2;
                 topInset: -3184 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -319 * xDU;
                 bottomRatio: 1 / 2;
                 bottomInset: -3184 / 19 * yDU).
    self addView: mainView.
    divisionSeasonsList "CPColumnarListBox"
        owner: self;
        setName: 'divisionSeasonsList';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 0 * xDU;
                 topRatio: 0;
                 topInset: 192 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -618 * xDU;
                 bottomRatio: 0;
                 bottomInset: -5888 / 19 * yDU);
        startGroup;
        noTabStop;
        receiveAllWindowMessages;
        setPopupMenu: (
            Menu new
                 title: '';
                 owner: self;
                 appendItem: 'Show Teams' selector: #showTeamSeasonUI);
        font: segoeUI8;
        headerColor: (
            RGBColor red: 205 green: 220 blue: 254);
        canSort: true;
        fields: (
            OrderedCollection new
                 addLast: (
                    CPCLBField new
                         header: 'Season';
                         selector: #season);
                 addLast: (
                    CPCLBField new
                         header: 'Name';
                         selector: #conferenceDivisionName);
                 addLast: (
                    CPCLBField new
                         header: 'Wins';
                         justification: #center;
                         selector: #wins);
                 addLast: (
                    CPCLBField new
                         header: 'Losses';
                         justification: #center;
                         selector: #losses);
                 addLast: (
                    CPCLBField new
                         header: 'Ties';
                         justification: #center;
                         selector: #ties);
                 addLast: (
                    CPCLBField new
                         header: 'Winning %';
                         justification: #center;
                         selector: #winningPercentage);
                 addLast: (
                    CPCLBField new
                         header: 'PF';
                         justification: #center;
                         selector: #nonDivisionPfRecord);
                 addLast: (
                    CPCLBField new
                         header: 'PA';
                         justification: #center;
                         selector: #nonDivisionPaRecord);
                 addLast: (
                    CPCLBField new
                         header: 'Net';
                         justification: #center;
                         selector: #netRecord);
                 addLast: (
                    CPCLBField new
                         header: 'PO';
                         justification: #center;
                         selector: #numberOfPlayoffTeams);
                 addLast: (
                    CPCLBField new
                         header: 'Strength';
                         justification: #center;
                         selector: #strengthTotal);
                 addLast: (
                    CPCLBField new
                         header: '# Teams in Div.';
                         justification: #center;
                         selector: #numberOfTeamsInDivision);
                 addLast: (
                    CPCLBField new
                         header: 'Result';
                         justification: #center;
                         selector: #bestResult);
                 yourself).
    mainView addSubpane: divisionSeasonsList! !



!NFLDivisionSeasonsUI methods !
  
initWindow

	"initialize DivisionSeasonsUI"
    #CodeTrackerBlock.  "Last Modified  11:09:48 07/14/25"
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
    self populateDivisionSeasonsList.
    (self paneNamed: 'divisionSeasonsList')
        backColor2: (
            Color red: 208.0 green: 240.0 blue: 192.0);
        foreColor: Color darkPink.! !



!NFLDivisionSeasonsUI methods !
 
populateDivisionSeasonsList

	"take all the records and gorup them into division seasons"
    | divisionSeasonsList |
    #CodeTrackerBlock.  "Last Modified  13:09:39 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    divisionSeasonsList := NFLDivisionSeason allDivisionSeasonsFromTeamSeasons: (
        NFLTeamSeason allSeasonsFromGames: (NFLDatabase new allTeamsInGames)).
    self allDivisionSeasons: divisionSeasonsList.
    (self paneNamed: 'divisionSeasonsList') contents: divisionSeasonsList.! !



!NFLDivisionSeasonsUI methods !
   
showTeamSeasonUI

	"Callback for the menu item titled 'Show Teams'.
	 (Generated by WindowBuilder)"
    | selectedDivision divisionTeamSeasons |
    #CodeTrackerBlock.  "Last Modified  23:34:48 07/13/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedDivision := (self paneNamed: 'divisionSeasonsList') selectedItem.
    divisionTeamSeasons := selectedDivision teamSeasons.
    NFLTeamSeasonsUI openOn: divisionTeamSeasons.! !



!NFLDivisionSeasonsUI methods !
 
views
    #CodeTrackerBlock.  "Last Modified  15:00:04 07/09/25"
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



!NFLDivisionSeasonsUI methods !
  
views: aValue
    #CodeTrackerBlock.  "Last Modified  15:00:04 07/09/25"
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
    #CodeTrackerBlock.  "Last Modified  11:50:37 07/02/25"
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
    aGame visitorTeam: (NFLTeamInGame fromFields: visitorFields game: aGame).
    aGame homeTeam: (NFLTeamInGame fromFields: homeFields game: aGame).
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
   
isFirstGameOfSeason

	"Returns true if this game is in week 1 (self-contained logic)."
    #CodeTrackerBlock.  "Last Modified  12:42:53 07/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self week = 1.! !



!NFLGame methods !
 
isPlayoff

		"associates either 'W', 'D', 'C', or 'S' to method to be called for the Playoffs menubar selection"
    #CodeTrackerBlock.  "Last Modified  15:50:22 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self isRegularSeason not! !



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
 
isSameDivision

		"returns if teams are in the same division"
    #CodeTrackerBlock.  "Last Modified  14:41:37 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^homeTeam conferenceDivision = visitorTeam conferenceDivision.! !



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

		"assigns the vegasUnderdig to the visitor team if it returns true, or the home team if it returns false"
    #CodeTrackerBlock.  "Last Modified  12:58:00 07/07/25"
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

winningTeam

	"Returns the instance of the winning NFLTeamInGame for this game, or nil if it is a tie"
    | visitor home |
    #CodeTrackerBlock.  "Last Modified  14:29:37 07/02/25"
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
    (visitor totalPoints > home totalPoints)
        ifTrue:[^visitor].
    (home totalPoints > visitor totalPoints)
        ifTrue:[^home].
    ^nil! !



!NFLHeadCoach class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:41:55 07/02/25"
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



!NFLHeadCoach methods !

atsLossCount

	"Count the number of games this coach lost ATS."
    #CodeTrackerBlock.  "Last Modified  10:07:55 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(games select: [:game |
        | team atsWinner|team := (game homeTeam coach = name)
            ifTrue:[game homeTeam]
            ifFalse:[game visitorTeam].
        atsWinner := game atsWinner.
        (atsWinner notNil and: [atsWinner ~= team])]) size.! !



!NFLHeadCoach methods !
   
atsTieCount

	"Count the number of ATS ties (pushes) for this coach."
    #CodeTrackerBlock.  "Last Modified  10:08:04 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(games select: [:game | game atsWinner isNil]) size.! !



!NFLHeadCoach methods !
   
atsWinCount

	"Count the number of games this coach won ATS."
    #CodeTrackerBlock.  "Last Modified  10:08:11 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(games select: [:game |
        | team atsWinner|team := (game homeTeam coach = name)
            ifTrue:[game homeTeam]
            ifFalse:[game visitorTeam].
        atsWinner := game atsWinner.
        atsWinner = team]) size.! !



!NFLHeadCoach methods !

atsWinPercentage

	"Calculate ATS win percentage as a float (0-100)."
    | total |
    #CodeTrackerBlock.  "Last Modified  10:08:16 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    total := games size.
    total = 0
        ifTrue:[^0].
    ^((self atsWinCount asFloat / total) * 100) roundTo: 0.01! !



!NFLHeadCoach methods !
 
games

		"getter"
    #CodeTrackerBlock.  "Last Modified  10:08:22 07/07/25"
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



!NFLHeadCoach methods !

games: aValue 

		  "setter"
    #CodeTrackerBlock.  "Last Modified  10:08:34 07/07/25"
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



!NFLHeadCoach methods !

lossCount

	"counts the # of losses for the games that are returned from the 'lost' method"
    #CodeTrackerBlock.  "Last Modified  10:08:43 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(games select: [:game |
        | coachTeam|coachTeam := (game homeTeam coach = name)
            ifTrue:[game homeTeam]
            ifFalse:[game visitorTeam].
        coachTeam lost]) size.! !



!NFLHeadCoach methods !
  
name

		"getter"
    #CodeTrackerBlock.  "Last Modified  10:12:24 07/07/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^name! !



!NFLHeadCoach methods !
  
name: aValue 

		  "setter"
    #CodeTrackerBlock.  "Last Modified  10:12:36 07/07/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    name := aValue! !



!NFLHeadCoach methods !
  
tieCount

	"counts the number of ties baseed on what teams are returned from the 'tie' method"
    #CodeTrackerBlock.  "Last Modified  10:08:49 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(games select: [:game |
        | coachTeam|coachTeam := (game homeTeam coach = name)
            ifTrue:[game homeTeam]
            ifFalse:[game visitorTeam].
        coachTeam tied]) size.! !



!NFLHeadCoach methods !
   
winCount

	"counts the # of wins for the games that are returned from the 'won' method"
    #CodeTrackerBlock.  "Last Modified  10:08:55 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(games select: [:game |
        | coachTeam|coachTeam := (game homeTeam coach = name)
            ifTrue:[game homeTeam]
            ifFalse:[game visitorTeam].
        coachTeam won]) size.! !



!NFLHeadCoach methods !
   
winPercentage

	"calcs the win % based on the winCount/total games"
    | total |
    #CodeTrackerBlock.  "Last Modified  10:09:04 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    total := games size.
    total = 0
        ifTrue:[^0].
    ^((self winCount asFloat / total) * 100) roundTo: 0.001! !



!NFLHeadCoachUI class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:28:52 07/02/25"
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



!NFLHeadCoachUI class methods !

wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  16:32:33 07/03/25"
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



!NFLHeadCoachUI methods !
  
applyCurrentFilters

	"filters all coaches according to the current active filter"
    | filteredCoaches currentHCNames |
    #CodeTrackerBlock.  "Last Modified  10:39:46 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    filteredCoaches := self filteredCoachStatsListFor: (latestFilterBlock ifNil: [[:game | true]]).
    (self paneNamed: 'currentHCOnly') value
        ifTrue:[
            currentHCNames := self database allCurrentHeadCoaches.
            filteredCoaches := filteredCoaches select: [:coach | currentHCNames includes: coach name].].

	"filteredCoaches is a list of NFLHeadCoach objects, each recalculated for only the games that match the current filter"
    self displayedCoachStatsList: filteredCoaches.! !



!NFLHeadCoachUI methods !
 
ATSButtonClicked

		"calls sorting method when the button is clicked"
    #CodeTrackerBlock.  "Last Modified  09:45:18 07/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self sortByATSPercentage.! !



!NFLHeadCoachUI methods !
 
coachStatsList

		"the stats are an ordered collection"
    #CodeTrackerBlock.  "Last Modified  09:41:29 07/03/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^coachStatsList ifNil: [OrderedCollection new].! !



!NFLHeadCoachUI methods !
   
coachStatsList: aValue
    #CodeTrackerBlock.  "Last Modified  09:39:16 07/03/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coachStatsList := aValue! !



!NFLHeadCoachUI methods !
 
createMenus: aPane 

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    #CodeTrackerBlock.  "Last Modified  16:32:33 07/03/25"
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
                 title: 'Filters';
                 owner: self;
                 appendItem: 'All Games' selector: #filterAllGames;
                 appendItem: 'Regular Season' selector: #filterRegularSeason;
                 appendItem: 'Playoff' selector: #filterPlayoff;
                 appendItem: 'Wild Card' selector: #filterWildCard;
                 appendItem: 'Division' selector: #filterDivision;
                 appendItem: 'Conference Championship' selector: #filterConferenceChampionship;
                 appendItem: 'Super Bowl' selector: #filterSuperBowl;
                 appendItem: 'First Game of Season' selector: #filterFirstGameOfSeason)! !



!NFLHeadCoachUI methods !
 
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | coachList currentHCOnly filterField mainView searchCoach segoeUI8 sortATS sortSU xDU yDU |
    #CodeTrackerBlock.  "Last Modified  16:32:33 07/03/25"
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
    coachList := CPColumnarListBox new.
    currentHCOnly := CheckBox new.
    filterField := EnhancedEntryField new.
    searchCoach := EntryField new.
    sortATS := Button new.
    sortSU := Button new.

		"Font Definitions"
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    mainView
        owner: self;
        setName: 'mainView';
        when: #maximized send: #winMaximized to: mainView;
        when: #minimized send: #winMinimized to: mainView;
        when: #restored send: #winRestored to: mainView;
        labelWithoutPrefix: 'Head Coach Statistics';
        noSmalltalkMenuBar;
        backColor: Color buttonFace;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -244 * xDU;
                 topRatio: 1 / 2;
                 topInset: -2880 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -244 * xDU;
                 bottomRatio: 1 / 2;
                 bottomInset: -2880 / 19 * yDU).
    self addView: mainView.
    coachList "CPColumnarListBox"
        owner: self;
        setName: 'coachList';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 7 / 120;
                 leftInset: 0 * xDU;
                 topRatio: 84 / 641;
                 topInset: 0 * yDU;
                 rightRatio: 113 / 120;
                 rightInset: 0 * xDU;
                 bottomRatio: 496 / 641;
                 bottomInset: 0 * yDU);
        startGroup;
        noTabStop;
        receiveAllWindowMessages;
        setPopupMenu: (
            Menu new
                 title: '';
                 owner: self;
                 appendItem: 'Show Games' selector: #showOriginalGamesList;
                 appendItem: 'History' selector: #showCoachHistory);
        font: SysFont;
        headerColor: (
            RGBColor red: 205 green: 220 blue: 254);
        fields: (
            OrderedCollection new
                 addLast: (
                    CPCLBField new
                         header: 'Name';
                         justification: #center;
                         selector: #name);
                 addLast: (
                    CPCLBField new
                         header: 'Wins';
                         justification: #center;
                         selector: #winCount);
                 addLast: (
                    CPCLBField new
                         header: 'Losses';
                         justification: #center;
                         selector: #lossCount);
                 addLast: (
                    CPCLBField new
                         header: 'Ties';
                         justification: #center;
                         selector: #tieCount);
                 addLast: (
                    CPCLBField new
                         header: 'Winning Percentage';
                         justification: #center;
                         selector: #winPercentage);
                 addLast: (
                    CPCLBField new
                         header: 'Wins ATS';
                         justification: #center;
                         selector: #atsWinCount);
                 addLast: (
                    CPCLBField new
                         header: 'Losses ATS';
                         justification: #center;
                         selector: #atsLossCount);
                 addLast: (
                    CPCLBField new
                         header: 'Ties ATS';
                         justification: #center;
                         selector: #atsTieCount);
                 addLast: (
                    CPCLBField new
                         header: 'Winning Percentage ATS';
                         justification: #center;
                         selector: #atsWinPercentage);
                 yourself).
    mainView addSubpane: coachList.
    sortSU "Button"
        owner: self;
        setName: 'sortSU';
        when: #clicked send: #SUButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 28 * xDU;
                 topRatio: 0;
                 topInset: 288 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -66 * xDU;
                 bottomRatio: 0;
                 bottomInset: -544 / 19 * yDU);
        contents: 'Sort SU';
        startGroup;
        noTabStop;
        font: SysFont.
    mainView addSubpane: sortSU.
    sortATS "Button"
        owner: self;
        setName: 'sortATS';
        when: #clicked send: #ATSButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 102 * xDU;
                 topRatio: 0;
                 topInset: 288 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -140 * xDU;
                 bottomRatio: 0;
                 bottomInset: -544 / 19 * yDU);
        contents: 'Sort ATS';
        startGroup;
        noTabStop;
        font: SysFont.
    mainView addSubpane: sortATS.
    currentHCOnly "CheckBox"
        owner: self;
        setName: 'currentHCOnly';
        when: #checked send: #currentHCOnlyChecked to: self;
        when: #unchecked send: #currentHCOnlyChecked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 390 * xDU;
                 topRatio: 0;
                 topInset: 320 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -452 * xDU;
                 bottomRatio: 0;
                 bottomInset: -512 / 19 * yDU);
        contents: 'Current HC Only';
        startGroup;
        noTabStop;
        font: SysFont.
    mainView addSubpane: currentHCOnly.
    filterField "EnhancedEntryField"
        owner: self;
        setName: 'filterField';
        centered;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 190 * xDU;
                 topRatio: 0;
                 topInset: 320 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -292 * xDU;
                 bottomRatio: 0;
                 bottomInset: -544 / 19 * yDU);
        startGroup;
        noTabStop;
        font: SysFont;
        centered.
    mainView addSubpane: filterField.
    searchCoach "EntryField"
        owner: self;
        setName: 'searchCoach';
        when: #textChanged: send: #searchCoach to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 308 * xDU;
                 topRatio: 0;
                 topInset: 320 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -378 * xDU;
                 bottomRatio: 0;
                 bottomInset: -536 / 19 * yDU);
        startGroup;
        noTabStop;
        font: SysFont.
    mainView addSubpane: searchCoach.
    self createMenus: mainView! !



!NFLHeadCoachUI methods !
   
currentHCOnlyChecked

	"filters coach list when the checkbox is checked"
    #CodeTrackerBlock.  "Last Modified  09:57:13 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self applyCurrentFilters.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !

database

	"creates fresh, empty NFLDatabase object (avoids overwriting and each window/session can work with separate data)"
    #CodeTrackerBlock.  "Last Modified  10:55:26 07/07/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    database isNil
        ifTrue:[database := NFLDatabase new].
    ^database! !



!NFLHeadCoachUI methods !

database: aValue
    #CodeTrackerBlock.  "Last Modified  10:39:10 07/03/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    database := aValue! !



!NFLHeadCoachUI methods !
 
displayedCoachStatsList

		"getter"
    #CodeTrackerBlock.  "Last Modified  09:34:06 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^displayedCoachStatsList! !



!NFLHeadCoachUI methods !

displayedCoachStatsList: aCollection 

		  "holds the list of coach stats currently displayed in the UI.
When you use filters (like Current HC Only), this variable holds only the filtered list.
When you sort, you sort this variable.
When you want to restore the full list, you reset this variable to the original full list."
    #CodeTrackerBlock.  "Last Modified  11:17:42 07/03/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    displayedCoachStatsList := aCollection! !



!NFLHeadCoachUI methods !

filterAllGames

	 "Callback for the menu item titled 'All Games'.
	  (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:50:19 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | true].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'All Games'.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !
   
filterConferenceChampionship

	"Callback for the menu item titled 'Conference Championship'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:50:45 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | game isConferenceChampionship].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'Conference Championship'.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !
  
filterDivision

	"Callback for the menu item titled 'Division'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:51:24 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | game isDivisionPlayoff].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'Division'.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !
 
filteredCoachStatsListFor: aBlock 

	"returns each coach's stats using only games that pass aBlock."
    #CodeTrackerBlock.  "Last Modified  10:51:35 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self coachStatsList collect: [:stats |
        | filteredGames newCoach|filteredGames := stats games select: aBlock.
        newCoach := NFLHeadCoach new.
        newCoach name: stats name.
        newCoach games: filteredGames.
        newCoach]) select: [:stats | stats games notEmpty].! !



!NFLHeadCoachUI methods !

filterFirstGameOfSeason

	"Callback for the menu item titled 'First Game of Season'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:52:18 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | game isFirstGameOfSeason].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'First Game of Season'.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !
  
filterPlayoff

	"Callback for the menu item titled 'Playoff'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:52:46 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | game isPlayoff].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'Playoff'.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !

filterRegularSeason

	"Callback for the menu item titled 'Regular Season'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:53:16 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | game isRegularSeason].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'Regular Season'.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !
  
filterSuperBowl

	"Callback for the menu item titled 'Super Bowl'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:53:42 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | game isSuperbowl].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'Super Bowl'.
    self updateCoachListDisplay.! !



!NFLHeadCoachUI methods !
  
filterWildCard

	"Callback for the menu item titled 'Wild Card'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  09:55:04 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:game | game isWildCard].
    self applyCurrentFilters.
    (self paneNamed: 'filterField') contents: 'Wild Card'.
    self updateCoachListDisplay! !



!NFLHeadCoachUI methods !
   
initWindow

	"initialize coach UI"
    #CodeTrackerBlock.  "Last Modified  11:32:27 07/07/25"
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
    self populateCoachList.
    self updateCoachListDisplay.
    self currentHCOnlyChecked.! !



!NFLHeadCoachUI methods !
 
latestFilterBlock
    #CodeTrackerBlock.  "Last Modified  09:46:54 07/07/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^latestFilterBlock! !



!NFLHeadCoachUI methods !

latestFilterBlock: aValue
    #CodeTrackerBlock.  "Last Modified  09:46:54 07/07/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := aValue! !



!NFLHeadCoachUI methods !
   
populateCoachList

	"populate the list box with stats"
    #CodeTrackerBlock.  "Last Modified  10:53:24 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coachStatsList := self database coachStatsFromGames: (self database allGames).
    (self paneNamed: 'coachList') contents: coachStatsList.! !



!NFLHeadCoachUI methods !
  
searchCoach

	"checks string for coach name first/last"
    | inputText filtered |
    #CodeTrackerBlock.  "Last Modified  11:20:57 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    inputText := (self paneNamed: 'searchCoach') value.
    filtered := self coachStatsList select: [:coach |
        ((coach name asLowercase) indexOfString: (inputText asLowercase)) > 0].
    self displayedCoachStatsList: filtered.
    (self paneNamed: 'coachList') contents: filtered.! !



!NFLHeadCoachUI methods !
 
showCoachHistory

	"Callback for the menu item titled 'History'.
	 (Generated by WindowBuilder)"
    #CodeTrackerBlock.  "Last Modified  16:01:27 07/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ! !



!NFLHeadCoachUI methods !
  
showOriginalGamesList

	"allows an instance of the NFLUI to be opened when selected a coach"
    | selectedCoach |
    #CodeTrackerBlock.  "Last Modified  13:26:28 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedCoach := (self paneNamed: 'coachList') selectedItem.
    Transcript
        show: 'Selected: ' , selectedCoach class name;
        cr.
    NFLUI openOn: selectedCoach games.! !



!NFLHeadCoachUI methods !
   
sortByATSPercentage

	"Sort the coach stats list by ATS win percentage (descending) and update the UI."
    #CodeTrackerBlock.  "Last Modified  09:37:12 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "Sort by ATS win percentage descending, then ATS win count descending."
    displayedCoachStatsList := displayedCoachStatsList asSortedCollection: [:a :b |
        (a atsWinPercentage = b atsWinPercentage)
            ifTrue:[a atsWinCount > b atsWinCount]
            ifFalse:[a atsWinPercentage > b atsWinPercentage]].
    (self paneNamed: 'coachList') contents: displayedCoachStatsList.! !



!NFLHeadCoachUI methods !
  
sortBySUPercentage

	"Sort the coach stats list by straight up win percentage (descending) and update the UI."
    #CodeTrackerBlock.  "Last Modified  09:37:33 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "Sort by win percentage descending, then win count descending."
    displayedCoachStatsList := displayedCoachStatsList asSortedCollection: [:a :b |
        (a winPercentage = b winPercentage)
            ifTrue:[a winCount > b winCount]
            ifFalse:[a winPercentage > b winPercentage]].
    (self paneNamed: 'coachList') contents: displayedCoachStatsList.! !



!NFLHeadCoachUI methods !
 
SUButtonClicked

		"calls sorting method when the button is clicked"
    #CodeTrackerBlock.  "Last Modified  09:44:32 07/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self sortBySUPercentage.! !



!NFLHeadCoachUI methods !
   
updateCoachListDisplay

	"Reload the UI list after sorting."
    #CodeTrackerBlock.  "Last Modified  12:26:14 07/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (self paneNamed: 'coachList') contents: displayedCoachStatsList.! !



!NFLHeadCoachUI methods !
   
views
    #CodeTrackerBlock.  "Last Modified  09:39:16 07/03/25"
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



!NFLHeadCoachUI methods !

views: aValue
    #CodeTrackerBlock.  "Last Modified  09:39:16 07/03/25"
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



!NFLTeamInGame class methods !
  
fromFields: teamFields game: aGame 

	"takes the slices from NFLGame for the visitor and home fields to get fully initialized team objects"
    | team |
    #CodeTrackerBlock.  "Last Modified  11:54:23 07/02/25"
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
    team game: aGame.
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

conference

	"extract just rhe conference from conferenceDivision varibale (first char)"
    #CodeTrackerBlock.  "Last Modified  10:16:22 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self conferenceDivision isNil
        ifTrue:['']
        ifFalse:[self conferenceDivision first asString]! !



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
  
division

	"extract just the division from conferenceDivision varibale (second char)"
    #CodeTrackerBlock.  "Last Modified  14:56:15 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self conferenceDivision isNil
        ifTrue:['']
        ifFalse:[self conferenceDivision two asString]! !



!NFLTeamInGame methods !

game
    #CodeTrackerBlock.  "Last Modified  11:51:30 07/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^game! !



!NFLTeamInGame methods !
   
game: aValue
    #CodeTrackerBlock.  "Last Modified  11:51:30 07/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    game := aValue! !



!NFLTeamInGame methods !
  
isAway

	"checks if this particular team-in-game is the away team = away game"
    #CodeTrackerBlock.  "Last Modified  10:32:07 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self = self game visitorTeam! !



!NFLTeamInGame methods !
 
isHome

	"checks if this particular team-in-game is the home team = home game"
    #CodeTrackerBlock.  "Last Modified  10:32:27 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self = self game homeTeam! !



!NFLTeamInGame methods !

isOutsideConference

		"checks current team against opponent to see if they are NOT in the same conference"
    #CodeTrackerBlock.  "Last Modified  09:38:07 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self conference ~= self opponent conference.! !



!NFLTeamInGame methods !

isOutsideDivision

		"checks current team against opponent to see if they are NOT in the same division"
    #CodeTrackerBlock.  "Last Modified  09:43:08 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self division ~= self opponent division.! !



!NFLTeamInGame methods !

isWithinConference

		"checks that the current and opponenet team are in the same conference"
    #CodeTrackerBlock.  "Last Modified  09:35:49 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self conference = self opponent conference.! !



!NFLTeamInGame methods !
   
isWithinDivision

		"ensures both currrent and opponent team are in the same division"
    #CodeTrackerBlock.  "Last Modified  09:42:21 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self division = self opponent division.! !



!NFLTeamInGame methods !
  
lost

		"checks winningTeam is not itself or nil to return the losing team"
    #CodeTrackerBlock.  "Last Modified  13:17:27 07/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self game winningTeam notNil and: [self game winningTeam ~= self]! !



!NFLTeamInGame methods !
   
opponent

		"stores the opponent"
    #CodeTrackerBlock.  "Last Modified  15:40:45 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self = game homeTeam)
        ifTrue:[self game visitorTeam]
        ifFalse:[self game homeTeam]! !



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
  
printOn: aStream 

		"prints out the summary of the game, along with extra features such as the week # and season"
    | summaryExtra |
    #CodeTrackerBlock.  "Last Modified  14:49:24 07/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    summaryExtra := self game summary , ', W' , (self game week asString) , ', ' , (
        self game season asString).
    aStream nextPutAll: self teamName , ' (' , summaryExtra , ')'.! !



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
 
tied

		"checks that winningTeam is nil to return that the game was as tie"
    #CodeTrackerBlock.  "Last Modified  13:18:38 07/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self game winningTeam isNil.! !



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



!NFLTeamInGame methods !
 
won

		"calls winningTeam from NFLGame to associate that the team won"
    #CodeTrackerBlock.  "Last Modified  12:55:09 07/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self game winningTeam = self.! !



!NFLTeamSeason class methods !
  
allSeasonsFromGames: teamInGames 

	 "Given a collection of NFLTeamInGame objects, return a collection of NFLTeamSeason objects for every unique team/season pair."
    | groupedTeams teamSeasons groupedByTeamName |
    #CodeTrackerBlock.  "Last Modified  10:56:10 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "For every NFLTeamInGame (tig): b a key as an array: [teamName, season]. Store all games for that team/season in an OrderedCollection in the dictionary under that key."
    groupedTeams := Dictionary new.
    teamInGames do: [:tig |
        | key list|key := Array with: tig teamName with: tig game season.
        list := groupedTeams at: key ifAbsentPut: [OrderedCollection new].
        list add: tig].
    teamSeasons := OrderedCollection new.
    groupedTeams keysDo: [:key |
        | tigs seasonObj firstTIG|tigs := groupedTeams at: key. "get all NFLTeamInGame objects (tigs)"
        firstTIG := (tigs asSortedCollection: [:a :b | a game date < b game date]) first.
        seasonObj := self new. "creat new NFLTeamSeason object and set its properties"
        seasonObj
            teamName: firstTIG teamName;
            season: firstTIG game season;
            games: tigs.
        teamSeasons add: seasonObj.]. "add season object to the resulting OC"

	"group all NFLTeamSeason objects by exact teamName"
    groupedByTeamName := Dictionary new.
    teamSeasons do: [:seasonObj |
        (groupedByTeamName at: seasonObj teamName ifAbsentPut: [OrderedCollection new]) add: seasonObj.].

	"Link the seasons for each exact team by setting nextSeason"

	"For each seasonList (seasons for a team): sorts by season, set each season's (except the last) nextSeason variable to point to the following season"
    groupedByTeamName valuesDo: [:seasonList |
        | sorted|sorted := seasonList asSortedCollection: [:a :b | a season < b season]. "order the seasons chronologically to check proper order of head coach's"
        1 to: (sorted size - 1) do: [:i | (sorted at: i) nextSeason: (sorted at: i + 1).].].
    ^teamSeasons! !



!NFLTeamSeason class methods !
 
fromTeamInGames: teamInGames teamName: aTeamName season: aSeason 

	"Build and return a new NFLTeamSeason summary for a team/season from its NFLTeamInGame objects."
    | summary firstTIG |
    #CodeTrackerBlock.  "Last Modified  11:00:23 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    summary := self new.
    summary teamName: aTeamName.
    summary season: aSeason.
    summary games: teamInGames.
    teamInGames isEmpty
        ifFalse:[
            firstTIG := (teamInGames asSortedCollection: [:a :b | a game date < b game date]) first.
            summary headCoach: firstTIG coach.
            summary conferenceDivision: firstTIG conferenceDivision].
    ^summary! !



!NFLTeamSeason class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  13:54:06 07/07/25"
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



!NFLTeamSeason methods !
   
allGamesNotInDivision

		"games not in division"
    #CodeTrackerBlock.  "Last Modified  14:39:09 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self regularSeasonGames select: [:gT | gT game isSameDivision not]! !



!NFLTeamSeason methods !
 
awayRecord

	"counts wins-loss-ties for away games (only displays ties if they exist [ties>0])"
    #CodeTrackerBlock.  "Last Modified  10:25:33 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self recordStringForGames: self gamesAway! !



!NFLTeamSeason methods !
   
conference

		"gets conference division for a team"
    #CodeTrackerBlock.  "Last Modified  10:01:05 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games first conference! !



!NFLTeamSeason methods !
  
conferenceDivision

		"gets conference division for a team"
    #CodeTrackerBlock.  "Last Modified  09:58:57 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games first conferenceDivision.! !



!NFLTeamSeason methods !
 
confRecord

	"counts wins-loss-ties within the conference (only displays ties if they exist [ties>0])"
    #CodeTrackerBlock.  "Last Modified  09:45:58 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self recordStringForGames: self gamesInConference! !



!NFLTeamSeason methods !

diffGRecord

		  "point differential per game (Diff/g) [scored - allowed]"
    | gameCount |
    #CodeTrackerBlock.  "Last Modified  23:12:01 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    gameCount := self games size.
    gameCount = 0
        ifTrue:[^0].
    ^((self pointDifferential asFloat / gameCount) roundTo: 0.001)! !



!NFLTeamSeason methods !
 
displayCoachName

	"displays coaches name depending on results from wasCoachFiredBeforeSeasonEnd method or wasCoacFiredAfterSeason method"
    | coachName gamesMissed |
    #CodeTrackerBlock.  "Last Modified  11:53:10 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coachName := self seasonHeadCoach.
    self wasCoachFiredBeforeSeasonEnd
        ifTrue:[
            gamesMissed := self gamesMissedByHeadCoach: coachName.
            ^coachName , ' (-' , gamesMissed printString , ')'].
    self wasCoachFiredAfterSeason
        ifTrue:[^'*' , coachName].
    ^coachName! !



!NFLTeamSeason methods !
   
division

		"gets conference division for a team"
    #CodeTrackerBlock.  "Last Modified  10:01:25 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games first division.! !



!NFLTeamSeason methods !
 
divRecord

	 "win-loss-ties record on games played within the division"
    #CodeTrackerBlock.  "Last Modified  09:50:12 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self recordStringForGames: self gamesInDivision! !



!NFLTeamSeason methods !
 
games
    #CodeTrackerBlock.  "Last Modified  14:06:22 07/07/25"
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



!NFLTeamSeason methods !
 
games: aValue
    #CodeTrackerBlock.  "Last Modified  14:06:22 07/07/25"
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



!NFLTeamSeason methods !

gamesAway

		"helper method to get away games from TeamInGame class"
    #CodeTrackerBlock.  "Last Modified  10:24:53 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self regularSeasonGames select: [:tig | tig isAway]! !



!NFLTeamSeason methods !

gamesHome

		"helper method to get home games from TeamInGame class"
    #CodeTrackerBlock.  "Last Modified  10:25:07 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self regularSeasonGames select: [:tig | tig isHome]! !



!NFLTeamSeason methods !

gamesInConference

		"helper method to get games in conference from TeamInGame class"
    #CodeTrackerBlock.  "Last Modified  09:45:13 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self regularSeasonGames select: [:tig | tig isWithinConference]! !



!NFLTeamSeason methods !
   
gamesInDivision

		"helper method to get games in division from TeamInGame class"
    #CodeTrackerBlock.  "Last Modified  09:47:47 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self regularSeasonGames select: [:tig | tig isWithinDivision]! !



!NFLTeamSeason methods !
 
gamesMissedByHeadCoach: coachName 

"number of games the head coach missed at the end of thir career"
    | coachGames totalGames |
    #CodeTrackerBlock.  "Last Modified  00:21:26 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    coachGames := self games select: [:tig | tig coach = coachName].
    totalGames := self games size.
    ^totalGames - coachGames size! !



!NFLTeamSeason methods !
 
homeRecord

	 "counts wins-loss-ties for home games (only displays ties if they exist [ties>0])"
    #CodeTrackerBlock.  "Last Modified  10:25:49 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self recordStringForGames: self gamesHome! !



!NFLTeamSeason methods !
  
icRecord

		"counts wins-loss-ties played against teams in the other conference (only displays ties if they exist [ties>0])"
    | icGames |
    #CodeTrackerBlock.  "Last Modified  10:10:33 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    icGames := self games select: [:tig |
        | opp|opp := tig game homeTeam = tig
            ifTrue:[tig game visitorTeam]
            ifFalse:[tig game homeTeam].
        opp conference ~= self conference].
    ^self recordStringForGames: icGames.! !



!NFLTeamSeason methods !

lastGameHeadCoach

"head coach for the last game of the season"
    #CodeTrackerBlock.  "Last Modified  00:24:14 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self games isEmpty
        ifTrue:[nil]
        ifFalse:[self games last coach]! !



!NFLTeamSeason methods !
   
lastGameOfSeason

				"if the team did not make playoffs, then we check the last game within ou regularSeasonGames collection. Otherwise, we call lastPlayoffGame that gets our last playoff game."
    #CodeTrackerBlock.  "Last Modified  16:27:07 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (self playoffGames isNil or: [self playoffGames isEmpty])
        ifTrue:[
            (self regularSeasonGames isNil or: [self regularSeasonGames isEmpty])
                ifTrue:[^nil]
                ifFalse:[^self regularSeasonGames last]].
    ^self lastPlayoffGame! !



!NFLTeamSeason methods !
  
lastPlayoffGame

"calls playoffGames method to see if it empty, which means that team missed playoffs. otherwise, the last playoff game
from the selection is what we want to analyze to see if a team won/lost any playoff type."
    #CodeTrackerBlock.  "Last Modified  14:59:35 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self playoffGames isEmpty
        ifTrue:[nil]
        ifFalse:[self playoffGames last].! !



!NFLTeamSeason methods !
  
losses

	"counts the losses for a team in a season"
    #CodeTrackerBlock.  "Last Modified  23:43:56 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self regularSeasonGames select: [:tig | tig lost]) size! !



!NFLTeamSeason methods !

lossesNotInDivision

		"losses not in division"
    #CodeTrackerBlock.  "Last Modified  14:28:08 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self allGamesNotInDivision select: [:gT | gT lost]) size! !



!NFLTeamSeason methods !
   
lostConferenceChampionship

"True if the last playoff game was a Conference Championship and was lost."
    | lastGame |
    #CodeTrackerBlock.  "Last Modified  09:34:33 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    lastGame := self lastPlayoffGame.
    lastGame isNil
        ifTrue:[^false].
    ^lastGame game isConferenceChampionship and: [lastGame lost]! !



!NFLTeamSeason methods !
  
lostDiv

	"True if the last playoff game was a Divisional round and was lost."
    | lastGame |
    #CodeTrackerBlock.  "Last Modified  09:33:58 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    lastGame := self lastPlayoffGame.
    lastGame isNil
        ifTrue:[^false].
    ^lastGame game isDivisionPlayoff and: [lastGame lost]! !



!NFLTeamSeason methods !
  
lostSuperBowl

"True if the last playoff game was a Super Bowl and was lost."
    | lastGame |
    #CodeTrackerBlock.  "Last Modified  09:31:55 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    lastGame := self lastPlayoffGame.
    lastGame isNil
        ifTrue:[^false].
    ^lastGame game isSuperbowl and: [lastGame lost]! !



!NFLTeamSeason methods !
 
lostWC

	 "True if the last playoff game was a Wild Card round and was lost."
    | lastGame |
    #CodeTrackerBlock.  "Last Modified  09:34:48 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    lastGame := self lastPlayoffGame.
    lastGame isNil
        ifTrue:[^false].
    ^lastGame game isWildCard and: [lastGame lost]! !



!NFLTeamSeason methods !
  
madePlayoffs

		"team made playoffs in season"
    #CodeTrackerBlock.  "Last Modified  13:32:19 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self playoffGames isEmpty) not! !



!NFLTeamSeason methods !
  
missedPlayoffs

	"checks that the playoffGames collection is empty = team did not make it to playoffs"
    #CodeTrackerBlock.  "Last Modified  23:51:46 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self playoffGames isEmpty.! !



!NFLTeamSeason methods !
   
myTeamInGame: aGame 

"helper method: given a game, return my NFLTeamInGame"
    #CodeTrackerBlock.  "Last Modified  09:21:04 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(aGame homeTeam teamName = self teamName)
        ifTrue:[aGame homeTeam]
        ifFalse:[aGame visitorTeam]! !



!NFLTeamSeason methods !

nextSeason
    #CodeTrackerBlock.  "Last Modified  09:33:41 07/09/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^nextSeason! !



!NFLTeamSeason methods !
   
nextSeason: aValue
    #CodeTrackerBlock.  "Last Modified  09:33:41 07/09/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    nextSeason := aValue! !



!NFLTeamSeason methods !
  
nextSeasonHeadCoach

"Returns the head coach for the first game of the next season"
    #CodeTrackerBlock.  "Last Modified  10:49:29 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self nextSeason isNil
        ifTrue:[nil]
        ifFalse:[self nextSeason seasonHeadCoach]! !



!NFLTeamSeason methods !
  
nonDivisionPaRecord

	"total points allowed (PA) to opponent team when against opponent outsde their division"
    #CodeTrackerBlock.  "Last Modified  09:57:19 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self allGamesNotInDivision inject: 0 into: [:total :tig | total + tig opponent totalPoints].! !



!NFLTeamSeason methods !
 
nonDivisionPfRecord

	 "total points scored (PF) current team when against teams in a different division"
    #CodeTrackerBlock.  "Last Modified  09:57:47 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self allGamesNotInDivision inject: 0 into: [:total :tig | total + tig totalPoints].! !



!NFLTeamSeason methods !
   
opponentTeamInGame: aGame 

"helper method: given a game, return oppenent's NFLTeamInGame"
    #CodeTrackerBlock.  "Last Modified  09:22:10 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(aGame homeTeam teamName = self teamName)
        ifTrue:[aGame visitorTeam]
        ifFalse:[aGame homeTeam]! !



!NFLTeamSeason methods !
  
PAgRecord

		"points allowed per game (PA/g)"
    | gameCount |
    #CodeTrackerBlock.  "Last Modified  23:24:01 07/13/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    gameCount := self games size.
    gameCount = 0
        ifTrue:[^0].
    ^((self nonDivisionPaRecord asFloat / gameCount) roundTo: 0.001)! !



!NFLTeamSeason methods !

PFgRecord

		"points for per game (PF/g)"
    | gameCount |
    #CodeTrackerBlock.  "Last Modified  23:23:06 07/13/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    gameCount := self games size.
    gameCount = 0
        ifTrue:[^0].
    ^((self nonDivisionPfRecord asFloat / gameCount) roundTo: 0.001)! !



!NFLTeamSeason methods !

playoffGames

		"selects all games that are playoffs for simple season result filtering"
    #CodeTrackerBlock.  "Last Modified  23:59:53 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games select: [:tig | tig game isPlayoff]! !



!NFLTeamSeason methods !
  
pointDifferential

" diff "
    #CodeTrackerBlock.  "Last Modified  15:33:51 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self pointsFor - self pointsAllowed)! !



!NFLTeamSeason methods !
   
pointsAllowed

		"total points allowed (PA) opponent team (that is within their division)"
    #CodeTrackerBlock.  "Last Modified  10:14:48 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self regularSeasonGames inject: 0 into: [:total :tig | total + tig opponent totalPoints]! !



!NFLTeamSeason methods !
 
pointsFor

	"total points scored (PF) current team (that is within their division"
    #CodeTrackerBlock.  "Last Modified  10:14:07 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self regularSeasonGames inject: 0 into: [:total :tig | total + tig totalPoints]! !



!NFLTeamSeason methods !
  
recordStringForGames: gamesCollection 

		"gets wins-losses-ties for any collection of games"
    | wins losses ties recordString |
    #CodeTrackerBlock.  "Last Modified  10:06:50 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    wins := (gamesCollection select: [:tig | tig won]) size.
    losses := (gamesCollection select: [:tig | tig lost]) size.
    ties := (gamesCollection select: [:tig | tig tied]) size.
    recordString := wins asString , '-' , losses asString.
    ties > 0
        ifTrue:[recordString := recordString , '-' , ties asString].
    ^recordString! !



!NFLTeamSeason methods !
 
regularSeasonGames

"helper method to return regular season games only from isRegularSeason (NFLGame)"
    #CodeTrackerBlock.  "Last Modified  23:43:00 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^games select: [:tig | tig game isRegularSeason]! !



!NFLTeamSeason methods !
  
season
    #CodeTrackerBlock.  "Last Modified  14:06:22 07/07/25"
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



!NFLTeamSeason methods !
   
season: aValue
    #CodeTrackerBlock.  "Last Modified  14:06:22 07/07/25"
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



!NFLTeamSeason methods !
  
seasonHeadCoach

"Returns the starting head coach for the season"
    #CodeTrackerBlock.  "Last Modified  00:18:41 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self games isEmpty
        ifTrue:[nil]
        ifFalse:[self games first coach]! !



!NFLTeamSeason methods !

seasonResult

		"calls each method to see what is true to return the string associate with the season result"
    #CodeTrackerBlock.  "Last Modified  15:15:41 07/07/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self wonSuperBowl
        ifTrue:[^'Won Super Bowl'].
    self lostSuperBowl
        ifTrue:[^'Lost Super Bowl'].
    self lostConferenceChampionship
        ifTrue:[^'Lost Conference Ch.'].
    self lostDiv
        ifTrue:[^'Lost Div. Round'].
    self lostWC
        ifTrue:[^'Lost in WC Round'].
    self missedPlayoffs
        ifTrue:[^'Missed Playoffs'].! !



!NFLTeamSeason methods !
 
seasonResultColor

		"colors text based on season result"
    | result |
    #CodeTrackerBlock.  "Last Modified  10:23:20 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    result := self seasonResult.
    result = 'Won Super Bowl'
        ifTrue:[^Color darkGreen].
    result = 'Lost Super Bowl'
        ifTrue:[^Color red].
    result = 'Lost Conference Ch.'
        ifTrue:[^Color blue].
    result = 'Lost Div. Round'
        ifTrue:[^Color blue].
    result = 'Lost in WC Round'
        ifTrue:[^Color black].
    result = 'Missed Playoffs'
        ifTrue:[^Color darkGray].! !



!NFLTeamSeason methods !

strengthPoints

		"assigns each result to a score"
    #CodeTrackerBlock.  "Last Modified  22:48:42 07/13/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self wonSuperBowl
        ifTrue:[^5].
    self lostSuperBowl
        ifTrue:[^4].
    self lostConferenceChampionship
        ifTrue:[^3].
    self lostDiv
        ifTrue:[^2].
    self lostWC
        ifTrue:[^1].
    self missedPlayoffs
        ifTrue:[^0].
    ^0.! !



!NFLTeamSeason methods !
   
teamName
    #CodeTrackerBlock.  "Last Modified  14:17:18 07/07/25"
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



!NFLTeamSeason methods !
   
teamName: aValue
    #CodeTrackerBlock.  "Last Modified  14:17:18 07/07/25"
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



!NFLTeamSeason methods !
  
ties

	"counts the ties for a team in a season"
    #CodeTrackerBlock.  "Last Modified  23:43:28 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self regularSeasonGames select: [:tig | tig tied]) size! !



!NFLTeamSeason methods !

tiesNotInDivision

		"ties not in division"
    #CodeTrackerBlock.  "Last Modified  14:27:47 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self allGamesNotInDivision select: [:gT | gT tied]) size! !



!NFLTeamSeason methods !
   
uniqueGames

	"Return all unique NFLGame objects for this team and season, in chronological order."
    #CodeTrackerBlock.  "Last Modified  13:58:56 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self games collect: [:aTeamInGame | aTeamInGame game]) asSet asOrderedCollection.! !



!NFLTeamSeason methods !
  
wasCoachFiredAfterSeason

	 "Returns true if the starting head coach finished the season but is not the coach next season."

	 "only returns true if there is a next season for this team and the next season's head coach is different"
    | nextCoach currentCoaches |
    #CodeTrackerBlock.  "Last Modified  12:12:59 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    nextCoach := self nextSeasonHeadCoach.
    nextCoach isNil
        ifTrue:[

				"No next season: check if coach is still a head coach in the league"
            currentCoaches := NFLDatabase new allCurrentHeadCoaches.
            ^(currentCoaches includes: self seasonHeadCoach) not.]
        ifFalse:[

				"There is a next season: check if the team's coach changed"
    ^self seasonHeadCoach ~= nextCoach].! !



!NFLTeamSeason methods !
 
wasCoachFiredBeforeSeasonEnd

	"Returns true if the starting head coach did not finish the season."
    #CodeTrackerBlock.  "Last Modified  16:00:47 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self seasonHeadCoach ~= self lastGameHeadCoach! !



!NFLTeamSeason methods !
  
winningPercentage

		"calc winning % for a team's season"
    | total |
    #CodeTrackerBlock.  "Last Modified  23:07:44 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #CodeTrackerBlock. "Last Modified	14:47:44 07/07/25"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    total := self games size.
    total = 0
        ifTrue:[^0].
    ^((self wins asFloat / total) * 100) roundTo: 0.001! !



!NFLTeamSeason methods !
   
wins

	"counts the wins for a team in a season"
    #CodeTrackerBlock.  "Last Modified  14:03:39 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "tig --> teamInGame"
    ^(self regularSeasonGames select: [:game | game won]) size.! !



!NFLTeamSeason methods !

winsNotInDivision

		"wins not in division"
    #CodeTrackerBlock.  "Last Modified  14:27:16 07/10/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self allGamesNotInDivision select: [:gT | gT won]) size! !



!NFLTeamSeason methods !

wonSuperBowl

"True if the last playoff game was a Super Bowl and was won."
    | lastGame |
    #CodeTrackerBlock.  "Last Modified  09:30:09 07/14/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    lastGame := self lastPlayoffGame.
    lastGame isNil
        ifTrue:[^false].
    ^lastGame game isSuperbowl and: [lastGame won]! !



!NFLTeamSeasonsUI class methods !
   
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  12:44:00 07/07/25"
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



!NFLTeamSeasonsUI class methods !
  
openOn: aTeamSeason 

		"openOn"
    | inst |
    #CodeTrackerBlock.  "Last Modified  23:14:18 07/13/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    inst := self new.
    inst teamSeasonToShowOnOpen: aTeamSeason.
    inst open.
    ^inst.! !



!NFLTeamSeasonsUI class methods !
 
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  10:44:14 07/14/25"
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



!NFLTeamSeasonsUI methods !

allTeamSeasons

	"returning ordered collection of all NFLTeamSeason objects to display/filter"
    #CodeTrackerBlock.  "Last Modified  11:50:25 07/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^allTeamSeasons ifNil: [allTeamSeasons := OrderedCollection new].! !



!NFLTeamSeasonsUI methods !

allTeamSeasons: aCollection 

		  "holds collection of all NFLTeamSeason objects to be filtered/displayed"
    #CodeTrackerBlock.  "Last Modified  11:01:36 07/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    allTeamSeasons := aCollection.! !



!NFLTeamSeasonsUI methods !
   
applyCurrentFilters

	"updates the team seasons grid to whatever the filter is set to"
    #CodeTrackerBlock.  "Last Modified  11:53:59 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    filteredTeamSeasons := self allTeamSeasons select: latestFilterBlock.! !



!NFLTeamSeasonsUI methods !
  
createMenus: aPane 

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    #CodeTrackerBlock.  "Last Modified  10:44:14 07/14/25"
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
                 title: 'Season Result';
                 owner: self;
                 appendItem: 'Won Super Bowl' selector: #filterWonSuperBowl;
                 appendItem: 'Lost Super Bowl' selector: #filterLostSuperBowl;
                 appendItem: 'Lost Conference Ch.' selector: #filterLostConferenceChampionship;
                 appendItem: 'Lost in Div. Round' selector: #filterLostDiv;
                 appendItem: 'Lost in WC Round' selector: #filterLostWC;
                 appendItem: 'Missed Playoffs' selector: #filterMissedPlayoffs;
                 appendItem: 'All Teams' selector: #filterAllTeams)! !



!NFLTeamSeasonsUI methods !
 
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | mainView segoeUI8 teamSeasonsList xDU yDU |
    #CodeTrackerBlock.  "Last Modified  10:44:14 07/14/25"
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
    teamSeasonsList := CPColumnarListBox new.

		"Font Definitions"
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    mainView
        owner: self;
        setName: 'mainView';
        when: #maximized send: #winMaximized to: mainView;
        when: #minimized send: #winMinimized to: mainView;
        when: #restored send: #winRestored to: mainView;
        labelWithoutPrefix: 'Team''s Record in Every Season';
        noSmalltalkMenuBar;
        backColor: Color buttonFace;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -322 * xDU;
                 topRatio: 1 / 2;
                 topInset: -3104 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -322 * xDU;
                 bottomRatio: 1 / 2;
                 bottomInset: -3104 / 19 * yDU).
    self addView: mainView.
    teamSeasonsList "CPColumnarListBox"
        owner: self;
        setName: 'teamSeasonsList';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 14 * xDU;
                 topRatio: 0;
                 topInset: 256 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -616 * xDU;
                 bottomRatio: 0;
                 bottomInset: -5216 / 19 * yDU);
        startGroup;
        noTabStop;
        receiveAllWindowMessages;
        setPopupMenu: (
            Menu new
                 title: '';
                 owner: self;
                 appendItem: 'Show Franchise' selector: #showFranchiseList;
                 appendItem: 'Show Season' selector: #showOriginalGamesList);
        font: segoeUI8;
        canSort: true;
        colorMethod: #seasonResultColor;
        fields: (
            OrderedCollection new
                 addLast: (
                    CPCLBField new
                         header: 'Name';
                         selector: #teamName);
                 addLast: (
                    CPCLBField new
                         header: 'Season';
                         justification: #center;
                         selector: #season);
                 addLast: (
                    CPCLBField new
                         header: 'Wins';
                         justification: #center;
                         selector: #wins);
                 addLast: (
                    CPCLBField new
                         header: 'Losses';
                         justification: #center;
                         selector: #losses);
                 addLast: (
                    CPCLBField new
                         header: 'Ties';
                         justification: #center;
                         selector: #ties);
                 addLast: (
                    CPCLBField new
                         header: 'Winning %';
                         justification: #center;
                         selector: #winningPercentage);
                 addLast: (
                    CPCLBField new
                         header: 'Result';
                         selector: #seasonResult);
                 addLast: (
                    CPCLBField new
                         header: 'Head Coach';
                         selector: #displayCoachName);
                 addLast: (
                    CPCLBField new
                         header: 'Conference/Division';
                         selector: #conferenceDivision);
                 addLast: (
                    CPCLBField new
                         header: 'Home';
                         justification: #center;
                         selector: #homeRecord);
                 addLast: (
                    CPCLBField new
                         header: 'Away';
                         justification: #center;
                         selector: #awayRecord);
                 addLast: (
                    CPCLBField new
                         header: 'Div';
                         justification: #center;
                         selector: #divRecord);
                 addLast: (
                    CPCLBField new
                         header: 'Conf';
                         justification: #center;
                         selector: #confRecord);
                 addLast: (
                    CPCLBField new
                         header: 'IC';
                         justification: #center;
                         selector: #icRecord);
                 addLast: (
                    CPCLBField new
                         header: 'PF';
                         justification: #center;
                         selector: #pointsFor);
                 addLast: (
                    CPCLBField new
                         header: 'PA';
                         justification: #center;
                         selector: #pointsAllowed);
                 addLast: (
                    CPCLBField new
                         header: 'Diff';
                         justification: #center;
                         selector: #pointDifferential);
                 addLast: (
                    CPCLBField new
                         header: 'PF/g';
                         justification: #center;
                         selector: #PFgRecord);
                 addLast: (
                    CPCLBField new
                         header: 'PA/g';
                         justification: #center;
                         selector: #PAgRecord);
                 addLast: (
                    CPCLBField new
                         header: 'Diff/g';
                         justification: #center;
                         selector: #diffGRecord);
                 yourself).
    mainView addSubpane: teamSeasonsList.
    self createMenus: mainView! !



!NFLTeamSeasonsUI methods !

filterAllTeams

	"gets all the teams and seasons"
    #CodeTrackerBlock.  "Last Modified  11:38:44 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:season | true].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.! !



!NFLTeamSeasonsUI methods !

filteredTeamSeasons
    #CodeTrackerBlock.  "Last Modified  11:23:32 07/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^filteredTeamSeasons! !



!NFLTeamSeasonsUI methods !
  
filteredTeamSeasons: aValue
    #CodeTrackerBlock.  "Last Modified  11:23:32 07/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    filteredTeamSeasons := aValue! !



!NFLTeamSeasonsUI methods !
 
filterLostConferenceChampionship

				"gets all the teams and seasons"
    #CodeTrackerBlock.  "Last Modified  11:40:12 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:season | season lostConferenceChampionship].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.! !



!NFLTeamSeasonsUI methods !
  
filterLostDiv

		  "gets all the teams and seasons"
    #CodeTrackerBlock.  "Last Modified  11:39:46 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:season | season lostDiv].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.! !



!NFLTeamSeasonsUI methods !

filterLostSuperBowl

		"gets all the teams and seasons"
    #CodeTrackerBlock.  "Last Modified  11:39:22 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:season | season lostSuperBowl].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.! !



!NFLTeamSeasonsUI methods !
  
filterLostWC

		  "gets all the teams and seasons"
    #CodeTrackerBlock.  "Last Modified  11:40:36 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:season | season lostWC].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.! !



!NFLTeamSeasonsUI methods !
  
filterMissedPlayoffs

		  "gets all the teams and seasons"
    #CodeTrackerBlock.  "Last Modified  11:41:06 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:season | season missedPlayoffs].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.! !



!NFLTeamSeasonsUI methods !
  
filterWonSuperBowl

		"gets all the teams and seasons"
    #CodeTrackerBlock.  "Last Modified  11:55:49 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := [:season | season wonSuperBowl].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.! !



!NFLTeamSeasonsUI methods !

initWindow

	"initialia team season window UI"
    #CodeTrackerBlock.  "Last Modified  23:33:54 07/13/25"
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
    self populateTeamSeasonsList.
    latestFilterBlock := [:season | true].
    self applyCurrentFilters.
    self updateTeamSeasonListDisplay.
    (self paneNamed: 'teamSeasonsList')
        backColor2: (Color white);
        foreColor: Color black.! !



!NFLTeamSeasonsUI methods !
   
latestFilterBlock
    #CodeTrackerBlock.  "Last Modified  11:23:32 07/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^latestFilterBlock! !



!NFLTeamSeasonsUI methods !
  
latestFilterBlock: aValue
    #CodeTrackerBlock.  "Last Modified  11:23:32 07/08/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latestFilterBlock := aValue! !



!NFLTeamSeasonsUI methods !
 
populateTeamSeasonsList

	"fill in the teamSeasonsList in UI"
    | teamSeasonsList |
    #CodeTrackerBlock.  "Last Modified  23:34:27 07/13/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "take all the team-in-game records stored in the database, group them into seasons for each team"
    teamSeasonsList := teamSeasonToShowOnOpen ifNil: [
        NFLTeamSeason allSeasonsFromGames: (NFLDatabase new allTeamsInGames)].
    self allTeamSeasons: teamSeasonsList.
    (self paneNamed: 'teamSeasonsList') contents: teamSeasonsList.! !



!NFLTeamSeasonsUI methods !
   
showFranchiseList

	"open the gamesList from NFLUI for the selected season"
    | selectedFranchise franchiseSeasons |
    #CodeTrackerBlock.  "Last Modified  14:20:04 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedFranchise := (self paneNamed: 'teamSeasonsList') selectedItem.
    franchiseSeasons := NFLTeamSeason allSeasonsFromGames: selectedFranchise games.
    NFLTeamSeasonsUI openOn: franchiseSeasons.! !



!NFLTeamSeasonsUI methods !
   
showOriginalGamesList

	"open the gamesList from NFLUI for the selected season"
    | selectedSeason |
    #CodeTrackerBlock.  "Last Modified  13:55:18 07/09/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedSeason := (self paneNamed: 'teamSeasonsList') selectedItem.
    NFLUI openOn: selectedSeason uniqueGames.! !



!NFLTeamSeasonsUI methods !

teamSeasonToShowOnOpen
    #CodeTrackerBlock.  "Last Modified  23:14:56 07/13/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^teamSeasonToShowOnOpen! !



!NFLTeamSeasonsUI methods !

teamSeasonToShowOnOpen: aValue
    #CodeTrackerBlock.  "Last Modified  23:14:56 07/13/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    teamSeasonToShowOnOpen := aValue! !



!NFLTeamSeasonsUI methods !
   
updateTeamSeasonListDisplay

		"updates the display depending on what the filteedTeamSeasons is set to"
    #CodeTrackerBlock.  "Last Modified  11:44:29 07/08/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (self paneNamed: 'teamSeasonsList') contents: filteredTeamSeasons.! !



!NFLTeamSeasonsUI methods !

views
    #CodeTrackerBlock.  "Last Modified  13:39:15 07/07/25"
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



!NFLTeamSeasonsUI methods !
  
views: aValue
    #CodeTrackerBlock.  "Last Modified  13:39:15 07/07/25"
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
 
openOn: aListOfGames 

		"gets called on aListOfGames to see what games we want to show on open"
    | inst |
    #CodeTrackerBlock.  "Last Modified  13:59:02 07/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    inst := self new.
    inst gamesToShowOnOpen: aListOfGames.
    inst open.
    ^inst.! !



!NFLUI class methods !

wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  14:42:14 07/03/25"
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
    #CodeTrackerBlock.  "Last Modified  14:42:14 07/03/25"
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
    #CodeTrackerBlock.  "Last Modified  14:42:14 07/03/25"
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

gamesToShowOnOpen
    #CodeTrackerBlock.  "Last Modified  14:00:21 07/03/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^gamesToShowOnOpen! !



!NFLUI methods !
 
gamesToShowOnOpen: aValue
    #CodeTrackerBlock.  "Last Modified  14:00:21 07/03/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Nfl. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    gamesToShowOnOpen := aValue! !



!NFLUI methods !

initWindow

	"initilize loading of window and checking if a game row is selected to call displayGameDetails"
    #CodeTrackerBlock.  "Last Modified  14:09:41 07/03/25"
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
    games := gamesToShowOnOpen ifNil: [db allGames].
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
    | pane allGames gamesToDisplay |
    #CodeTrackerBlock.  "Last Modified  14:23:12 07/03/25"
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
    gamesToDisplay := games notNil
        ifTrue:[games]
        ifFalse:[allGames].
    pane contents: gamesToDisplay.! !



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
    #CodeTrackerBlock.  "Last Modified  14:38:12 07/02/25"
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
    winningTeam := aGame winningTeam.
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
