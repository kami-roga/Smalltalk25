
Object subclass: #Radio
  instanceVariableNames: 
    ' frequency callSign state city dayPower nightPower criticalPower latitude longitude status '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '    !
Object subclass: #RadioDatabase
  instanceVariableNames: 
    ' stations cities '
  classVariableNames: ''
  poolDictionaries: ''    !
ViewManager subclass: #RadioUI
  instanceVariableNames: 
    ' db stations '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '  !
WindowDialog subclass: #RadioEditDialog
  instanceVariableNames: 
    ' station '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants ' !


!Radio class methods !
   
fromString: aString 

		"converts data from csv file into instances of Radio and fills in its variables (frequency, callSign, etc.) and returns the fully constructed object"
    | var aRadio |
    #CodeTrackerBlock.  "Last Modified  14:35:25 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    var := aString asArrayOfSubstringsDelimitedBy: Character tab.
    aRadio := self new.
    aRadio frequency: ((var at: 1) asInteger).
    aRadio callSign: (var at: 2).
    aRadio state: (var at: 3).
    aRadio city: (var at: 4).
    aRadio dayPower: ((var at: 5) asInteger).
    aRadio nightPower: ((var at: 6) asInteger).
    aRadio criticalPower: ((var at: 7) asInteger).
    aRadio latitude: ((var at: 8) asFloat).
    aRadio longitude: ((var at: 9) asFloat).
    aRadio status: (var at: 10 ifAbsent: ['']).
    ^aRadio.! !



!Radio class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:58:46 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!Radio methods !
 
asText

		"represents each station provided from the Radio to Radio Database"
    | ws |
    #CodeTrackerBlock.  "Last Modified  11:35:10 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ws := String new writeStream.
    ws
        nextPutAll: self frequency;
        tab;
        nextPutAll: self callSign;
        tab;
        nextPutAll: self state;
        tab;
        nextPutAll: self city;
        tab;
        nextPutAll: self dayPower;
        tab;
        nextPutAll: self nightPower;
        tab;
        nextPutAll: self criticalPower;
        tab;
        nextPutAll: self latitude;
        tab;
        nextPutAll: self longitude;
        tab;
        nextPutAll: self status.
    ^ws contents.! !



!Radio methods !
   
callSign
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^callSign! !



!Radio methods !
 
callSign: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    callSign := aValue! !



!Radio methods !

city
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^city! !



!Radio methods !
 
city: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    city := aValue! !



!Radio methods !

colorDayPower

	"changes color of station based on dayPower watts"
    | power |
    #CodeTrackerBlock.  "Last Modified  11:46:58 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    power := dayPower asInteger ifNil: [0].
    ^power = 0
        ifTrue:[Color black]
        ifFalse:[
            power >= 50000
                ifTrue:[Color red]
                ifFalse:[
                    power >= 30000
                        ifTrue:[Color darkGreen]
                        ifFalse:[
                            power >= 10000
                                ifTrue:[Color blue]
                                ifFalse:[Color black]]]].! !



!Radio methods !
 
criticalPower
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^criticalPower! !



!Radio methods !
   
criticalPower: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    criticalPower := aValue! !



!Radio methods !
  
dayPower
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^dayPower! !



!Radio methods !
 
dayPower: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    dayPower := aValue! !



!Radio methods !

disableStation

		"disables a station if dayPower is 0 or empty"
    #CodeTrackerBlock.  "Last Modified  15:31:43 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^dayPower isNil or: [dayPower asString isEmpty or: [(dayPower = 0)]].! !



!Radio methods !
 
frequency
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^frequency! !



!Radio methods !
   
frequency: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    frequency := aValue! !



!Radio methods !
  
latitude
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^latitude! !



!Radio methods !
 
latitude: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    latitude := aValue! !



!Radio methods !

longitude
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^longitude! !



!Radio methods !
   
longitude: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    longitude := aValue! !



!Radio methods !
  
nightPower
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^nightPower! !



!Radio methods !
 
nightPower: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    nightPower := aValue! !



!Radio methods !

state

		"state is an orderedcollection of the states"
    #CodeTrackerBlock.  "Last Modified  13:55:15 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^state! !



!Radio methods !

state: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    state := aValue! !



!Radio methods !
  
status
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^status! !



!Radio methods !
 
status: aValue
    #CodeTrackerBlock.  "Last Modified  12:52:21 06/17/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    status := aValue! !



!RadioDatabase class methods !
  
add: station 

"adding a radio station into the database"
    #CodeTrackerBlock.  "Last Modified  13:36:23 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self stations add: station! !



!RadioDatabase class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  11:15:38 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!RadioDatabase methods !
 
allStations

	"loading in radio stations csv"
    | fileStream station row |
    #CodeTrackerBlock.  "Last Modified  13:37:32 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fileStream := File pathNameReadOnly: 'Data/radio-copy.csv'.
    fileStream nextLine. "skip header line"
    [fileStream atEnd]
        whileFalse:[
            row := fileStream nextLine.
            station := Radio fromString: row.
            self stations add: station].
    fileStream close.
    ^stations! !



!RadioDatabase methods !
   
alphaCities

"returns all unique cities"
    #CodeTrackerBlock.  "Last Modified  11:01:43 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self stations collect: [:s | s city]) asSet asSortedCollection! !



!RadioDatabase methods !
  
alphaStates

		  "returns sorted collection of unique states (no repeats)"
    #CodeTrackerBlock.  "Last Modified  09:21:34 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self stations collect: [:station | station state]) asSet asSortedCollection! !



!RadioDatabase methods !
   
cities

		"getting list of all cities for all stations/states"
    #CodeTrackerBlock.  "Last Modified  09:54:42 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    cities ifNil: [
        cities := (self stations collect: [:station | station city]) asSet asSortedCollection.].
    ^cities! !



!RadioDatabase methods !
  
cities: aCollection 

		  "assigning the cities as a collection"
    #CodeTrackerBlock.  "Last Modified  09:54:22 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    cities := aCollection! !



!RadioDatabase methods !
 
citiesByState: aState 

	"retrieves city by their associated state"
    | filteredStations cityList |
    #CodeTrackerBlock.  "Last Modified  10:30:29 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    filteredStations := self stations select: [:station | station state = aState].
    cityList := filteredStations isEmpty
        ifTrue:[OrderedCollection new]
        ifFalse:[(filteredStations collect: [:s | s city]) asSet asSortedCollection].
    ^cityList! !



!RadioDatabase methods !
  
statesByCity: aCity 

	"returns all states in the given city"
    | statesWithCity |
    #CodeTrackerBlock.  "Last Modified  10:36:00 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    statesWithCity := (self stations select: [:station | station city = aCity]) collect: [:station |
        station state].
    ^statesWithCity asSet asSortedCollection.! !



!RadioDatabase methods !
 
stations

		"storing ALL radio stations into an ordered collection"
    #CodeTrackerBlock.  "Last Modified  09:43:38 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    stations ifNil: [stations := OrderedCollection new].
    ^stations! !



!RadioDatabase methods !

stations: aCollection 

		  "assigning stations instance variable"
    #CodeTrackerBlock.  "Last Modified  09:53:11 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    stations := aCollection! !



!RadioDatabase methods !
 
stationsInState: aState 

" returns all stations that belong to a given state"
    #CodeTrackerBlock.  "Last Modified  12:57:19 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self stations select: [:station | station state = aState].! !



!RadioEditDialog class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:09:21 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!RadioEditDialog class methods !
 
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  14:39:21 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!RadioEditDialog methods !
   
cancelButtonClicked

	"Callback for the #clicked event in cancelButton [Button].
		(Generated by WindowBuilder Pro)"
    #CodeTrackerBlock.  "Last Modified  14:45:19 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self close.! !



!RadioEditDialog methods !

createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | callSignEntry cancelButton cityEntry criticalEntry criticalEntry1 dayEntry dayEntry1 frequencyEntry latitudeEntry longitudeEntry nightEntry radioEditDialog1 saveButton segoeUI10 segoeUI8 stateEntry staticText1 staticText2 staticText3 staticText4 staticText5 staticText6 staticText7 staticText8 statusEntry xDU yDU |
    #CodeTrackerBlock.  "Last Modified  14:39:21 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #generated.
    xDU := (SysFont width + 1 roundTo: 2) / (SysFont width roundTo: 2).
    yDU := 1.
    radioEditDialog1 := self topPaneClass new.

		"Temporary Variables"
    callSignEntry := EntryField new.
    cancelButton := Button new.
    cityEntry := EntryField new.
    criticalEntry := StaticText new.
    criticalEntry1 := EntryField new.
    dayEntry := StaticText new.
    dayEntry1 := EntryField new.
    frequencyEntry := EnhancedEntryField new.
    latitudeEntry := EntryField new.
    longitudeEntry := EntryField new.
    nightEntry := EntryField new.
    saveButton := Button new.
    stateEntry := EntryField new.
    staticText1 := StaticText new.
    staticText2 := StaticText new.
    staticText3 := StaticText new.
    staticText4 := StaticText new.
    staticText5 := StaticText new.
    staticText6 := StaticText new.
    staticText7 := StaticText new.
    staticText8 := StaticText new.
    statusEntry := EntryField new.

		"Font Definitions"
    segoeUI10 := Font new fromByteArray: #[
        243 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    radioEditDialog1
        owner: self;
        setName: 'RadioEditDialog';
        alignRelativeToScreen;
        when: #maximized send: #winMaximized to: radioEditDialog1;
        when: #minimized send: #winMinimized to: radioEditDialog1;
        when: #restored send: #winRestored to: radioEditDialog1;
        addModalBorderStyle;
        labelWithoutPrefix: 'New Dialog';
        noSmalltalkMenuBar;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2 / ((SysFont width roundTo: 2) / 4);
                 leftInset: -203 * xDU;
                 topRatio: 1 / 2 / (SysFont height / 8);
                 topInset: -1648 / 19 * yDU;
                 rightRatio: 1 / 2 / ((SysFont width roundTo: 2) / 4);
                 rightInset: -203 * xDU;
                 bottomRatio: 1 / 2 / (SysFont height / 8);
                 bottomInset: -1648 / 19 * yDU).
    self addView: radioEditDialog1.
    staticText1
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 52 * xDU;
                 topRatio: 0;
                 topInset: 480 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -92 * xDU;
                 bottomRatio: 0;
                 bottomInset: -640 / 19 * yDU);
        contents: 'Frequency';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText1.
    staticText2
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 56 * xDU;
                 topRatio: 0;
                 topInset: 920 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -88 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1080 / 19 * yDU);
        contents: 'callSign';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText2.
    staticText3
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 61 * xDU;
                 topRatio: 0;
                 topInset: 72 * yDU;
                 rightRatio: 0;
                 rightInset: -83 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1528 / 19 * yDU);
        contents: 'State';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText3.
    staticText4
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 64 * xDU;
                 topRatio: 0;
                 topInset: 1856 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -80 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2016 / 19 * yDU);
        contents: 'City';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText4.
    dayEntry "StaticText"
        owner: self;
        setName: 'dayEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 240 * xDU;
                 topRatio: 0;
                 topInset: 896 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -282 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1056 / 19 * yDU);
        contents: 'Day Power';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: dayEntry.
    staticText5
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 236 * xDU;
                 topRatio: 0;
                 topInset: 512 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -282 * xDU;
                 bottomRatio: 0;
                 bottomInset: -672 / 19 * yDU);
        contents: 'Night Power';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText5.
    criticalEntry "StaticText"
        owner: self;
        setName: 'criticalEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 234 * xDU;
                 topRatio: 0;
                 topInset: 1376 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -286 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1536 / 19 * yDU);
        contents: 'Critical Power';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: criticalEntry.
    staticText6
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 56 * xDU;
                 topRatio: 0;
                 topInset: 2272 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -88 * xDU;
                 bottomRatio: 0;
                 bottomInset: -128 * yDU);
        contents: 'Latitude';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText6.
    staticText7
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 54 * xDU;
                 topRatio: 0;
                 topInset: 2752 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -92 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2912 / 19 * yDU);
        contents: 'Longitude';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText7.
    staticText8
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 250 * xDU;
                 topRatio: 0;
                 topInset: 96 * yDU;
                 rightRatio: 0;
                 rightInset: -276 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1984 / 19 * yDU);
        contents: 'Status';
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: staticText8.
    callSignEntry "EntryField"
        owner: self;
        setName: 'callSignEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 100 * xDU;
                 topRatio: 0;
                 topInset: 888 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -164 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1104 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: callSignEntry.
    stateEntry "EntryField"
        owner: self;
        setName: 'stateEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 100 * xDU;
                 topRatio: 0;
                 topInset: 1336 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -164 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1552 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: stateEntry.
    cityEntry "EntryField"
        owner: self;
        setName: 'cityEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 100 * xDU;
                 topRatio: 0;
                 topInset: 1784 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -164 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2000 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: cityEntry.
    latitudeEntry "EntryField"
        owner: self;
        setName: 'latitudeEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 100 * xDU;
                 topRatio: 0;
                 topInset: 2232 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -164 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2448 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: latitudeEntry.
    longitudeEntry "EntryField"
        owner: self;
        setName: 'longitudeEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 100 * xDU;
                 topRatio: 0;
                 topInset: 2720 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -164 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2936 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: longitudeEntry.
    nightEntry "EntryField"
        owner: self;
        setName: 'nightEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 288 * xDU;
                 topRatio: 0;
                 topInset: 448 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -352 * xDU;
                 bottomRatio: 0;
                 bottomInset: -664 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: nightEntry.
    dayEntry1 "EntryField"
        owner: self;
        setName: 'dayEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 288 * xDU;
                 topRatio: 0;
                 topInset: 888 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -352 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1104 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: dayEntry1.
    criticalEntry1 "EntryField"
        owner: self;
        setName: 'criticalEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 288 * xDU;
                 topRatio: 0;
                 topInset: 1336 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -352 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1552 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: criticalEntry1.
    statusEntry "EntryField"
        owner: self;
        setName: 'statusEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 288 * xDU;
                 topRatio: 0;
                 topInset: 1784 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -352 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2000 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: statusEntry.
    saveButton "Button"
        owner: self;
        setName: 'saveButton';
        when: #clicked send: #saveButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 250 * xDU;
                 topRatio: 0;
                 topInset: 2720 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -294 * xDU;
                 bottomRatio: 0;
                 bottomInset: -160 * yDU);
        contents: 'Save';
        startGroup;
        noTabStop;
        font: segoeUI8.
    radioEditDialog1 addSubpane: saveButton.
    cancelButton "Button"
        owner: self;
        setName: 'cancelButton';
        when: #clicked send: #cancelButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 324 * xDU;
                 topRatio: 0;
                 topInset: 2720 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -368 * xDU;
                 bottomRatio: 0;
                 bottomInset: -160 * yDU);
        cancelPushButton;
        contents: 'Cancel';
        startGroup;
        noTabStop;
        font: segoeUI8.
    radioEditDialog1 addSubpane: cancelButton.
    frequencyEntry "EnhancedEntryField"
        owner: self;
        setName: 'frequencyEntry';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 100 * xDU;
                 topRatio: 0;
                 topInset: 448 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -164 * xDU;
                 bottomRatio: 0;
                 bottomInset: -672 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    radioEditDialog1 addSubpane: frequencyEntry! !



!RadioEditDialog methods !
   
initWindow

		"initialize editing dialog for a station"
    #CodeTrackerBlock.  "Last Modified  14:47:49 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    super initWindow.
    self populateFields.! !



!RadioEditDialog methods !
  
openOn: aStation 

		  "opens a station edit dialog when a station is clicked on"
    #CodeTrackerBlock.  "Last Modified  14:33:04 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    station := aStation.
    self open.! !



!RadioEditDialog methods !
   
populateFields

	"enters the stations info if you go to edit"
    #CodeTrackerBlock.  "Last Modified  09:01:50 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (self paneNamed: 'frequencyEntry') contents: station frequency.
    (self paneNamed: 'callSignEntry') contents: station callSign.
    (self paneNamed: 'stateEntry') contents: station state.
    (self paneNamed: 'cityEntry') contents: station city.
    (self paneNamed: 'latitudeEntry') contents: station latitude asString.
    (self paneNamed: 'longitudeEntry') contents: station longitude asString.
    (self paneNamed: 'nightEntry') contents: station nightPower asString.
    (self paneNamed: 'dayEntry') contents: station dayPower asString.
    (self paneNamed: 'criticalEntry') contents: station criticalPower asString.
    (self paneNamed: 'statusEntry') contents: station status.! !



!RadioEditDialog methods !
 
saveButtonClicked

	"Callback for the #clicked event in saveButton [Button].
		(Generated by WindowBuilder Pro)"
    #CodeTrackerBlock.  "Last Modified  09:02:25 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    station frequency: (self paneNamed: 'frequencyEntry') contents.
    station callSign: (self paneNamed: 'callSignEntry') contents.
    station state: (self paneNamed: 'stateEntry') contents.
    station city: (self paneNamed: 'cityEntry') contents.
    station latitude: (self paneNamed: 'latitudeEntry') contents.
    station longitude: (self paneNamed: 'longitudeEntry') contents.
    station nightPower: (self paneNamed: 'nightEntry') contents.
    station dayPower: (self paneNamed: 'dayEntry') contents.
    station criticalPower: (self paneNamed: 'criticalEntry') contents.
    station status: (self paneNamed: 'statusEntry') contents.
    self close.! !



!RadioEditDialog methods !
 
station
    #CodeTrackerBlock.  "Last Modified  14:53:41 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^station! !



!RadioEditDialog methods !
 
station: aValue
    #CodeTrackerBlock.  "Last Modified  14:53:41 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    station := aValue! !



!RadioEditDialog methods !

views
    #CodeTrackerBlock.  "Last Modified  14:53:41 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^views! !



!RadioEditDialog methods !
 
views: aValue
    #CodeTrackerBlock.  "Last Modified  14:53:41 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    views := aValue! !



!RadioUI class methods !
  
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:29:49 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!RadioUI class methods !
 
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  14:42:18 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!RadioUI methods !
   
checkPower

		"checks which power box is selected to filter stations based on min/max"
    | minDay maxDay minNight maxNight fullStationList |
    #CodeTrackerBlock.  "Last Modified  15:41:47 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fullStationList := stations.
    minDay := (self paneNamed: 'minDay') contents isEmpty
        ifTrue:[nil]
        ifFalse:[(self paneNamed: 'minDay') contents asInteger].
    maxDay := (self paneNamed: 'maxDay') contents isEmpty
        ifTrue:[nil]
        ifFalse:[(self paneNamed: 'maxDay') contents asInteger].
    minNight := (self paneNamed: 'minNight') contents isEmpty
        ifTrue:[nil]
        ifFalse:[(self paneNamed: 'minNight') contents asInteger].
    maxNight := (self paneNamed: 'maxNight') contents isEmpty
        ifTrue:[nil]
        ifFalse:[(self paneNamed: 'maxNight') contents asInteger].! !



!RadioUI methods !
 
cityChanged: selectedCity 

		"Callback for the #changed: event in citiesList [DropDownList].
				(Generated by WindowBuilder Pro)"
    #CodeTrackerBlock.  "Last Modified  13:59:23 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    Transcript
        cr;
        show: 'cityChanged: selectedCity'.
    self doAllFiltering.! !



!RadioUI methods !
   
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | citiesList dayCheck mainView maxDay maxNight minDay minNight nightCheck numStations segoeUI10 segoeUI8 statesList staticText1 staticText2 staticText3 staticText4 staticText5 staticText6 stationList xDU yDU |
    #CodeTrackerBlock.  "Last Modified  14:42:18 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
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
    citiesList := DropDownList new.
    dayCheck := CheckBox new.
    maxDay := EntryField new.
    maxNight := EntryField new.
    minDay := EntryField new.
    minNight := EntryField new.
    nightCheck := CheckBox new.
    numStations := EntryField new.
    statesList := DropDownList new.
    staticText1 := StaticText new.
    staticText2 := StaticText new.
    staticText3 := StaticText new.
    staticText4 := StaticText new.
    staticText5 := StaticText new.
    staticText6 := StaticText new.
    stationList := CPColumnarListBox new.

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
        labelWithoutPrefix: 'Radio Stations';
        noSmalltalkMenuBar;
        backColor: Color buttonFace;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -322 * xDU;
                 topRatio: 1 / 2;
                 topInset: -2368 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -322 * xDU;
                 bottomRatio: 1 / 2;
                 bottomInset: -2368 / 19 * yDU).
    self addView: mainView.
    stationList "CPColumnarListBox"
        owner: self;
        setName: 'stationList';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 14 * xDU;
                 topRatio: 0;
                 topInset: 160 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -440 * xDU;
                 bottomRatio: 0;
                 bottomInset: -3936 / 19 * yDU);
        startGroup;
        noTabStop;
        receiveAllWindowMessages;
        setPopupMenu: (
            Menu new
                 title: '';
                 owner: self;
                 appendItem: 'Edit Station' selector: #editStation);
        font: segoeUI8;
        canSort: true;
        colorMethod: #colorDayPower;
        disableMethod: #disableStation;
        fields: (
            OrderedCollection new
                 addLast: (
                    CPCLBField new
                         header: 'Frequency';
                         justification: #center;
                         selector: #frequency);
                 addLast: (
                    CPCLBField new
                         header: 'callSign';
                         justification: #center;
                         selector: #callSign);
                 addLast: (
                    CPCLBField new
                         header: 'State';
                         justification: #center;
                         selector: #state);
                 addLast: (
                    CPCLBField new
                         header: 'City';
                         justification: #center;
                         selector: #city);
                 addLast: (
                    CPCLBField new
                         header: 'dayPower';
                         justification: #center;
                         selector: #dayPower);
                 addLast: (
                    CPCLBField new
                         header: 'nightPower';
                         justification: #center;
                         selector: #nightPower);
                 addLast: (
                    CPCLBField new
                         header: 'criticalPower';
                         justification: #center;
                         selector: #criticalPower);
                 addLast: (
                    CPCLBField new
                         header: 'Latitude';
                         justification: #center;
                         selector: #latitude);
                 addLast: (
                    CPCLBField new
                         header: 'Longitude';
                         justification: #center;
                         selector: #longitude);
                 addLast: (
                    CPCLBField new
                         header: 'Status';
                         selector: #status);
                 yourself).
    mainView addSubpane: stationList.
    statesList "DropDownList"
        owner: self;
        setName: 'statesList';
        when: #changed: send: #stateChanged: to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 524 * xDU;
                 topRatio: 0;
                 topInset: 3072 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -588 * xDU;
                 bottomRatio: 0;
                 bottomInset: -3288 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: statesList.
    citiesList "DropDownList"
        owner: self;
        setName: 'citiesList';
        when: #changed: send: #cityChanged: to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 524 * xDU;
                 topRatio: 0;
                 topInset: 3744 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -588 * xDU;
                 bottomRatio: 0;
                 bottomInset: -3960 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: citiesList.
    staticText1
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 482 * xDU;
                 topRatio: 0;
                 topInset: 448 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -526 * xDU;
                 bottomRatio: 0;
                 bottomInset: -32 * yDU);
        contents: 'Day Power:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: staticText1.
    staticText2
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 504 * xDU;
                 topRatio: 0;
                 topInset: 768 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -522 * xDU;
                 bottomRatio: 0;
                 bottomInset: -928 / 19 * yDU);
        contents: 'Min:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: staticText2.
    staticText3
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 504 * xDU;
                 topRatio: 0;
                 topInset: 1024 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -524 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1184 / 19 * yDU);
        contents: 'Max:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: staticText3.
    staticText4
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 478 * xDU;
                 topRatio: 0;
                 topInset: 1440 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -526 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1600 / 19 * yDU);
        contents: 'Night Power:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: staticText4.
    staticText5
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 504 * xDU;
                 topRatio: 0;
                 topInset: 1696 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -522 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1856 / 19 * yDU);
        contents: 'Min:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: staticText5.
    staticText6
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 504 * xDU;
                 topRatio: 0;
                 topInset: 1952 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -524 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2112 / 19 * yDU);
        contents: 'Max:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: staticText6.
    minDay "EntryField"
        owner: self;
        setName: 'minDay';
        when: #textChanged: send: #powerValueEdited: to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 524 * xDU;
                 topRatio: 0;
                 topInset: 768 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -588 * xDU;
                 bottomRatio: 0;
                 bottomInset: -984 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: minDay.
    maxDay "EntryField"
        owner: self;
        setName: 'maxDay';
        when: #textChanged: send: #powerValueEdited: to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 524 * xDU;
                 topRatio: 0;
                 topInset: 1024 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -588 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1240 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: maxDay.
    minNight "EntryField"
        owner: self;
        setName: 'minNight';
        when: #textChanged: send: #powerValueEdited: to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 524 * xDU;
                 topRatio: 0;
                 topInset: 1696 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -588 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1912 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: minNight.
    maxNight "EntryField"
        owner: self;
        setName: 'maxNight';
        when: #textChanged: send: #powerValueEdited: to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 524 * xDU;
                 topRatio: 0;
                 topInset: 1952 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -588 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2168 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: maxNight.
    numStations "EntryField"
        owner: self;
        setName: 'numStations';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 524 * xDU;
                 topRatio: 0;
                 topInset: 2336 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -588 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2552 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: numStations.
    dayCheck "CheckBox"
        owner: self;
        setName: 'dayCheck';
        when: #clicked: send: #dayChecked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 550 * xDU;
                 topRatio: 0;
                 topInset: 448 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -560 * xDU;
                 bottomRatio: 0;
                 bottomInset: -640 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    mainView addSubpane: dayCheck.
    nightCheck "CheckBox"
        owner: self;
        setName: 'nightCheck';
        when: #clicked: send: #nightChecked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 548 * xDU;
                 topRatio: 0;
                 topInset: 1440 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -558 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1600 / 19 * yDU);
        contents: '';
        backColor: Color buttonFace;
        startGroup;
        noTabStop;
        font: segoeUI8.
    mainView addSubpane: nightCheck! !



!RadioUI methods !

dayChecked

		"sees if the day checkbox is checked"
    #CodeTrackerBlock.  "Last Modified  15:44:56 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self paneNamed: 'dayCheck') value.! !



!RadioUI methods !
 
dayPowerMaxValue

		"max value of day power"
    | value |
    #CodeTrackerBlock.  "Last Modified  14:11:42 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    value := (self paneNamed: 'maxDay') contents.
    ^(value isNil or: [value = ''])
        ifTrue:[nil]
        ifFalse:[value asInteger]! !



!RadioUI methods !
  
dayPowerMinValue

		"min value of day power"
    | value |
    #CodeTrackerBlock.  "Last Modified  14:10:44 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    value := (self paneNamed: 'minDay') contents.
    ^(value isNil or: [value = ''])
        ifTrue:[nil]
        ifFalse:[value asInteger]! !



!RadioUI methods !
  
db
    #CodeTrackerBlock.  "Last Modified  11:49:07 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^db! !



!RadioUI methods !
   
db: aValue
    #CodeTrackerBlock.  "Last Modified  11:49:07 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    db := aValue! !



!RadioUI methods !
  
displayAllStations

	"Reset stationList grid to show all stations"
    #CodeTrackerBlock.  "Last Modified  13:12:48 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "self halt."
    (self paneNamed: 'stationList') contents: stations.

	"Reset the states dropdown to --- All States ---"
    (self paneNamed: 'statesList') selectItem: '--- All States ---'.

	"Reset the cities dropdown to --- All Cities ---"
    (self paneNamed: 'citiesList') contents: (Array with: '--- All Cities ---').
    (self paneNamed: 'citiesList') selectItem: '--- All Cities ---'.! !



!RadioUI methods !
   
distanceBetween: stationA 
and: stationB 

		"calculate distance between stations with haversine formula"
    | latitude1 longitude1 latitude2 longitude2 distLatitude distLongitude versineAngle radius |
    #CodeTrackerBlock.  "Last Modified  15:38:58 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    radius := 6371.0. "earth radius in km"
    latitude1 := stationA latitude.
    longitude1 := stationA longitude.
    latitude2 := stationB latitude.
    longitude2 := stationB longitude.
    distLatitude = latitude2 - latitude1.
    distLongitude = longitude2 - longitude1.
    versineAngle := (distLatitude / 2).! !



!RadioUI methods !

doAllFiltering

		  "stores collections retrieved from methods into data"
    | data count word |
    #CodeTrackerBlock.  "Last Modified  14:30:17 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    data := self stations.
    data := self filterByCity: data.
    data := self filterByDayPower: data.
    data := self filterByNightPower: data.
    data := self filterByState: data.
    (self paneNamed: 'stationList') contents: data.
    count := data size.
    word := count = 1
        ifTrue:['station']
        ifFalse:['stations'].
    (self paneNamed: 'numStations') contents: count asString , ' ' , word.! !



!RadioUI methods !
 
editStation

		"right click to edit a station"
    | selectedStation |
    #CodeTrackerBlock.  "Last Modified  08:57:55 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedStation := (self paneNamed: 'stationList') selectedItem.
    RadioEditDialog new openOn: selectedStation.
    (self paneNamed: 'stationList') refreshSelection.! !



!RadioUI methods !

filterByCity: stationsCollection 

		"returns collection of cities"
    | selectedCity |
    #CodeTrackerBlock.  "Last Modified  13:47:11 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedCity := (self paneNamed: 'citiesList') selectedItem.
    ^stationsCollection select: [:station |
        (selectedCity = '--- All Cities ---') or: [station city = selectedCity]]! !



!RadioUI methods !

filterByDayPower: stationsCollection 

		"returns collection of stations by day power"
    | minDay maxDay |
    #CodeTrackerBlock.  "Last Modified  14:19:03 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    minDay := self dayPowerMinValue.
    maxDay := self dayPowerMaxValue.
    ^stationsCollection select: [:station |
        ((minDay isNil or: [station dayPower >= minDay]) and: (
            maxDay isNil or: [station dayPower <= maxDay]))]! !



!RadioUI methods !
 
filterByNightPower: stationsCollection 

		"returns collleciton of stations filtered by night power"
    | minNight maxNight |
    #CodeTrackerBlock.  "Last Modified  14:14:18 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    minNight := self nightPowerMinValue.
    maxNight := self nightPowerMaxValue.
    ^stationsCollection select: [:station |
        ((minNight isNil or: [station nightPower >= minNight]) and: (
            maxNight isNil or: [station nightPower <= maxNight]))]! !



!RadioUI methods !
   
filterByState: stationsCollection 

		"returns collection of states"
    | selectedState |
    #CodeTrackerBlock.  "Last Modified  13:46:27 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedState := (self paneNamed: 'statesList') selectedItem.
    ^stationsCollection select: [:station |
        (selectedState = '--- All States ---') or: [station state = selectedState]]! !



!RadioUI methods !
  
initWindow

		 "initialize window"
    | states statesWithAll |
    #CodeTrackerBlock.  "Last Modified  15:00:12 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    super initWindow.
    db := RadioDatabase new.
    stations := db allStations.
    self displayAllStations.
    (self paneNamed: 'stationList') contents: stations.
    (self paneNamed: 'stationList')
        colorMethod: #colorDayPower;
        backColor2: (
            Color red: 243.0 green: 195.0 blue: 254.0);
        foreColor: Color black.

		"Populate states dropdown with '--- All States ---' at the top"
    states := db alphaStates.
    states := states ifNil: [OrderedCollection new].
    statesWithAll := (Array with: '--- All States ---') , (states asSortedCollection asArray).
    (self paneNamed: 'statesList') contents: statesWithAll.
    (self paneNamed: 'statesList') selectItem: '--- All States ---'.! !



!RadioUI methods !

nightChecked

		"sees if the night checkbox is checked"
    #CodeTrackerBlock.  "Last Modified  15:45:56 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self paneNamed: 'nightCheck') value.! !



!RadioUI methods !
   
nightPowerMaxValue

		"max value of night power"
    | value |
    #CodeTrackerBlock.  "Last Modified  14:16:36 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    value := (self paneNamed: 'maxNight') contents.
    ^(value isNil or: [value = ''])
        ifTrue:[nil]
        ifFalse:[value asInteger]! !



!RadioUI methods !

nightPowerMinValue

		"min value of night power"
    | value |
    #CodeTrackerBlock.  "Last Modified  14:15:30 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    value := (self paneNamed: 'minNight') contents.
    ^(value isNil or: [value = ''])
        ifTrue:[nil]
        ifFalse:[value asInteger]! !



!RadioUI methods !

noFilterApplied

	"method called when the user does not use the day power or night power filtering, just want to select a state and city."
    #CodeTrackerBlock.  "Last Modified  09:40:53 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self dayChecked not and: [self nightChecked not]) and: [(self paneNamed: 'minDay') contents isEmpty and:
        [(self paneNamed: 'maxDay') contents isEmpty and: [(self paneNamed: 'minNight') contents isEmpty and:
            [(self paneNamed: 'maxNight') contents isEmpty]]]].! !



!RadioUI methods !

powerValueEdited: anEvent 

	"re-applies the power filter and updates the station list when the entry fields are edited (selector of each)."
    #CodeTrackerBlock.  "Last Modified  14:00:05 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    Transcript
        cr;
        show: 'powerValueEdited: anEvent'.
    self doAllFiltering.! !



!RadioUI methods !
   
stateChanged: selectedState 

				 "Callback for the #changed: event in statesList [DropDownList].
										(Generated by WindowBuilder Pro)"
    | citiesForState citiesWithAll |
    #CodeTrackerBlock.  "Last Modified  14:25:16 06/19/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "self halt."
    Transcript
        cr;
        show: 'stateChanged: selectedState'.
    selectedState = '--- All States ---'
        ifTrue:[
            (self paneNamed: 'citiesList') contents: (Array with: '--- All Cities ---').
            (self paneNamed: 'citiesList') selectItem: '--- All Cities ---'.
            self doAllFiltering.
            ^self].

	"self halt."
    citiesForState := db citiesByState: selectedState.

	"self halt."
    citiesWithAll := (Array with: '--- All Cities ---') , citiesForState asArray.
    (self paneNamed: 'citiesList') contents: citiesWithAll.
    (self paneNamed: 'citiesList') selectItem: '--- All Cities ---'.
    self doAllFiltering.! !



!RadioUI methods !
  
stations
    #CodeTrackerBlock.  "Last Modified  13:41:17 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^stations! !



!RadioUI methods !
   
stations: aValue
    #CodeTrackerBlock.  "Last Modified  13:41:17 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    stations := aValue! !



!RadioUI methods !
  
stationStringToInteger: aString 

		  "converts a string to integer (used for power watts comparisons)"
    #CodeTrackerBlock.  "Last Modified  15:52:58 06/18/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(aString isNil or: [aString isEmpty])
        ifTrue:[nil]
        ifFalse:[aString asInteger].! !



!RadioUI methods !
   
views
    #CodeTrackerBlock.  "Last Modified  10:07:21 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^views! !



!RadioUI methods !
 
views: aValue
    #CodeTrackerBlock.  "Last Modified  10:07:21 06/18/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Radio. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    views := aValue! !
