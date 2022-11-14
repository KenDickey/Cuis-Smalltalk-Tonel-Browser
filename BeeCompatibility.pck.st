'From Cuis 6.0 [latest update: #5552] on 12 November 2022 at 1:33:59 pm'!
'Description Bee compatibile!!'!
!provides: 'BeeCompatibility' 1 33!
!requires: 'SqueakCompatibility' 1 35 nil!
SystemOrganization addCategory: 'BeeCompatibility'!


!classDefinition: #Stretch category: 'BeeCompatibility'!
Object subclass: #Stretch
	instanceVariableNames: 'start end'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'Stretch class' category: 'BeeCompatibility'!
Stretch class
	instanceVariableNames: ''!

!classDefinition: #TargetOSPlatform category: 'BeeCompatibility'!
Object subclass: #TargetOSPlatform
	instanceVariableNames: ''
	classVariableNames: 'CPU OS WordSizeInBits'
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'TargetOSPlatform class' category: 'BeeCompatibility'!
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

!Stretch methodsFor: 'printing' stamp: 'KenD 2/21/2021 13:41:14'!
printOn: aStream 

	aStream
		nextPutAll: start asString;
		nextPutAll: ' thru: ';
		nextPutAll: end asString! !

!Stretch methodsFor: 'comparing' stamp: 'KenD 2/21/2021 13:37:03'!
= aStretch 

	self class == aStretch class ifFalse: [^false].
	^start = aStretch start and: [end = aStretch end]! !

!Stretch methodsFor: 'comparing' stamp: 'KenD 2/21/2021 13:38:19'!
hash 

	^start hashWith: end! !

!Stretch methodsFor: 'testing' stamp: 'KenD 2/21/2021 13:39:03'!
includes: anInteger 

	^anInteger between: start and: end! !

!Stretch methodsFor: 'testing' stamp: 'KenD 2/21/2021 13:39:26'!
intersects: aStretch 

	self isEmpty ifTrue: [^false].
	(aStretch includes: start) ifTrue: [^true].
	^aStretch includes: end! !

!Stretch methodsFor: 'testing' stamp: 'KenD 2/21/2021 13:39:38'!
isEmpty 

	^end < start! !

!Stretch methodsFor: 'testing' stamp: 'KenD 2/21/2021 13:40:40'!
notEmpty 

	^start <= end! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 2/21/2021 13:37:58'!
end 

	^end! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 2/21/2021 13:38:07'!
end: anInteger 

	end := anInteger! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 2/21/2021 13:41:30'!
start 

	^start! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 2/21/2021 13:41:38'!
start: anInteger 

	start := anInteger! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:36:10'!
+ delta 

	delta isInteger ifTrue: [^start + delta thru: end + delta].
	delta isPoint ifTrue: [^start + delta x thru: end + delta y].
	^start + delta start thru: end + delta end! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:36:25'!
- delta 

	^self + delta negated! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:36:38'!
// anInteger 
	^start // anInteger thru: end // anInteger! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:37:14'!
center 

	^start + end // 2! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:37:28'!
down: anInteger 

	^start thru: end + anInteger! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:39:53'!
length 

	^end - start + 1! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:40:04'!
max 

	^start max: end! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:40:13'!
min 

	^start min: end! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:40:25'!
negated 

	^start negated thru: end negated! !

!Stretch class methodsFor: 'instance creation' stamp: 'KenD 2/21/2021 13:35:42'!
from: start thru: end 

	^self new start: start; end: end! !

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

!Boolean methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 12:40:34'!
isBoolean 

	^ true! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 12:39:02'!
and: block1 andNot: block2 

	^self! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 6/8/2021 07:05:27'!
andNot: aBlock

	^ self! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 10/2/2022 08:16:20'!
asBit

	^ 0! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 4/19/2022 11:00:52'!
asParameter 
	"Answer machine value for falsity"
	^ 0! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 12:37:43'!
and: block1 andNot: block2 

	^block1 value andNot: [block2 value]! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 12:37:54'!
andNot: aBlock 

	^aBlock value not
! !

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

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 2/14/2021 18:46:33'!
isHexDigit

	^'0123456789abcdefABCDEF' includes: self! !

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

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 5/18/2022 14:00:52'!
ifAbsentAdd: anObject 
	"Ensure anObject is part of the receiver. 
	 Answer whether its membership was newly acquired."
	| isCurrentMember |
	isCurrentMember := self includes: anObject.
	isCurrentMember 	ifFalse: [ self add: anObject ].
	^ isCurrentMember! !

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

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 16:53:01'!
arity 

	^self numArgs! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 08:05:47'!
asFile

	^ self asFileEntry ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 16:53:12'!
existingSymbol 

	^Symbol findInterned: self! !

!String methodsFor: '*BeeCompatibility' stamp: 'Install-PowerLang 4/25/2021 07:43:45'!
includesString: subString

	^(self findString: subString) ~= 0! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 16:53:45'!
indexOfString: aString from: start to: stop 
	| n limit base i |
	n := aString size.
	limit := stop - n.
	base := start - 1.
	i := 1.
	[
		base > limit ifTrue: [^0].
		i <= n]
		whileTrue: [
			i := (self at: base + i) = (aString at: i) ifTrue: [i + 1] ifFalse: [
				base := base + 1.
				1]].
	^i > 1 ifTrue: [base + 1] ifFalse: [0]! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 16:54:02'!
indexOfSubcollection: aCollection startingAt: anInteger 
	| m n i first |
	m := aCollection size.
	m = 0 ifTrue: [^0].
	n := self size - m + 1.
	i := anInteger.
	first := aCollection at: 1.
	[i <= n] whileTrue: [| j |
		(self at: i) = first ifTrue: [
			j := 2.
			[j <= m and: [(self at: i + j - 1) = (aCollection at: j)]]
				whileTrue: [j := j + 1].
			j > m ifTrue: [^i]].
		i := i + 1].
	^0! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 9/30/2022 14:32:15'!
reduced

	^self! !

!String methodsFor: '*BeeCompatibility' stamp: 'Install-PowerLang 9/15/2022 13:34:08'!
replaceAllSubstrings: aString with: anotherString
"
  'This-and-that-and-the-Other' replaceAllSubstrings: '-a' with: '_A'.
  ==> 'This_And-that_And-the-Other' 
"
	| string strm index fragment n |
	string := aString asString.
	string isEmpty ifTrue: [^self].
	index := self findString: string.
	index = 0 ifTrue: [^self].
	strm := self asString class new writeStream.
	fragment := self copyFrom: 1 to: index - 1.
	strm nextPutAll: fragment.
	n := string size.
	[index > 0] whileTrue: [| next limit |
		next :=  String  findSubstring: string
					in: self  
					startingAt: index + n 
					matchTable: CaseSensitiveOrder.
		limit := next = 0 ifTrue: [self size + 1] ifFalse: [next].
		fragment := self copyFrom: index + n - 1 + 1 to: limit - 1.
		strm nextPutAll: anotherString; nextPutAll: fragment.
		index := next].
	^strm contents! !

!String methodsFor: '*BeeCompatibility' stamp: 'Install-PowerLang 5/30/2021 14:25:33'!
trimBlanks

	^self withBlanksTrimmed! !

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

!Utf8String methodsFor: '*BeeCompatibility' stamp: 'KenD 11/10/2022 12:29:03'!
arity 

	^self numArgs! !

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

!OrderedDictionary methodsFor: '*BeeCompatibility' stamp: 'KenD 9/30/2022 15:13:20'!
withIndexDo: aBlock 
	| i |
	i := 1.
	self do: [:each | 
		aBlock value: each value: i.
		i := i + 1]! !

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
