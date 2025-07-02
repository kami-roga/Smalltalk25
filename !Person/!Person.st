
Object subclass: #Person
  instanceVariableNames: 
    ' name id dateOfBirth children '
  classVariableNames: ''
  poolDictionaries: ''   !
Object subclass: #PersonDatabase
  instanceVariableNames: 
    ' people '
  classVariableNames: ''
  poolDictionaries: ''    !

PersonDatabase class instanceVariableNames: ' people ' !
ViewManager subclass: #PersonUI
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '    !
WindowDialog subclass: #PersonEditDialog
  instanceVariableNames: 
    ' person saved '
  classVariableNames: ''
  poolDictionaries: 
    ' ColorConstants OperatingSystemConstants '   !

PersonEditDialog class instanceVariableNames: ' windowTitle label default '    !


!Person class methods !
  
fromString: aString 

"fromString expects an argument, since we are calling fromString: buf in the Person Database class"
    | var aPerson |
    #CodeTrackerBlock.  "Last Modified  10:34:08 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    aPerson := Person new.
    var := aString asArrayOfSubstringsSeparatedBy: Character tab.
    aPerson name: (var at: 1).
    aPerson id: (var at: 2) asInteger.
    ((var at: 3) asArrayOfSubstringsSeparatedBy: $,) do: [:each |
        (each isEmpty or: [each = ' '])
            ifFalse:[aPerson children add: each]].
    aPerson dateOfBirth: (Date fromString: (var at: 4)).
    ^aPerson.! !



!Person class methods !
  
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  12:41:45 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!Person methods !
   
asText

"representation of the person that is provided from the Person class to Person Database class"
    | ws |
    #CodeTrackerBlock.  "Last Modified  09:59:37 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "person object will send each item"
    ws := String new writeStream.
    ws
        nextPutAll: self name;
        tab;
        nextPutAll: self id asString;
        tab;
        nextPutAll: self stringChildren;
        tab;
        nextPutAll: self dateOfBirth asString.
    ^ws contents.! !



!Person methods !
  
children

		"ordered collection"
    #CodeTrackerBlock.  "Last Modified  10:58:36 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^children ifNil: [children := OrderedCollection new].! !



!Person methods !
 
children: aValue 

	"make children an ordered collection"
    #CodeTrackerBlock.  "Last Modified  10:58:22 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    children := aValue.! !



!Person methods !
  
color

		"return people have >2 children in a color"
    #CodeTrackerBlock.  "Last Modified  16:27:21 06/11/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^(self children size > 2)
        ifTrue:[Color blue]
        ifFalse:[Color black].! !



!Person methods !
  
dateOfBirth
    #CodeTrackerBlock.  "Last Modified  12:45:49 06/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^dateOfBirth! !



!Person methods !
 
dateOfBirth: aValue
    #CodeTrackerBlock.  "Last Modified  12:45:49 06/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    dateOfBirth := aValue! !



!Person methods !

id
    #CodeTrackerBlock.  "Last Modified  12:45:49 06/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^id! !



!Person methods !
   
id: aValue
    #CodeTrackerBlock.  "Last Modified  12:45:49 06/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    id := aValue! !



!Person methods !
  
name
    #CodeTrackerBlock.  "Last Modified  12:45:49 06/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^name! !



!Person methods !
   
name: aValue
    #CodeTrackerBlock.  "Last Modified  12:45:49 06/02/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    name := aValue! !



!Person methods !
  
printOn: bStream 

	"displays message 'a [person class] named [name]'"
    | bString |
    #CodeTrackerBlock.  "Last Modified  17:02:58 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    bString := self class name.
    bStream nextPutAll: 'a '.
    bStream nextPutAll: bString.
    bString := self name.
    bStream nextPutAll: ' named '.
    bStream nextPutAll: bString.! !



!Person methods !

stringChildren

	"Returns children as a comma-separated string (if they have any)."
    | ws first |
    #CodeTrackerBlock.  "Last Modified  10:51:32 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self children isEmpty
        ifTrue:[^''].
    ws := String new writeStream.
    first := true.
    self children do: [:each |
        first
            ifTrue:[first := false]
            ifFalse:[ws nextPutAll: ', '].
        ws nextPutAll: each asString. "or each name if children are Person objects"
        ].
    ^ws contents.! !



!PersonDatabase class methods !
  
add: person 

		  "adding a person in database"
    #CodeTrackerBlock.  "Last Modified  13:55:02 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self people add: person! !



!PersonDatabase class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  12:51:36 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!PersonDatabase class methods !
 
people

	"people method"
    #CodeTrackerBlock.  "Last Modified  14:44:44 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    people ifNil: [people := OrderedCollection new].
    ^people! !



!PersonDatabase methods !
   
ageDifference

		"finds number of days the oldest is older than the youngest"
    | youngest oldest days message |
    #CodeTrackerBlock.  "Last Modified  15:55:10 06/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    youngest := self youngestPerson.
    oldest := self oldestPerson.
    days := (youngest dateOfBirth - oldest dateOfBirth).
    message := 'The oldest person is ' , days printString , ' days older than the youngest.'.
    ^message.! !



!PersonDatabase methods !
   
allPersons

	"reutns all persons"
    | fileStream person |
    #CodeTrackerBlock.  "Last Modified  10:51:18 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fileStream := File pathNameReadOnly: 'Person_Objects4.txt'.
    [fileStream atEnd]
        whileFalse:[
            | buf|buf := fileStream nextLine.
            person := Person fromString: buf.
            self people add: person.].
    fileStream close.
    ^people! !



!PersonDatabase methods !
 
dateToString

		"fromats a date from a string"
    | fileStream person |
    #CodeTrackerBlock.  "Last Modified  14:07:34 06/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fileStream := File pathNameReadOnly: 'Person_Objects.txt'.
    [fileStream atEnd]
        whileFalse:[
            | buf|buf := fileStream nextLine.
            person := Person fromString: buf.
            Transcript
                cr;
                show: buf.].
    fileStream close.! !



!PersonDatabase methods !
   
leastChildren

	"leastChildren method"
    #CodeTrackerBlock.  "Last Modified  09:40:44 06/03/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self peopleByNumberOfChildren first! !



!PersonDatabase methods !
  
mostChildren

	"mostChildren method"
    #CodeTrackerBlock.  "Last Modified  14:55:30 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self peopleByNumberOfChildren last! !



!PersonDatabase methods !
 
objectsToFile

	"creates .txt file of person objects"
    | fileStream |
    #CodeTrackerBlock.  "Last Modified  16:09:44 06/12/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fileStream := File newFile: 'Person_Objects3.txt'.
        [
        people do: [:person |
            fileStream
                nextPutAll: person asText;
                cr.].] ensure: [fileStream close].! !



!PersonDatabase methods !
   
oldestPerson

		"returns oldest person"
    #CodeTrackerBlock.  "Last Modified  15:22:58 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self peopleByAge first.! !



!PersonDatabase methods !
 
people

		"people method"
    #CodeTrackerBlock.  "Last Modified  13:33:36 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    people ifNil: [people := OrderedCollection new].
    ^people! !



!PersonDatabase methods !
  
peopleByAge

		"sorting by ascending year"
    #CodeTrackerBlock.  "Last Modified  15:24:17 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "sorting people by age"
    ^people asSortedCollection: [:a :b | a dateOfBirth < b dateOfBirth].! !



!PersonDatabase methods !
 
peopleByNumberOfChildren

	"leastChildren method"
    #CodeTrackerBlock.  "Last Modified  14:49:42 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^people asSortedCollection: [:a :b | a children size < b children size].! !



!PersonDatabase methods !
   
personObjectsToFile

	"creates .txt file of person objects"
    | fileStream |
    #CodeTrackerBlock.  "Last Modified  10:30:49 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fileStream := File newFile: 'Person_Objects.txt'.
        [
        people do: [:person |
            fileStream
                nextPutAll: person name;
                nextPutAll: ' ';
                nextPutAll: person id;
                nextPutAll: ' ';
                nextPutAll: person children;
                nextPutAll: ' ';
                nextPutAll: person dateOfBirth;
                nextPutAll: ' ';
                cr.].] ensure: [fileStream close].! !



!PersonDatabase methods !
 
save: aListOfPersons 

	"creates .txt file of person objects"
    | fileStream |
    #CodeTrackerBlock.  "Last Modified  15:47:40 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    fileStream := File newFile: 'Person_Objects4.txt'.
        [
        aListOfPersons do: [:person |
            fileStream
                nextPutAll: person asText;
                cr.].] ensure: [fileStream close].! !



!PersonDatabase methods !
   
youngestPerson

"finding youngest person"
    #CodeTrackerBlock.  "Last Modified  15:22:45 06/02/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^self peopleByAge last.! !



!PersonEditDialog class methods !

includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  10:30:55 06/12/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!PersonEditDialog class methods !
   
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  16:08:45 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!PersonEditDialog methods !
 
addChild

	"adding a child to listboxchildren"
    | newName |
    #CodeTrackerBlock.  "Last Modified  10:38:58 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    newName := TextPromptDialog title: 'Add Child:' prompt: 'Enter name:' default: ''.
    newName ifNotNil: [
        person children add: newName.
        (self paneNamed: 'listboxchildren') contents: person children].! !



!PersonEditDialog methods !

cancelButton

		"cancels task when button pressed"
    #CodeTrackerBlock.  "Last Modified  13:54:30 06/12/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ! !



!PersonEditDialog methods !

cancelButtonClicked

		"cancels task when button pressed"
    #CodeTrackerBlock.  "Last Modified  16:24:35 06/12/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self close.! !



!PersonEditDialog methods !
  
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | cancelbutton editbutton entrydob entryField1 entryField2 entryField3 entryid entryname listboxchildren personEditDialog1 savebutton segoeUI10 segoeUI8 xDU yDU |
    #CodeTrackerBlock.  "Last Modified  16:08:45 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    #generated.
    xDU := (SysFont width + 1 roundTo: 2) / (SysFont width roundTo: 2).
    yDU := 1.
    personEditDialog1 := self topPaneClass new.

		"Temporary Variables"
    cancelbutton := Button new.
    editbutton := Button new.
    entrydob := EntryField new.
    entryField1 := EntryField new.
    entryField2 := EntryField new.
    entryField3 := EntryField new.
    entryid := EntryField new.
    entryname := EntryField new.
    listboxchildren := ListBox new.
    savebutton := Button new.

		"Font Definitions"
    segoeUI10 := Font new fromByteArray: #[
        243 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    segoeUI8 := Font new fromByteArray: #[
        245 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 2 2 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ].
    personEditDialog1
        owner: self;
        setName: 'PersonEditDialog';
        alignRelativeToScreen;
        when: #maximized send: #winMaximized to: personEditDialog1;
        when: #minimized send: #winMinimized to: personEditDialog1;
        when: #restored send: #winRestored to: personEditDialog1;
        addModalBorderStyle;
        labelWithoutPrefix: 'PersonEditDialog';
        noSmalltalkMenuBar;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2 / ((SysFont width roundTo: 2) / 4);
                 leftInset: -148 * xDU;
                 topRatio: 1 / 2 / (SysFont height / 8);
                 topInset: -1712 / 19 * yDU;
                 rightRatio: 1 / 2 / ((SysFont width roundTo: 2) / 4);
                 rightInset: -148 * xDU;
                 bottomRatio: 1 / 2 / (SysFont height / 8);
                 bottomInset: -1712 / 19 * yDU).
    self addView: personEditDialog1.
    entryname "EntryField"
        owner: self;
        setName: 'entryname';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 62 * xDU;
                 topRatio: 0;
                 topInset: 128 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -238 * xDU;
                 bottomRatio: 0;
                 bottomInset: -352 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    personEditDialog1 addSubpane: entryname.
    entryid "EntryField"
        owner: self;
        setName: 'entryid';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 62 * xDU;
                 topRatio: 0;
                 topInset: 512 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -238 * xDU;
                 bottomRatio: 0;
                 bottomInset: -728 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    personEditDialog1 addSubpane: entryid.
    entrydob "EntryField"
        owner: self;
        setName: 'entrydob';
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 62 * xDU;
                 topRatio: 0;
                 topInset: 960 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -238 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1176 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    personEditDialog1 addSubpane: entrydob.
    listboxchildren
        owner: self;
        setName: 'listboxchildren';
        addBorderStyle;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 62 * xDU;
                 topRatio: 0;
                 topInset: 1472 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -238 * xDU;
                 bottomRatio: 0;
                 bottomInset: -2880 / 19 * yDU);
        startGroup;
        noTabStop;
        setPopupMenu: (
            Menu new
                 title: '';
                 owner: self;
                 appendItem: 'add child' selector: #addChild;
                 appendItem: 'delete child' selector: #deleteChild;
                 appendItem: 'edit child' selector: #editChild);
        font: segoeUI10.
    personEditDialog1 addSubpane: listboxchildren.
    editbutton "Button"
        owner: self;
        setName: 'editbutton';
        when: #clicked send: #editButton to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 248 * xDU;
                 topRatio: 0;
                 topInset: 960 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -284 * xDU;
                 bottomRatio: 0;
                 bottomInset: -64 * yDU);
        contents: 'Edit';
        startGroup;
        noTabStop;
        font: segoeUI8.
    personEditDialog1 addSubpane: editbutton.
    savebutton "Button"
        owner: self;
        setName: 'savebutton';
        when: #clicked send: #saveButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 100 * xDU;
                 topRatio: 0;
                 topInset: 160 * yDU;
                 rightRatio: 0;
                 rightInset: -136 * xDU;
                 bottomRatio: 0;
                 bottomInset: -3296 / 19 * yDU);
        contents: 'Save';
        startGroup;
        noTabStop;
        font: segoeUI8.
    personEditDialog1 addSubpane: savebutton.
    cancelbutton "Button"
        owner: self;
        setName: 'cancelbutton';
        when: #clicked send: #cancelButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 170 * xDU;
                 topRatio: 0;
                 topInset: 160 * yDU;
                 rightRatio: 0;
                 rightInset: -206 * xDU;
                 bottomRatio: 0;
                 bottomInset: -3296 / 19 * yDU);
        cancelPushButton;
        contents: 'Cancel';
        startGroup;
        noTabStop;
        font: segoeUI8.
    personEditDialog1 addSubpane: cancelbutton.
    entryField1
        owner: self;
        removeExtendedStyle: WsExClientedge;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 24 * xDU;
                 topRatio: 0;
                 topInset: 128 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -58 * xDU;
                 bottomRatio: 0;
                 bottomInset: -344 / 19 * yDU);
        contents: 'Name:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    personEditDialog1 addSubpane: entryField1.
    entryField2
        owner: self;
        removeExtendedStyle: WsExClientedge;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 24 * xDU;
                 topRatio: 0;
                 topInset: 512 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -58 * xDU;
                 bottomRatio: 0;
                 bottomInset: -736 / 19 * yDU);
        contents: 'id:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    personEditDialog1 addSubpane: entryField2.
    entryField3
        owner: self;
        removeExtendedStyle: WsExClientedge;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 24 * xDU;
                 topRatio: 0;
                 topInset: 960 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -58 * xDU;
                 bottomRatio: 0;
                 bottomInset: -1184 / 19 * yDU);
        contents: 'DOB:';
        startGroup;
        noTabStop;
        font: segoeUI10.
    personEditDialog1 addSubpane: entryField3! !



!PersonEditDialog methods !
   
deleteChild

		"deleting a child from ordered collection"
    | selectedIndex |
    #CodeTrackerBlock.  "Last Modified  11:13:19 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedIndex := (self paneNamed: 'listboxchildren') selectedIndex.
    person children removeIndex: selectedIndex.
    (self paneNamed: 'listboxchildren') contents: person children.! !



!PersonEditDialog methods !
  
editButton

		"puts calendar dob info in entry field"
    | selectedDate |
    #CodeTrackerBlock.  "Last Modified  15:34:27 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "Callback for the #clicked event in editbutton [Button].
	(Generated by WindowBuilder Pro)"
    selectedDate := CalendarDialog openOn: person dateOfBirth.
    selectedDate ifNotNil: [(self paneNamed: 'entrydob') contents: selectedDate date.].! !



!PersonEditDialog methods !
  
editChild

	"Callback for the menu item titled 'edit child'.
	 (Generated by WindowBuilder)"
    | selectedChild newName index |
    #CodeTrackerBlock.  "Last Modified  10:20:15 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedChild := (self paneNamed: 'listboxchildren') selectedItem.
    index := (self paneNamed: 'listboxchildren') selectedIndex.
    selectedChild ifNotNil: [
        newName := TextPromptDialog title: 'Edit Child Name' prompt: 'Enter new name:' default: selectedChild name.
        newName ifNotNil: [
            (self paneNamed: 'listboxchildren') contents at: index put: newName.
            (self paneNamed: 'listboxchildren') contents: person children.].].! !



!PersonEditDialog methods !
  
initWindow

	"initialize person edit dialog window"
    #CodeTrackerBlock.  "Last Modified  10:52:58 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    super initWindow.
    (self paneNamed: 'entryname') contents: person name.
    (self paneNamed: 'entryid') contents: person id asString.
    (self paneNamed: 'entrydob') contents: person dateOfBirth asString.
    (self paneNamed: 'listboxchildren') contents: person children.! !



!PersonEditDialog methods !

openOn: aPerson 

		  "open dialog box"
    #CodeTrackerBlock.  "Last Modified  10:42:23 06/12/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    person := aPerson.
    self open.! !



!PersonEditDialog methods !
 
person
    #CodeTrackerBlock.  "Last Modified  09:34:19 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^person! !



!PersonEditDialog methods !
 
person: aValue
    #CodeTrackerBlock.  "Last Modified  09:34:19 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    person := aValue! !



!PersonEditDialog methods !

saveButtonClicked

	"Callback for the #clicked event in savebutton [Button].
		(Generated by WindowBuilder Pro)"
    #CodeTrackerBlock.  "Last Modified  15:09:10 06/12/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    person name: (self paneNamed: 'entryname') contents.
    person id: (self paneNamed: 'entryid') contents.
    person dateOfBirth: (self paneNamed: 'entrydob') contents.
    person children: (self paneNamed: 'listboxchildren') contents.
    self close.! !



!PersonEditDialog methods !
  
saved
    #CodeTrackerBlock.  "Last Modified  09:34:19 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^saved! !



!PersonEditDialog methods !
   
saved: aValue
    #CodeTrackerBlock.  "Last Modified  09:34:19 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    saved := aValue! !



!PersonEditDialog methods !
  
views
    #CodeTrackerBlock.  "Last Modified  09:34:19 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^views! !



!PersonEditDialog methods !
   
views: aValue
    #CodeTrackerBlock.  "Last Modified  09:34:19 06/16/25"
    #LabWare. "Owner"
    #LIMS. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #None. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    views := aValue! !



!PersonEditDialog methods !
  
wasSaved

		"checks if the user clicked saved when creating/editing a person"
    #CodeTrackerBlock.  "Last Modified  13:43:18 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^saved = true.! !



!PersonUI class methods !
 
includeClass

		"This method informs CodeTracker what tracks this class belongs to."
    #CodeTrackerBlock.  "Last Modified  14:31:05 06/11/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^true! !



!PersonUI class methods !
   
wbBasicVersion

	"Private - Answer the WindowBuilder Pro version.
		Generated in: Visual Smalltalk 3.1.0 Win32"
    #CodeTrackerBlock.  "Last Modified  09:01:17 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^3.11! !



!PersonUI methods !
 
addPerson

	"Callback for the menu item titled 'Add Person'.
	 (Generated by WindowBuilder)"
    | newPerson dialog |
    #CodeTrackerBlock.  "Last Modified  15:14:30 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    newPerson := Person new.
    dialog := PersonEditDialog new.
    dialog openOn: newPerson.
    self addPersonToListBox: newPerson.
    (self paneNamed: 'personList') redraw.! !



!PersonUI methods !
  
addPersonToListBox: aPerson 

	"loading people into list box"
    #CodeTrackerBlock.  "Last Modified  15:01:32 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    (self paneNamed: 'personList') contents add: aPerson.
    (self paneNamed: 'personList') redraw.! !



!PersonUI methods !

cancelButtonClicked

	"Callback for the #clicked event in cancelButton [Button].
		(Generated by WindowBuilder Pro)"
    #CodeTrackerBlock.  "Last Modified  14:03:52 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    self close.! !



!PersonUI methods !
  
createViews

	"WARNING!! This method was automatically generated by 
	WindowBuilder. Code you add here which does not conform to 
	the WindowBuilder API will probably be lost the next time 
	you save your layout definition."
    | cancelButton entryField1 mainView personList saveButton segoeUI10 segoeUI8 xDU yDU |
    #CodeTrackerBlock.  "Last Modified  09:01:16 06/17/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
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
    cancelButton := Button new.
    entryField1 := EntryField new.
    personList := CPColumnarListBox new.
    saveButton := Button new.

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
        labelWithoutPrefix: 'Person Window';
        noSmalltalkMenuBar;
        backColor: Color buttonFace;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -291 * xDU;
                 topRatio: 1 / 2;
                 topInset: -2800 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -291 * xDU;
                 bottomRatio: 1 / 2;
                 bottomInset: -2800 / 19 * yDU).
    self addView: mainView.
    personList "CPColumnarListBox"
        owner: self;
        setName: 'personList';
        addBorderStyle;
        removeHorizontalScrollbarStyle;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 138 * xDU;
                 topRatio: 0;
                 topInset: 512 / 19 * yDU;
                 rightRatio: 1;
                 rightInset: 142 * xDU;
                 bottomRatio: 1;
                 bottomInset: 864 / 19 * yDU);
        startGroup;
        noTabStop;
        receiveAllWindowMessages;
        setPopupMenu: (
            Menu new
                 title: '';
                 owner: self;
                 appendItem: 'Edit Person' selector: #editPerson;
                 appendItem: 'Add Person' selector: #addPerson;
                 appendItem: 'Delete Person' selector: #deletePerson);
        font: segoeUI8;
        canSort: true;
        colorMethod: #color;
        fields: (
            OrderedCollection new
                 addLast: (
                    CPCLBField new
                         header: 'id';
                         selector: #id);
                 addLast: (
                    CPCLBField new
                         header: 'Name';
                         selector: #name);
                 addLast: (
                    CPCLBField new
                         header: 'DOB';
                         justification: #center;
                         selector: #dateOfBirth);
                 addLast: (
                    CPCLBField new
                         header: 'Children';
                         selector: #stringChildren);
                 yourself).
    mainView addSubpane: personList.
    entryField1
        owner: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 1 / 2;
                 leftInset: -105 * xDU;
                 topRatio: 1;
                 topInset: -352 / 19 * yDU;
                 rightRatio: 1 / 2;
                 rightInset: -87 * xDU;
                 bottomRatio: 1;
                 bottomInset: 120 / 19 * yDU);
        startGroup;
        noTabStop;
        font: segoeUI10.
    mainView addSubpane: entryField1.
    saveButton "Button"
        owner: self;
        setName: 'saveButton';
        when: #clicked send: #saveButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 220 * xDU;
                 topRatio: 0;
                 topInset: 4544 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -256 * xDU;
                 bottomRatio: 0;
                 bottomInset: -4800 / 19 * yDU);
        contents: 'Save';
        startGroup;
        noTabStop;
        font: SysFont.
    mainView addSubpane: saveButton.
    cancelButton "Button"
        owner: self;
        setName: 'cancelButton';
        when: #clicked send: #cancelButtonClicked to: self;
        framingBlock: (
            LayoutFrame new
                 leftRatio: 0;
                 leftInset: 294 * xDU;
                 topRatio: 0;
                 topInset: 4544 / 19 * yDU;
                 rightRatio: 0;
                 rightInset: -330 * xDU;
                 bottomRatio: 0;
                 bottomInset: -4800 / 19 * yDU);
        contents: 'Cancel';
        startGroup;
        noTabStop;
        font: SysFont;
        cancelPushButton.
    mainView addSubpane: cancelButton! !



!PersonUI methods !
 
deletePerson

        "only deletes person if the yes button is hit"
    | selectedPerson |
    #CodeTrackerBlock.  "Last Modified  16:07:26 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    "deleting a person"
    selectedPerson := (self paneNamed: 'personList') contents remove: (self paneNamed: 'personList') selectedItem ifAbsent: [
        ].
    self warningMessage
        ifTrue:[
            (self paneNamed: 'personList') contents remove: selectedPerson ifAbsent: [].
            (self paneNamed: 'personList') redraw.].! !



!PersonUI methods !
 
editPerson

	"calls PersonEditDialog if a person is selected to be edited"
    | selectedPerson |
    #CodeTrackerBlock.  "Last Modified  15:10:23 06/12/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    selectedPerson := (self paneNamed: 'personList') selectedItem.
    PersonEditDialog new openOn: selectedPerson.
    (self paneNamed: 'personList') refreshSelection.! !



!PersonUI methods !
  
initWindow

	"load data when opening window"
    #CodeTrackerBlock.  "Last Modified  16:31:03 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    super initWindow.
    (self paneNamed: 'personList') contents: PersonDatabase new allPersons.
    (self paneNamed: 'personList')
        backColor2: (
            Color red: 64.0 green: 224.0 blue: 208.0);
        foreColor: Color black.! !



!PersonUI methods !

saveButtonClicked

	"implement a save method"
    #CodeTrackerBlock.  "Last Modified  15:55:05 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    PersonDatabase new save: (self paneNamed: 'personList') contents.
    self savedMessageBox.! !



!PersonUI methods !
 
savedMessageBox

		"pop-up that tells user the save was successful"
    #CodeTrackerBlock.  "Last Modified  16:00:08 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    MessageBox message: 'Save successful'.! !



!PersonUI methods !
 
warningMessage

		"warns user before deleting a person"
    #CodeTrackerBlock.  "Last Modified  16:07:55 06/16/25"
    #LabWare. "Owner"
    #?. "Type"
    #?. "Project"
    #Person. "Module"
    #?. "Unit"
    #SS5. "RevisedBy"
    #NotReviewed. "ReviewedBy"
    #?. "LabTrackId"
    #CodeTrackerBlockEnd.  "Copyright © 2025 LabWare Inc."

    ^MessageBox confirmWithCancel: 'Are you sure you want to delete this person?'.! !
