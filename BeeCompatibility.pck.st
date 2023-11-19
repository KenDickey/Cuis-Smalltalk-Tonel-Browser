'From Cuis 6.0 [latest update: #6072] on 19 November 2023 at 1:19:09 pm'!
'Description Bee compatibile!!'!
!provides: 'BeeCompatibility' 1 45!
!requires: 'Cuis-Base' 60 5593 nil!
!requires: 'SqueakCompatibility' 1 35 nil!
SystemOrganization addCategory: #BeeCompatibility!


!classDefinition: #TargetOSPlatform category: #BeeCompatibility!
Object subclass: #TargetOSPlatform
	instanceVariableNames: ''
	classVariableNames: 'CPU OS WordSizeInBits'
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'TargetOSPlatform class' category: #BeeCompatibility!
TargetOSPlatform class
	instanceVariableNames: ''!


!TargetOSPlatform commentStamp: '<historical>' prior: 0!
I am working around current target system assumptions.

Nota Bene: x86:64 Linux => See  TargetOSPlatform class >> initialize

For current system, note:
  	Smalltalk wordSize.  "8  => number of Bytes" 
	Smalltalk platformName ." 'unix' "
	Smalltalk platformSubtype. " 'aarch64' "
	Smalltalk osVersion ." 'linux-gnu' "
	!

!TargetOSPlatform methodsFor: 'testing' stamp: 'KenD 2/24/2021 14:36:38'!
isUnix64

	^true! !

!TargetOSPlatform methodsFor: 'testing' stamp: 'KenD 2/24/2021 14:36:26'!
isWin64

	^false! !

!TargetOSPlatform class methodsFor: 'class initialization' stamp: 'KenD 2/24/2021 14:24:04'!
initialize
	"Nota Bene: x86:64"
	CPU := #Intel.
	OS := #Linux.
	WordSizeInBits := 64.! !

!TargetOSPlatform class methodsFor: 'accessing' stamp: 'KenD 2/24/2021 14:27:13'!
targetCPU

	^CPU! !

!TargetOSPlatform class methodsFor: 'accessing' stamp: 'KenD 2/24/2021 14:27:45'!
targetOS

	^OS ! !

!TargetOSPlatform class methodsFor: 'accessing' stamp: 'KenD 2/24/2021 14:32:24'!
targetWordSizeInBits

	^WordSizeInBits ! !

!TargetOSPlatform class methodsFor: 'instance creation' stamp: 'KenD 6/18/2021 12:28:07'!
current

	^self new initialize.! !

!Boolean methodsFor: '*BeeCompatibility' stamp: 'KenD 6/8/2021 07:04:59'!
andNot: aBlock

	self subclassResponsibility ! !

!Boolean methodsFor: '*BeeCompatibility' stamp: 'KenD 10/2/2022 08:15:58'!
asBit

	self subclassResponsibility ! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 10/2/2022 08:16:20'!
asBit

	^ 0! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 11:00:52'!
asParameter 
	"Answer machine value for falsity"
	^ 0! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 10/2/2022 08:16:37'!
asBit

	^ 1! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 10:59:03'!
asParameter 
	"Answer machine value for truth"
	^ 1! !

!SmallInteger methodsFor: '*BeeCompatibility' stamp: 'KenD 9/30/2022 15:33:32'!
byteAt: n
	"Treat me as a byte array"
	(n = 1) ifTrue: [
		"Negate, but watch case where I am 'SmallInteger minval'"
		^ self < 0
			ifTrue: [ -255 - self bitAnd: 255 ]
			ifFalse: [ self bitAnd: 255 ]
	].
	^ self < 0
		ifTrue: [  (-256 - self bitShift: -8) + 1 byteAt: n - 1 ] 
		ifFalse: [ (self bitShift: 8 -  (n bitShift: 3)) bitAnd: 255 ]! !

!SmallInteger methodsFor: '*BeeCompatibility' stamp: 'KenD 9/28/2022 13:49:02'!
thru: largerNumber

	^ Stretch from: self thru: largerNumber ! !

!UndefinedObject methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 11:02:35'!
asParameter 
	"Answer machine value for 'no value'"
	^ 0! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 5/18/2022 14:58:51'!
instanceBehavior
	self flag: #PossiblyBogus. "Probably bogus"
	^ self methodDict ! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 1/31/2023 09:48:16'!
methodNamed: selector 
	"Answer the compiled method associated with the argument, selector (a 
	Symbol), a message selector in the receiver's method dictionary. If the 
	selector is not in the dictionary, create an error notification."

	^self compiledMethodAt: selector 
! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 1/31/2023 09:50:45'!
removeLocalMethod: selector 
	"Assuming that the argument, selector (a Symbol), is a message selector 
	in my method dictionary, remove it and its method."

	self basicRemoveSelector: selector ! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 14:24:21'!
_instancesAreArrayed

	^ self isVariable ! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 14:23:46'!
_instancesHavePointers

	^ self isPointers ! !

!Metaclass methodsFor: '*BeeCompatibility' stamp: 'KenD 4/22/2022 16:14:43'!
isMetaclass

	^ self isMeta ! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 9/30/2022 13:00:20'!
!!= aCodePointOrCharacter

	^(self = aCodePointOrCharacter) not! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 2/16/2021 12:39:58'!
isASCIILetter

	^'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' includes: self! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 5/31/2021 08:03:14'!
split: aString
	"Answer a collection of Strings split at self -- include empty strings"
	| delimiter parts keyStart keyStop |
	delimiter := self asString.
	parts _ OrderedCollection new.
	keyStop _ 1.
	keyStart _ 1.
	[keyStop <= aString size] whileTrue:
		[keyStop _ aString findDelimiters: delimiter startingAt: keyStart.
		 (keyStart < keyStop)
			ifTrue: [parts add: (aString copyFrom: keyStart to: (keyStop - 1))]
			ifFalse: [parts add: ''].
		keyStart := keyStop + 1].
	^parts! !

!UnicodeCodePoint methodsFor: '*BeeCompatibility' stamp: 'KenD 11/12/2022 13:27:49'!
!!= aCodePointOrCharacter

	^(self = aCodePointOrCharacter) not! !

!UnicodeCodePoint methodsFor: '*BeeCompatibility' stamp: 'KenD 11/12/2022 13:27:58'!
isASCIILetter

	^'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' includes: self! !

!UnicodeCodePoint methodsFor: '*BeeCompatibility' stamp: 'KenD 11/12/2022 13:28:05'!
isHexDigit

	^'0123456789abcdefABCDEF' includes: self! !

!UnicodeCodePoint methodsFor: '*BeeCompatibility' stamp: 'KenD 11/12/2022 13:28:12'!
split: aString
	"Answer a collection of Strings split at self -- include empty strings"
	| delimiter parts keyStart keyStop |
	delimiter := self asString.
	parts _ OrderedCollection new.
	keyStop _ 1.
	keyStart _ 1.
	[keyStop <= aString size] whileTrue:
		[keyStop _ aString findDelimiters: delimiter startingAt: keyStart.
		 (keyStart < keyStop)
			ifTrue: [parts add: (aString copyFrom: keyStart to: (keyStop - 1))]
			ifFalse: [parts add: ''].
		keyStart := keyStop + 1].
	^parts! !

!Collection methodsFor: '*BeeCompatibility' stamp: 'KenD 11/19/2023 13:19:05'!
reject: rejectBlock thenDo: doBlock 	
"Utility method to improve readability.	Do not create the intermediate collection."	

	self do: [ :each |		(rejectBlock value: each)			ifFalse: [ doBlock value: each ] ].! !

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 5/18/2022 14:00:52'!
ifAbsentAdd: anObject 
	"Ensure anObject is part of the receiver. 
	 Answer whether its membership was newly acquired."
	| isCurrentMember |
	isCurrentMember := self includes: anObject.
	isCurrentMember 	ifFalse: [ self add: anObject ].
	^ isCurrentMember! !

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 11/18/2023 14:38:31'!
reject: rejectBlock thenDo: aBlock	
"Refer to the comment in Collection>>#reject:thenDo:"		
"(Array streamContents: [:stream | #(1 2 3 4) 
	reject: [:each | each = 3 ] 
	thenDo: [:each | stream nextPut: each + 10]])
  >>> #(11 12 14)"
	|  each |		
	1 to: self size do: [ :index |		
		(rejectBlock value: (each := self at: index))			ifFalse: [ aBlock value: each ]].! !

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 5/5/2022 11:51:37'!
sortBy: blockOrCriteria
	"My elements to be ordered 
	 by criteria (a Selector Symbol) 
	 or by using a sortblock."
	| sortBlock sorted |
	(blockOrCriteria is: #Symbol)
		ifTrue:  [ sortBlock := [ :a :b | 
					(a perform: blockOrCriteria) 
					<= (b  perform: blockOrCriteria) ] 
		]
		ifFalse: [ sortBlock := blockOrCriteria ].
	sorted := self asSortedCollection: sortBlock.
	^ self species withAll: sorted! !

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 5/18/2022 13:38:42'!
withoutDuplicates
	"Answer a copy of the receiver that preserves order but eliminates any duplicates."
	| seen |
	seen := Set new: self size.
	^self select: [:each| seen ifAbsentAdd: each] ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 11/14/2023 13:51:13'!
!!= aString
	
	^(self = aString) not! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 08:05:47'!
asFile

	^ self asFileEntry ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 07:41:44'!
trimTail: suffixString

	^ self withoutSuffix: suffixString ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 08:03:40'!
withExtension: newSuffix

	^ self append: '.' , newSuffix! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 08:03:50'!
withFullExtension: newSuffix

	^ self append: '.' ,  newSuffix! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 4/22/2022 15:27:34'!
withoutLineSeparators
	
	^self reject: [ :aCharacter | aCharacter isLineSeparator ]! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 4/21/2022 12:34:22'!
withoutSeparators
	
	^self reject: [ :aCharacter | aCharacter isSeparator ]! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 11/14/2023 13:51:30'!
!!= aString
	
	^(self = aString) not! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 11/10/2022 12:29:03'!
arity 

	^self numArgs! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 11/15/2022 10:38:39'!
existingSymbol 

	^Symbol findInterned: self! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 2/21/2023 22:31:20'!
includesString: subString
	self flag: #FixMe.
	^(self asByteString findString: subString asByteString) ~= 0! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 11/15/2022 08:06:33'!
trimBlanks

	^self withBlanksTrimmed! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 11/15/2022 08:05:55'!
withoutLineSeparators
	
	^self reject: [ :aCharacter | aCharacter isLineSeparator ]! !

!Array methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 14:44:01'!
& otherArray
	| combinedArray offset |
	combinedArray := Array new: (self size + otherArray size).
	1 to: self size do: [ :index | combinedArray at: index put: (self at: index) ].
	offset := self size.
	1 to: otherArray size do: [ :index | combinedArray at: index + offset put: (otherArray at: index) ].
	^ combinedArray! !

!Array methodsFor: '*BeeCompatibility' stamp: 'KenD 4/22/2022 16:12:51'!
collect: aBlock in: aCollection

	1 to: self size do:
		[:index | aCollection add: (aBlock value: (self at: index))].
	^ aCollection! !

!CompiledMethod methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 15:02:12'!
classBinding

	^ self methodClass! !

!CompiledMethod methodsFor: '*BeeCompatibility' stamp: 'KenD 4/22/2022 14:44:37'!
source
	"Answer source for method, including the signature"
	^ self getSource ! !

!OrderedCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 9/30/2022 15:23:08'!
removeDuplicates

	"Remove duplicates; retain order"
	| index |
	index := 1.
	[ index < self size ] 
		whileTrue: [ | each newIndex |
			each := self at: index.
			newIndex := index + 1.
			[ newIndex := (self indexOf: each startingAt: newIndex).
			  newIndex > 0]
				whileTrue: [self removeAt: index].
			index := index + 1.
		]! !

!OrderedCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 9/30/2022 15:12:27'!
withIndexDo: aBlock 
	| i |
	i := 1.
	self do: [:each | 
		aBlock value: each value: i.
		i := i + 1]! !

!Set methodsFor: '*BeeCompatibility' stamp: 'KenD 5/18/2022 13:53:27'!
ifAbsentAdd: anObject 
	"Ensure anObject is part of the receiver.  Answer whether its membership was newly acquired."
	| isCurrentMember |
	isCurrentMember := self includes: anObject.
	isCurrentMember 	ifFalse: [ self add: anObject ].
	^ isCurrentMember! !

!Dictionary methodsFor: '*BeeCompatibility' stamp: 'KenD 5/18/2022 13:47:13'!
at: key put: newValue ifPresent: transducerBlock
	"If key->value is present, use transducerBlock to take the value and mutate it,
	 otherwise just add key->newValue."
	self at: key ifPresent: transducerBlock ifAbsent: [ self at: key put: newValue ]
! !

!Dictionary methodsFor: '*BeeCompatibility' stamp: 'KenD 5/18/2022 15:06:58'!
select: aBlock in: aCollection 
	"Evaluate aBlock with each of my values as the argument.  
	 Collect into  aCollection, only those associations 
	  for which aBlock evaluates to true."

	self associationsDo: 
		[:each | 
		(aBlock value: each value) ifTrue: [ aCollection add: each ]].
	^aCollection! !

!PositionableStream methodsFor: '*BeeCompatibility' stamp: 'KenD 4/29/2022 17:12:08'!
copyFrom: start to: stop
	"Answer a string"
	| savedPos collected |
	self assert: (start <= stop).
	self assert: (stop <= self size).
	savedPos := self position.
	self position: start - 1.
	collected := WriteStream on: '' .
	1 to: (stop - start + 1) do: [ :ignored |
		 collected nextPut: (self next)
	].
	self position: savedPos.
	^ collected contents
	! !

!PositionableStream methodsFor: '*BeeCompatibility' stamp: 'KenD 4/20/2022 14:23:38'!
nextWordOrNumber
	"Take next non-separators as a 'word' and return it"
	| word |
	word := ''.
	[self atEnd]
		whileFalse:
		[| aChar |
		aChar := self next.
		aChar isSeparator 
			ifFalse: [ word := word , aChar asString ]
			ifTrue: [ self position: self position-1. ^ word ]
		].
	^ word! !

!DirectoryEntry methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 07:59:19'!
\ pathString
	
	^ self // pathString! !

!DirectoryEntry methodsFor: '*BeeCompatibility' stamp: 'KenD 2/12/2023 10:38:02'!
findEntryForFile: fileNameString
	"In me or one of my subdirectories, match fileNameString
	 and return its fileEntry or return `nil`."

	| probe |
	probe := self fileMatching: fileNameString.
	probe ifNotNil: [ ^probe ].
	self directoriesDo: [ :dirEnt | 
		probe := dirEnt findEntryForFile: fileNameString.
		probe ifNotNil: [ ^probe ].
	].
	^probe! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 10/1/2022 15:27:25'!
asArray 

	^self classPool asArray! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 10/1/2022 15:27:35'!
at: aString 
	| var |
	var :=  self classPool
		associationAt: aString asSymbol
		ifAbsent: [ self error: 'no such pool var' ].
	^var value! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 10/1/2022 15:27:42'!
at: aString ifAbsent: aBlock 
	| var |
	var := self classPool associationAt: aString asSymbol ifAbsent: [^aBlock value].
	^ var value! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 10/1/2022 15:27:49'!
at: aString put: anObject 

	^self classPool
		at: aString 
		put: anObject! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 10/1/2022 15:27:56'!
detect: aBlock ifNone: anotherBlock 

	^self classPool detect: aBlock  ifNone: [ ^ anotherBlock value ]! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 10/1/2022 15:28:01'!
do: aBlock 

	^self classPool do: aBlock! !
TargetOSPlatform initialize!
