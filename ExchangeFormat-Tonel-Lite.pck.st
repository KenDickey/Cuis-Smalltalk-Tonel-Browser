'From Cuis 6.0 [latest update: #5593] on 14 December 2022 at 9:16:23 am'!
'Description Just enough here to read/write basic Tonel file format.

Ported from  https://github.com/aucerna/bee-dmr/tree/master/Tonel
Copyright (c) 2021 Quorum Software.
	See (MIT) license in LICENSES directory.'!
!provides: 'ExchangeFormat-Tonel-Lite' 1 45!
!requires: 'BeeCompatibility' 1 36 nil!
!requires: 'ExchangeFormat-STON' 1 46 nil!
SystemOrganization addCategory: 'ExchangeFormat-Tonel-Lite'!


!classDefinition: #TonelTest category: 'ExchangeFormat-Tonel-Lite'!
TestCase subclass: #TonelTest
	instanceVariableNames: 'streams'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-Tonel-Lite'!
!classDefinition: 'TonelTest class' category: 'ExchangeFormat-Tonel-Lite'!
TonelTest class
	instanceVariableNames: ''!

!classDefinition: #TrivialExample category: 'ExchangeFormat-Tonel-Lite'!
TonelTest subclass: #TrivialExample
	instanceVariableNames: 'larry joe curley'
	classVariableNames: 'Stooges'
	poolDictionaries: ''
	category: 'ExchangeFormat-Tonel-Lite'!
!classDefinition: 'TrivialExample class' category: 'ExchangeFormat-Tonel-Lite'!
TrivialExample class
	instanceVariableNames: ''!

!classDefinition: #TonelPackage category: 'ExchangeFormat-Tonel-Lite'!
Object subclass: #TonelPackage
	instanceVariableNames: 'category classList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-Tonel-Lite'!
!classDefinition: 'TonelPackage class' category: 'ExchangeFormat-Tonel-Lite'!
TonelPackage class
	instanceVariableNames: ''!

!classDefinition: #TonelReader category: 'ExchangeFormat-Tonel-Lite'!
Object subclass: #TonelReader
	instanceVariableNames: 'classComment classInfo methodInfos stream codeType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-Tonel-Lite'!
!classDefinition: 'TonelReader class' category: 'ExchangeFormat-Tonel-Lite'!
TonelReader class
	instanceVariableNames: ''!

!classDefinition: #TonelRepository category: 'ExchangeFormat-Tonel-Lite'!
Object subclass: #TonelRepository
	instanceVariableNames: 'dirEntry categories'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-Tonel-Lite'!
!classDefinition: 'TonelRepository class' category: 'ExchangeFormat-Tonel-Lite'!
TonelRepository class
	instanceVariableNames: ''!

!classDefinition: #TonelWriter category: 'ExchangeFormat-Tonel-Lite'!
Object subclass: #TonelWriter
	instanceVariableNames: 'stream class category methods'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-Tonel-Lite'!
!classDefinition: 'TonelWriter class' category: 'ExchangeFormat-Tonel-Lite'!
TonelWriter class
	instanceVariableNames: ''!


!TrivialExample commentStamp: '<historical>' prior: 0!
I am a trivial Class which should never be instantiated.

	"Send $25 for Your Name Here"
	
Time donated to Cuis pays for itself!!

writer :=  TonelWriter on: 'TrivialExample.class.tonel.st' asFileEntry forceWriteStream.
writer writeClass: TrivialExample category: #'ExchangeFormat-Tonel-Lite'.
reader := TonelReader on: ('TrivialExample.class.st' asFileEntry) readStream.
reader read.
reader inspect.
!

!TonelPackage commentStamp: '<historical>' prior: 0!
I keep a list of class name strings for a given category.!

!TonelReader commentStamp: '<historical>' prior: 0!
stream  is a StandardFileStream, whose #name is a file path.

classComment  is nil or a class comment String.

classInfo  is an OrderedDictionary of class information, typical keys are:
   #category #name #superclass #classVars #instVars

methodInfos  is an OrderedCollection of OrderedDictionaries -- one for each method.
  Typical method keys are 
	#class ('CName' or 'CName class', a String)
	#category (a Symbol)
	#selector (e.g. #fooMeWith: , a Symbol)
	#signiture (e.g. 'fooMeWith: anotherFooBar' , a String )
	#body (a String which, composed with the #signiture, is the method's code)

codeType  is either:
	'Class' -- indicarting code for an entire class definition
	    or
	'Extension' -- indicating a set of methods extending an existing type
!

!TonelRepository commentStamp: '<historical>' prior: 0!
Directory of Tonel formatted source files.
!

!TonelWriter commentStamp: '<historical>' prior: 0!
I take a Cuis Class and write it out to a file in the Tonel exchange format.

I am not very bright, but perhaps you could fix that!!

writer :=  TonelWriter on: 'TrivialExample.class.tonel.st' asFileEntry forceWriteStream.
writer writeClass: TrivialExample category: #'ExchangeFormat-Tonel-Lite'.

!

!TonelTest methodsFor: 'private' stamp: 'KenD 4/19/2022 12:39:07'!
fileEntryFor: aClassSpec 

	^ (aClassSpec name , '.class.st') asFileEntry ! !

!TonelTest methodsFor: 'private' stamp: 'KenD 4/19/2022 12:43:58'!
readerFor: aClass 
	
	^ TonelReader on: (self fileEntryFor: aClass) readStream! !

!TonelTest methodsFor: 'private' stamp: 'KenD 4/19/2022 12:52:38'!
writerFor: aClass 
	"Create new file for aClass"
	^ TonelWriter on: (self fileEntryFor: aClass) forceWriteStream ! !

!TonelTest methodsFor: 'set up' stamp: 'KenD 4/19/2022 12:21:11'!
setUp 

	streams := Dictionary new! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/19/2022 12:21:39'!
test010writeObjectDefinition 
	| writer definition reader |
	writer := self writerFor: Object.
	writer writeClass: Object category: #Kernel.
	reader := self readerFor: Object.
	definition := reader read; definition.
	self
		assert: (definition at: #name) = #Object;
		assert: (definition at: #superclass) = #ProtoObject;
		assert: (definition at: #category) = #Kernel! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/22/2022 18:12:37'!
test014writeDefinitionWithClassVars 
	| writer definition reader |
	writer := self writerFor: Random.
	writer writeClass: Random category: #'Kernel-Numbers'.
	reader := self readerFor: Random.
	definition := reader read; definition.
	self
		assert: (definition at: #name) = #Random;
		assert: (definition at: #superclass) = #Object;
		assert: (definition at: #classVars) = #('DefaultInstance' 'MutexForDefaultInstance');
		assert: (definition at: #category) = #'Kernel-Numbers'
		! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/22/2022 15:51:50'!
test016writeDefinitionWithInstAndClassVars 
	| writer definition reader |
	writer := self writerFor: ContextPart.
	writer writeClass: ContextPart category: #'Kernel-Methods'.
	reader := self readerFor: ContextPart.
	definition := reader read; definition.
	self
		assert: (definition at: #name) = #ContextPart;
		assert: (definition at: #superclass) = ContextPart superclass name asSymbol;
		assert: (definition at: #instVars) = ContextPart instVarNames;
		assert: (definition at: #classVars) 
				= #('PrimitiveFailToken' 'QuickStep' 'ValueIndex');
		assert: (definition at: #category) = #'Kernel-Methods'! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/22/2022 14:50:09'!
test020writeOneMethod 
	| writer reader methods cm reconsitutedMethod |
	writer := self writerFor: Object.
	cm := Object >> #species.
	writer writeMethod: cm.
	reader := self readerFor: Object.
	methods := reader readMethods; methods.
	reconsitutedMethod := 
		(methods first at: #signature) , 
		(methods first at: #body).
	self
		assert: methods size = 1;
		assert: (methods first at: #class) = 'Object';
		assert: (methods first at: #selector) = #species;
		assert: cm source lines size = 8;
		assert: reconsitutedMethod withBlanksTrimmed lines
				= cm source withBlanksTrimmed lines! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/22/2022 15:16:08'!
test025writeOneMethodWithArguments 
	| writer reader methods cm reconsitutedMethod |
	writer := self writerFor: Object.
	cm := Object >> #adaptToFloat:andSend: .
	writer writeMethod: cm.
	reader := self readerFor: Object.
	methods := reader readMethods; methods.
	reconsitutedMethod := 
		(methods first at: #signature) , 
		(methods first at: #body).
	self
		assert: methods size = 1;
		assert: (methods first at: #class) = 'Object';
		assert: cm source lines size = 4;
		assert: (methods first at: #selector) = cm selector;
		assert: reconsitutedMethod withBlanksTrimmed lines
				= cm source withBlanksTrimmed lines! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/22/2022 15:10:50'!
test030writeTwoMethods 
	| cm1 cm2 writer reader methods m1 m2 |
	cm1 := Object >> #species.
	cm2 := Object >> #value.
	writer := self writerFor: Object.
	writer writeMethod: cm1; writeMethod: cm2.
	reader := self readerFor: Object.
	methods := reader readMethods; methods.
	m1 := (methods first at: #signature) , 
		  (methods first at: #body).
	m2 := (methods second at: #signature) , 
		  (methods second at: #body).
	self
		assert: methods size = 2;
		assert: (methods first at: #class) = 'Object';
		assert: (methods first at: #selector) = #species;
		assert: cm1 source lines size = 8;
		assert: m1 withBlanksTrimmed lines = cm1 source withBlanksTrimmed lines;
		assert: (methods second at: #class) = 'Object';
		assert: (methods second at: #selector) = #value;
		assert: cm2 source lines size = 3;
		assert: m2 withBlanksTrimmed lines = cm2 source withBlanksTrimmed lines! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 11/14/2022 14:30:51'!
testClassDefinition 
	| writer reader definition |
	writer := TonelWriter on: '' writeStream.
	writer writeClass: Point.
	reader := TonelReader on: writer contents readStream.
	reader read.
	definition := reader definition.
	self
		assert: (definition at: #name) = #Point;
		assert: (definition at: #instVars) = #('x' 'y')! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/19/2022 12:28:01'!
testExtension 
	| tonel writer reader method |
	tonel := '' writeStream.
	writer := TonelWriter on: tonel.
	writer writeMethods: {TonelTest >> #testExtension}.
	reader := TonelReader on: tonel contents readStream.
	reader read.
	self assert: reader methods size = 1.
	method := reader methods anyOne.
	self
		assert: (method at: #class) = 'TonelTest';
		assert: (method at: #selector) == #testExtension! !

!TonelTest methodsFor: 'testing' stamp: 'KenD 4/19/2022 12:33:33'!
testReadMethodWithLiteralBracket 
	| tonel reader |
	tonel := 'Extension { #name : #TonelTest }
{
	#category : #accessing
}
TestClass >> m [
	$]]'.

	reader := TonelReader on: tonel readStream.
	reader read.
	self
		assert: reader methods size = 1;
		assert: (reader methods anyOne at: #body) trimBlanks = '$]' ! !

!TrivialExample methodsFor: 'failing' stamp: 'KenD 4/27/2022 12:42:09'!
explain: rationale to: entity

	"No answers to some questions"
	self flag: #RationaleIsBogus.
	entity add: rationale.
! !

!TrivialExample class methodsFor: 'class initialization' stamp: 'KenD 4/27/2022 12:38:58'!
initialize

	Stooges := {}.
	! !

!TonelPackage methodsFor: 'accessing' stamp: 'KenD 5/6/2022 15:04:51'!
category

	^ category ! !

!TonelPackage methodsFor: 'accessing' stamp: 'KenD 5/6/2022 15:05:02'!
classList

	^ classList ! !

!TonelPackage methodsFor: 'initialization' stamp: 'KenD 5/6/2022 15:02:05'!
category: aCategory classList: aClassList

	category := aCategory.
	classList := aClassList ! !

!TonelPackage class methodsFor: 'instance creation' stamp: 'KenD 5/6/2022 15:02:40'!
category: aCategory classList: aClassList

	^ self new 
		category: aCategory classList: aClassList! !

!TonelPackage class methodsFor: 'instance creation' stamp: 'KenD 5/6/2022 15:12:32'!
fromReader: aTonelReader

	aTonelReader read. "Should have been done, but harmless"
	^ self new 
		category: (aTonelReader classInfo at: #name)
		classList: (aTonelReader classInfo at: #classes)! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 4/30/2022 07:55:51'!
baseNameForFileOut
	
	^ (classInfo at: #name), '.', codeType, '.st'
! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 4/28/2022 10:51:47'!
classComment

	^ classComment! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 4/28/2022 10:52:03'!
classInfo 

	^ classInfo! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 5/6/2022 15:15:57'!
fileOut
	"I represent a Class or a set of Extension methods to a Class.
	 File me out in Cuis' Chunk Format."
	codeType ifNil: [ self read ].
	
	(codeType = 'Class') 	ifTrue: [^self fileOutCompleteClass].
	
	(codeType = 'Extension') ifTrue: [^self fileOutExtensionMethods].
	
	(codeType = 'Package') ifTrue: [^self fileOutPackageDoIt].
	
	self inform: 'TonelReader: PROBLEM WITH FILEOUT DATA'.
	! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 5/6/2022 15:17:12'!
fileOutToStream: aFileStream
	"I represent a Class or a set of Extension methods to a Class.
	 File me out in Cuis' Chunk Format."
	codeType ifNil: [ self read ].
	
	(codeType = 'Class') 	
		ifTrue: [^self fileOutCompleteClassTo: aFileStream].
	
	(codeType = 'Extension') 
		ifTrue: [^self fileOutExtensionMethodsTo: aFileStream].
	
	(codeType = 'Package') 
		ifTrue: [^self fileOutPackageDoItTo: aFileStream].
	
	self inform: 'TonelReader: PROBLEM WITH FILEOUT DATA'.
	! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 4/26/2022 16:04:17'!
filePath

	^ stream name! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 4/28/2022 10:52:26'!
methodInfos

	^ methodInfos! !

!TonelReader methodsFor: 'accessing' stamp: 'KenD 4/19/2022 08:05:10'!
stream: aReadStream 

	stream := aReadStream! !

!TonelReader methodsFor: 'initialization' stamp: 'KenD 4/28/2022 10:52:26'!
initialize 

	classInfo      := OrderedDictionary new.
	methodInfos := OrderedCollection new! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 11/14/2022 16:07:13'!
nextBlock 
	"(stream at: position) is $[, find matching unnested $]
	 and answer the body "
	| nested char start  prev |
	nested := 0.
	prev := nil.
	char := $[.
	self skipLine.
	start := stream position.
	[	(char = $[ andNot: [prev = $$]) ifTrue: [nested := nested + 1].
		(char = $]   andNot: [prev = $$]) ifTrue: [nested := nested - 1].
		(char = $' andNot: [prev = $$]) ifTrue: [prev := char. self skipString].
		(char = $" andNot: [prev = $$]) ifTrue: [prev := char. self skipComment].
		prev := char. 
		nested = 0]
		whileFalse: [char := stream next].
	
	^ stream copyFrom: start to: stream position - 1 "Elide final $]"
! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 4/26/2022 15:38:06'!
read

	self
		readClassComment;
		readType;
		readDefinition;
		readMethods! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 4/29/2022 12:55:36'!
readClassComment 
	"A Class Comment, if used, 
	 is the first bit of syntax in a Tonel class codefile"
	stream position: 0. "Start at the beginning"
	stream skipSeparators.
	stream peek = $" ifTrue: [
		classComment := self readComment
	]
! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 4/27/2022 10:29:43'!
readComment 
	"(stream at: position) is $"", find matching $""
	 and answer the body "
	
	| char commentStream |
	char := stream next. "We know it is $"" ; skip it".
	commentStream := String new writeStream.
	char := stream next.
	[ [ char = $" ] 
	  whileFalse: [ commentStream nextPut: char. char := stream next].
	  (stream peek = $") 
	]
	whileTrue: [ char := stream next. "Step over 1st dquote"
		commentStream nextPut: char.  "Add single dquote"
		char := stream next "Step over 2nd dquote"
	].

	^ commentStream contents
	
! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 4/28/2022 10:52:03'!
readDefinition 

	STONReader new
		on: stream skipSeparators;
		parseMapDo: [:key :value | classInfo at: key put: value]! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 5/17/2022 15:47:53'!
readMethod 
	| metadata classname signature selector method |
	metadata := STON fromStream: stream.
	classname := (stream skipSeparators; upToAll: '>>') withBlanksTrimmed.
	signature := stream upTo: $[.
	selector := Parser selectorFrom: signature.
	method := OrderedDictionary new.
	method
		addAll: metadata;
		at: #class 
			put: classname withoutLineSeparators withBlanksTrimmed;
		at: #signature 
			put: signature withBlanksCondensed;
		at: #selector 
			put: selector;
		at: #body 
			put: self nextBlock.
	methodInfos add: method! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 4/19/2022 08:03:23'!
readMethods 

	[stream skipSeparators; atEnd] 
		whileFalse: [self readMethod]! !

!TonelReader methodsFor: 'reading' stamp: 'KenD 5/6/2022 14:31:55'!
readType 
	"codeType is either
		'Class' indicarting code for an entire class definition
	or
		'Extension' indicating a set of methods extending an existing type
	or 
		'Package' indicating a category (#name) 
		  and collection of class names (#classes)
	"
	codeType := stream skipSeparators; nextWordOrNumber.
	( #( 'Class' 'Extension' 'Package' ) includes: codeType )
		ifFalse: [self error: 'unsupported type ', codeType ]! !

!TonelReader methodsFor: 'test access' stamp: 'KenD 4/26/2022 16:19:53'!
definition

	^ self classInfo ! !

!TonelReader methodsFor: 'test access' stamp: 'KenD 4/26/2022 16:20:19'!
methods

	^ self methodInfos ! !

!TonelReader methodsFor: 'private' stamp: 'KenD 4/20/2022 14:18:18'!
skipComment 

	self skipToMatch: $"! !

!TonelReader methodsFor: 'private' stamp: 'KenD 4/20/2022 14:29:43'!
skipLine

	[stream atEnd]
		whileFalse:
		[stream next isLineSeparator ifTrue: [^ self ]]! !

!TonelReader methodsFor: 'private' stamp: 'KenD 4/20/2022 14:18:33'!
skipString 

	self skipToMatch: $'! !

!TonelReader methodsFor: 'private' stamp: 'KenD 4/20/2022 14:18:51'!
skipToMatch: aCharacter 
	[| found |
		found := stream skipTo: aCharacter.
		found ifFalse: [self error: aCharacter storeString , ' end expected'].
		stream peek = aCharacter ifTrue: [
			stream next.
			found := false].
		found] whileFalse! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/29/2022 15:13:39'!
fileOutClassCommentTo: aFileStream
	"Tonel does not keep author & timestamp metaData"

	classComment ifNil: [ ^nil ]. "Skip if unused"
	aFileStream 
		nextPut: $!! ;
		nextPutAll: (classInfo at: #name) asString;
		nextPutAll: ' commentStamp: ''<historical>'' prior: 0!!';
		newLine.
		
	aFileStream 
		nextChunkPut: classComment;
		newLine; 
		newLine.
			
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/2/2022 15:39:24'!
fileOutClassInfoTo: aFileStream

	aFileStream 
		timeStamp;
		nextPutAll: '!!classDefinition: ' ;
		nextPutAll: (classInfo at: #name) printString;
		nextPutAll: ' category: ', (classInfo at: #category) printString, '!!';
		newLine.
		
	aFileStream 
		nextPutAll: (classInfo at: #superclass) asString;
		nextPutAll: ' subclass: ', (classInfo at: #name) printString;
		newLine.
		
	aFileStream tab;
		nextPutAll: 'instanceVariableNames: '.
	self fileOutNamesAsString: (classInfo at: #instVars ifAbsent: ['']) 
		on: aFileStream.
	aFileStream newLine.
	
	aFileStream tab;
		nextPutAll: 'classVariableNames: '.
	self fileOutNamesAsString: (classInfo at: #classVars ifAbsent: ['']) 
		on: aFileStream.
	aFileStream newLine.
	
	aFileStream tab;
		nextPutAll: 'poolDictionaries: '.
	self fileOutNamesAsString: (classInfo at: #pools ifAbsent: ['']) 
		on: aFileStream.
	aFileStream newLine.

	aFileStream tab;
		nextPutAll: 'category: ';
		nextPutAll: (classInfo at: #category) asString printString.
		
	aFileStream nextPut: $!!; newLine.
	
	self fileOutClassCommentTo: aFileStream
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/1/2022 12:12:40'!
fileOutClassMethodPrefixTo: aFileStream

	| classString |
	classString := (classInfo at: #name) asString, ' class'.
	aFileStream 
		newLine; 
		nextPutAll: '"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!!'; 
		newLine; 
		newLine.
	aFileStream 
		nextPut: $!! ;
		nextPutAll: 'classDefinition: ', classString printString;
		nextPutAll:  ' category: ', (classInfo at: #category) printString;
		nextPut: $!! ;
		newLine.
	aFileStream
		nextPutAll: classString;
		newLine; tab;
		nextPutAll: 'instanceVariableNames: '.
	self fileOutNamesAsString: (classInfo at: #classVars ifAbsent: ['']) 
		on: aFileStream.
	aFileStream 
		nextPut: $!! ;
		newLine;
		newLine.

		
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/30/2022 08:16:41'!
fileOutClassMethodSuffixTo: aFileStream
	"Add initilize DoIt if required"
	(methodInfos detect: [ :mi | (mi at: #selector) = #initialize ] ifNone: [ nil ])
	ifNotNil: [ :ignored |
		aFileStream 
			newLine;
			nextChunkPut: (classInfo at: #name) asString , ' initialize';
			newLine
	]
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/6/2022 15:49:38'!
fileOutCompleteClass
	"I read in a complete Class definition; write out in Cuis's Chunk Format."
	| writeStream |
	writeStream := self writeStreamForFileOut.
	writeStream 
		ifNil: [ self inform: 'Nothing written'. ^nil ]
		ifNotNil: [ self fileOutCompleteClassTo: writeStream ]
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/30/2022 09:36:28'!
fileOutCompleteClassTo: aFileStream
	"I read in a complete Class definition; write out in Cuis's Chunk Format."

	aFileStream ifNil: [ self inform: 'Nothing written'. ^nil ].
	[ 	self fileOutClassInfoTo: aFileStream.
		self fileOutMethodInfosTo: aFileStream.
	] ensure: [ aFileStream close ].
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/30/2022 13:55:18'!
fileOutExtensionHeadertTo: aFileStream

	aFileStream 
		timeStamp;
		newLine; 
		newLine.
		! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/1/2022 12:46:32'!
fileOutExtensionMethodInfosTo: aFileStream

	| instMInfos classMInfos |
	instMInfos := methodInfos select: [ :mi | ((mi at: #class) endsWith: 'class') not ].
	classMInfos := methodInfos select: [ :cmi | (cmi at: #class) endsWith: 'class' ].
	instMInfos do: [ :mi | self fileOutMethodInfoTo: aFileStream forMethod: mi ].
	classMInfos do: [ :mi | self fileOutMethodInfoTo: aFileStream forMethod: mi ].
	aFileStream newLine.
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/6/2022 15:47:01'!
fileOutExtensionMethods
	"I read in a Class extension (new methods for an existing class); 
	 write out in Cuis's Chunk Format."
	| writeStream |
	writeStream := self writeStreamForFileOut.
	writeStream 
		ifNil: [ self inform: 'Nothing written'. ^nil ]
		ifNotNil: [ self fileOutExtensionMethodsTo: writeStream ]

	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/1/2022 12:47:27'!
fileOutExtensionMethodsTo: aFileStream
	"I read in a Class extension (new methods for an existing class); 
	 write out in Cuis's Chunk Format."
	aFileStream ifNil: [ self inform: 'Nothing written'. ^nil ].
	[ 	self fileOutExtensionHeadertTo: aFileStream.
		self fileOutExtensionMethodInfosTo: aFileStream.
	] ensure: [ aFileStream close ].
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/1/2022 13:12:09'!
fileOutMethodInfoTo: aFileStream forMethod: methodInfo
	"File out code chunk for a single method."
	aFileStream 
		nextPut: $!! ;
		nextPutAll: (methodInfo at: #class) asString;
		nextPutAll: ' methodsFor:  ', (methodInfo at: #category) asString printString;
		nextPutAll: ' stamp: ', Utilities changeStamp printString;
		nextPut: $!! ;
		newLine.
	
	aFileStream 
		nextChunkPut: (methodInfo at: #signature) , (methodInfo at: #body);
		nextPutAll: ' !!' ;
		newLine;
		newLine.
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/29/2022 15:22:50'!
fileOutMethodInfosTo: aFileStream

	| instMInfos classMInfos |
	instMInfos := methodInfos select: [ :mi | ((mi at: #class) endsWith: 'class') not ].
	classMInfos := methodInfos select: [ :mi | (mi at: #class) endsWith: 'class' ].
	instMInfos do: [ :mi | self fileOutMethodInfoTo: aFileStream forMethod: mi ].
	self fileOutClassMethodPrefixTo: aFileStream.
	classMInfos do: [ :mi | self fileOutMethodInfoTo: aFileStream forMethod: mi ].
	self fileOutClassMethodSuffixTo: aFileStream.
	aFileStream newLine.
	! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/29/2022 15:08:43'!
fileOutNamesAsString: anArrayOfSymbols on: aWriteStream

	| first |
	first := true.
	aWriteStream nextPut: $' .
	anArrayOfSymbols do: [ :sym |
		first ifTrue: [first := false] ifFalse: [aWriteStream space].
		aWriteStream nextPutAll: sym asString
	].
	aWriteStream nextPut: $' .! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/6/2022 15:48:02'!
fileOutPackageDoIt

	| writeStream |
	writeStream := self writeStreamForFileOut.
	writeStream 
		ifNil: [ self inform: 'Nothing written'. ^nil ]
		ifNotNil: [ self fileOutPackageDoItTo: writeStream ]
! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 5/6/2022 16:05:50'!
fileOutPackageDoItTo: aFileStream

	aFileStream 
		timeStamp;
		newLine;
		nextPutAll: 'Smalltalk at: #CurrentTonelPackage put: (TonelPackage category: ';
		nextPutAll: (classInfo at: #name) printString;
		newLine;
		nextPutAll: ' classList: ';
		nextPutAll: (classInfo at: #classes) printString;
		nextPutAll: ' ).';
		newLine! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/30/2022 07:56:29'!
writeStreamForFileOut
	"Answer an appropriate stream or nil.
	 Stream will be opened on a fresh (empty) file."
	| fileName fileEntry className |
	className := classInfo at: #name.
	fileName := stream name asFileEntry parent 
				pathName, '/', self baseNameForFileOut.
	fileEntry := fileName asFileEntry.
	(fileEntry exists) ifTrue: [
		(PopUpMenu confirm: className, '.', codeType, '.st Exists. Overwrite?')
			ifFalse: [^nil]
	].
	^ fileEntry forceWriteStream.
! !

!TonelReader methodsFor: 'private fileOut' stamp: 'KenD 4/30/2022 09:31:53'!
writeStreamForFileOut: dirPathString
	"Answer an appropriate stream or nil.
	 Stream will be opened on a fresh (empty) file."
	| fileName fileEntry className |
	className := classInfo at: #name.
	fileName := dirPathString, '/', self baseNameForFileOut.
	fileEntry := fileName asFileEntry.
	(fileEntry exists) ifTrue: [
		(PopUpMenu confirm: className, '.', codeType, '.st Exists. Overwrite?')
			ifFalse: [^nil]
	].
	^ fileEntry forceWriteStream.
! !

!TonelReader class methodsFor: 'instance creation' stamp: 'KenD 4/19/2022 07:51:29'!
new 

	^ super new initialize! !

!TonelReader class methodsFor: 'instance creation' stamp: 'KenD 4/19/2022 07:51:56'!
on: aStream 

	^ self new stream: aStream! !

!TonelReader class methodsFor: 'translteration' stamp: 'KenD 5/1/2022 12:47:06'!
chunkFromTonel: aFileEntry
	"FileEntry is assumed to be a Tonel file.
	 Read it in an write a Chunk file to correspond.
	Answer nil or a fileEntry on the chunk file"
	| reader parentDirName answer outFile newName |
	answer := nil.
	parentDirName := aFileEntry parent pathName.
	reader := self on: aFileEntry readStream.
	[ reader read.
	  outFile := reader writeStreamForFileOut: parentDirName.
	  outFile ifNotNil: [
		newName := outFile name.
		reader fileOutToStream: outFile.
		outFile close.
		answer := newName asFileEntry.
		].
	] ensure: [ "empty" ].

	^ answer! !

!TonelRepository methodsFor: 'processing' stamp: 'KenD 5/24/2022 11:43:02'!
clean

	^self 
		flag: #WTF;
		inform: 'RingEnv ''clean'' semantics ?!!?';
		yourself! !

!TonelRepository methodsFor: 'initialization' stamp: 'KenD 5/23/2022 15:45:19'!
asRingEnvironmentWith: arrayofCategorySymbols

	categories := Dictionary new.
	self flag: #RingEnvironment.
	arrayofCategorySymbols do: [ :sym | | readerDict |
		readerDict := Dictionary new.
		categories at: sym put: readerDict.
		self packagesOf: sym into: readerDict.
	].
		
	^ self	! !

!TonelRepository methodsFor: 'initialization' stamp: 'KenD 5/6/2022 07:49:26'!
directory: pathOrDirEntry

	(pathOrDirEntry is: #String)
		ifTrue:  [ dirEntry := pathOrDirEntry asDirectoryEntry ]
		ifFalse:  [ dirEntry := pathOrDirEntry ]
	! !

!TonelRepository methodsFor: 'initialization' stamp: 'KenD 5/23/2022 16:19:57'!
packagesOf: sym into: readerDict

	| pkgDir pkg pkgReader |
	pkgDir := dirEntry / sym asString.
	pkg := pkgDir // 'package.st'.
	pkgReader := TonelReader on: pkg readStream.
	pkgReader read.
	readerDict at: #package put: (pkgReader classInfo at: #name).
	(pkgReader classInfo at: #classes) do: [ :classNameString | |classReader|
		classReader := TonelReader on: (pkgDir // (classNameString , '.st')) readStream.
		readerDict 
			at: classNameString asSymbol
			put: classReader read.
		].
	^self
	
	
	! !

!TonelWriter methodsFor: 'accessing' stamp: 'KenD 4/19/2022 08:11:43'!
category: aString 

	category := aString! !

!TonelWriter methodsFor: 'accessing' stamp: 'KenD 4/19/2022 10:31:50'!
class: aClass 

	class := aClass! !

!TonelWriter methodsFor: 'accessing' stamp: 'KenD 11/14/2022 14:30:07'!
contents

	^ stream contents! !

!TonelWriter methodsFor: 'accessing' stamp: 'KenD 4/19/2022 10:36:31'!
methods 

	methods notNil ifTrue: [ ^methods ].
	class isNil ifTrue: [ ^#() ].
	^ class class methodDictionary asArray & class methodDictionary asArray! !

!TonelWriter methodsFor: 'accessing' stamp: 'KenD 4/22/2022 16:17:36'!
methods: aCollection 

	methods := aCollection.
	self assert: (methods isEmptyOrNil or: [| classes |
		classes := methods collect: [ :m |m classBinding] in: Set new.
		classes size = 1 or: [
			classes size = 2 and: [| meta |
				meta := classes detect: [:cls | cls isMetaclass] ifNone: nil.
				meta notNil and: [classes anySatisfy: [:cls | cls isKindOf:  meta]]]]])! !

!TonelWriter methodsFor: 'accessing' stamp: 'KenD 4/19/2022 11:05:27'!
stream: aWriteStream 

	stream := aWriteStream! !

!TonelWriter methodsFor: 'private' stamp: 'KenD 4/19/2022 10:32:20'!
crtab 

	stream crtab! !

!TonelWriter methodsFor: 'private' stamp: 'KenD 5/3/2022 16:58:04'!
definition 
	| map supername |
	map := OrderedDictionary new.
	self isExtension
		ifTrue: [^ map
			at: #name put: methods anyOne classBinding name asSymbol;
			yourself].
	supername := (class respondsTo: #supername)
		ifTrue: [class supername]
		ifFalse: [class superclass ifNotNil: [:c | c name]].
	map
		at: #name put: class name asSymbol;
		at: #superclass put: supername asSymbol.
	class _instancesHavePointers
		ifTrue: [class _instancesAreArrayed ifTrue: [map at: #type put: #variable]]
		ifFalse: [map at: #type put: #bytes].
	map
		at: #instVars put: class instVarNames;
		at: #classVars put: (class classVarNames collect: [ :n | n asString ]) asSortedCollection asArray.
	category notNil ifTrue: [map at: #category put: category asSymbol].
	(class sharedPoolsString size isZero) 
		ifFalse:  [map at: #pools put: (class sharedPoolsString findTokens: ' ') asArray].
	
	^ map! !

!TonelWriter methodsFor: 'private' stamp: 'KenD 4/20/2022 14:03:20'!
flush

	stream flush! !

!TonelWriter methodsFor: 'private' stamp: 'KenD 4/19/2022 10:40:19'!
position: aStream afterSelector: aSymbol 
	| c |
	aSymbol arity = 0
		ifTrue: [aStream skipSeparators; skip: aSymbol size]
		ifFalse: [
			aSymbol keywords do: [:part | 
				aStream
					skipSeparators;
					skip: part size;
					skipSeparators;
					nextKeyword
			]
		].
	[aStream atEnd ifTrue: [^self].
	 c := aStream peek.
	 c isSeparator andNot: [c isLineSeparator]]
		whileTrue: [aStream next].
	c isLineSeparator ifTrue: [aStream next]
! !

!TonelWriter methodsFor: 'private' stamp: 'KenD 4/19/2022 11:06:04'!
type 

	^ class notNil ifTrue: [ 'Class' ] ifFalse: [ 'Extension' ]! !

!TonelWriter methodsFor: 'testing' stamp: 'KenD 4/19/2022 10:35:06'!
isExtension 

	^ self type = 'Extension'! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/27/2022 07:18:57'!
write 

	self
		writeClassComment;
		writeType;
		writeDefinition;
		writeMethods;
		flush! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/19/2022 11:07:34'!
writeClass: aClass 

	self writeClass: aClass category: nil! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/27/2022 10:37:22'!
writeClass: aClass category: aString 

	aClass ifNotNil: [ :cls |
		self
			class: aClass;
			category: aString;
			methods: nil;
			write
	]! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/27/2022 10:36:12'!
writeClassComment
	"Class comment String needs double quotes
	 on each end; interior double quotes doubled"
	| quoteString |
	quoteString := class ifNotNil: [ :cl | cl comment ] ifNil: [ nil ].
	quoteString ifNotNil: [ :str |
		stream nextPut: $" .
		str do: [ :char |
			stream  nextPut: char.
			(char = $") ifTrue: [ stream  nextPut: char ]
		].
		stream
			nextPut: $" ;
			newLine;
			newLine
	].
	! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/22/2022 15:39:34'!
writeDefinition 

	(STONWriter on: stream) 
		prettyPrint: true;
		writeMap: self definition.
	stream newLine ; newLine! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/23/2022 15:13:50'!
writeMethod: method 
	| source head body metadata |
	source := method sourceCode readStream.
	self position: source afterSelector: method selector.
	head := source copyFrom: 1 to: source position.
	body := source upToEnd.
	metadata := OrderedDictionary new.
	metadata at: #category put: method category.
	(STONWriter on: stream) prettyPrint: true; writeMap: metadata.
	stream 
		newLine; 
		nextPutAll: method classBinding name asString; 
		nextPutAll: ' >> ';
		nextPutAll: head withoutLineSeparators;
		nextPutAll: ' ['.
	"body := body readStream.
	[	stream 
			newLine; 
			nextPutAll: body nextLine.
		body atEnd] whileFalse."
	stream newLine; nextPutAll: body.
	
	stream nextPutAll: ']'; newLine; newLine;
	flush! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/19/2022 11:10:19'!
writeMethods 

	self methods do: [:m | self writeMethod: m]! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/19/2022 11:10:30'!
writeMethods: aCollection 

	self class: nil; methods: aCollection; write! !

!TonelWriter methodsFor: 'writing' stamp: 'KenD 4/19/2022 11:10:43'!
writeType 

	stream nextPutAll: self type; space! !

!TonelWriter class methodsFor: 'instance creation' stamp: 'KenD 4/19/2022 08:09:27'!
on: aWriteStream 

	^ self new stream: aWriteStream! !

!TonelWriter class methodsFor: 'instance creation' stamp: 'KenD 4/19/2022 08:09:47'!
writeClass: aClass 
	"
	TonelWriter writeClass: Point
	"
	^self writeClass: aClass category: nil! !

!TonelWriter class methodsFor: 'instance creation' stamp: 'KenD 4/19/2022 08:10:14'!
writeClass: aClass category: aString 
	"
	TonelWriter writeClass: Point category: 'Kernel'
	"
	| tonel |
	tonel := '' writeStream.
	(self on: tonel) writeClass: aClass category: aString.
	^tonel contents! !

!TonelWriter class methodsFor: 'instance creation' stamp: 'KenD 4/19/2022 08:10:43'!
writeMethods: aCollection 
	"
	TonelWriter writeMethods: Point methodDictionary asArray
	"
	| tonel |
	tonel := '' writeStream.
	(self on: tonel) writeMethods: aCollection.
	
	^ tonel contents! !

!CodeFileBrowser class methodsFor: '*ExchangeFormat-Tonel-Lite' stamp: 'KenD 4/30/2022 09:41:04'!
browseCodeFileEntry: aFileEntry
	"Check for Tonel Format vs Chunk Format based on 1st character"
	| char entryToUse |
	entryToUse := aFileEntry.
	char := aFileEntry readStream peek.
	"Chunk files typically begin with $!! or $' ( 'From Cuis..) "
	('!!''' includes: char) ifFalse: [
		(PopUpMenu confirm: 'Looks like a Tonel File. OK to write a Chunk File?' )
		ifTrue: [ | altFileEntry |
			altFileEntry := TonelReader chunkFromTonel: aFileEntry.
			altFileEntry ifNotNil: [ :ignored | entryToUse := altFileEntry ].
		]
	].
	
	^ self browseCodeSource: (CodeFile newFromFile: entryToUse )! !
TrivialExample initialize!
