'From Cuis7.9 [latest update: #8037] on 1 July 2026 at 2:48:41 pm'!
'Description Bee compatibile!!'!
!provides: 'BeeCompatibility' 1 70!
!requires: 'Cuis-Base' 63 6245 nil!
SystemOrganization addCategory: #BeeCompatibility!


!classDefinition: #Stretch category: #BeeCompatibility!
Object subclass: #Stretch
	instanceVariableNames: 'start end'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'Stretch class' category: #BeeCompatibility!
Stretch class
	instanceVariableNames: ''!

!classDefinition: #SymbolicReference category: #BeeCompatibility!
Object subclass: #SymbolicReference
	instanceVariableNames: 'linker token object'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'SymbolicReference class' category: #BeeCompatibility!
SymbolicReference class
	instanceVariableNames: ''!

!classDefinition: #TargetOSPlatform category: #BeeCompatibility!
Object subclass: #TargetOSPlatform
	instanceVariableNames: ''
	classVariableNames: 'CPU OS WordSizeInBits'
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'TargetOSPlatform class' category: #BeeCompatibility!
TargetOSPlatform class
	instanceVariableNames: ''!

!classDefinition: #PoolDictionary category: #BeeCompatibility!
Dictionary subclass: #PoolDictionary
	instanceVariableNames: 'constant'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'PoolDictionary class' category: #BeeCompatibility!
PoolDictionary class
	instanceVariableNames: ''!

!classDefinition: #NotFound category: #BeeCompatibility!
Error subclass: #NotFound
	instanceVariableNames: 'object'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'NotFound class' category: #BeeCompatibility!
NotFound class
	instanceVariableNames: ''!


!Stretch commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!SymbolicReference commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna.
    See (MIT) license in root directory.
!

!TargetOSPlatform commentStamp: '<historical>' prior: 0!
I am working around current target system assumptions.

Nota Bene: x86:64 Linux => See  TargetOSPlatform class >> initialize

For current system, note:
  	Smalltalk wordSize.  "8  => number of Bytes" 
	Smalltalk platformName ." 'unix' "
	Smalltalk platformSubtype. " 'aarch64' "
	Smalltalk osVersion ." 'linux-gnu' "
	!

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
+ delta
	delta isInteger ifTrue: [^start + delta thru: end + delta].
	delta isPoint ifTrue: [^start + delta x thru: end + delta y].
	^start + delta start thru: end + delta end
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
- delta
	^self + delta negated
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
// anInteger
	^start // anInteger thru: end // anInteger
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
center
	^start + end // 2
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
down: anInteger
	^start thru: end + anInteger
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
length
	^end - start + 1
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 30/Jan/2023, 5:10:45 pm (UTC)'!
mask
	^(2 raisedTo: end) - (2 raisedTo: start - 1)
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
max
	^start max: end
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
min
	^start min: end
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
negated
	^start negated thru: end negated
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 30/Jan/2023, 5:10:45 pm (UTC)'!
shift
	^(start - 1) negated
! !

!Stretch methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
= aStretch
	self class == aStretch class ifFalse: [^false].
	^start = aStretch start and: [end = aStretch end]
! !

!Stretch methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
hash
	^start hashWith: end
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
end
	^end
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
end: anInteger
	end := anInteger
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
start
	^start
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
start: anInteger
	start := anInteger
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
includes: anInteger
	^anInteger between: start and: end
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
intersects: aStretch
	self isEmpty ifTrue: [^false].
	(aStretch includes: start) ifTrue: [^true].
	^aStretch includes: end
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
isEmpty
	^end < start
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
notEmpty
	^start <= end
! !

!Stretch methodsFor: 'printing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
printOn: aStream
	aStream
		nextPutAll: start asString;
		nextPutAll: ' thru: ';
		nextPutAll: end asString
! !

!Stretch class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
from: start thru: end
	^self new start: start; end: end
! !

!SymbolicReference methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
= aSymbolicReference
	aSymbolicReference class == self class ifFalse: [^false].
	^linker = aSymbolicReference linker and: [token = aSymbolicReference token]
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
asBehavior
	^self asClass instanceBehavior
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
asCharacter
	^(Integer fromString: token) asCharacter
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
asClass
	| module |
	module := Kernel load: token first.
	^module namespace at: token second
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
asMetaclass
	^self asClass class
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
asMetaclassBehavior
	^self asClass behavior
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
asModule
	^Kernel load: token
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
asSymbol
	^token asSymbol
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
false
	^false
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
nil
	^nil
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
nilToken
	^HashTable nilToken
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
symbolTable
	^Symbol symbolTable
! !

!SymbolicReference methodsFor: 'linking' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
true
	^true
! !

!SymbolicReference methodsFor: 'services' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
hasBeenLinked
	^object notNil or: [token == #nil]
! !

!SymbolicReference methodsFor: 'services' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
link
	^self hasBeenLinked ifTrue: [object] ifFalse: [object := self referredValue].
! !

!SymbolicReference methodsFor: 'services' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
referredValue
	^self perform: linker
! !

!SymbolicReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
linker
	^linker
! !

!SymbolicReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
linker: aSymbol
	linker := aSymbol
! !

!SymbolicReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
object
	^object
! !

!SymbolicReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
token
	^token
! !

!SymbolicReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
token: string
	token := string
! !

!SymbolicReference methodsFor: 'printing' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
printOn: aStream
	aStream
		nextPutAll: self type;
		nextPutAll: ' (';
		nextPutAll: token printString;
		nextPut: $)
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
forBehavior: aBehavior
	| species linker |
	species :=  aBehavior classBinding.
	linker := species isMetaclass ifTrue: [#asMetaclassBehavior] ifFalse: [#asBehavior].
	^(self forClass: species instanceClass) linker: linker
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
forCharacter: aCharacter
	^self new linker: #asCharacter; token: aCharacter codePoint asString
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
forClass: aClass
	^self new linker: #asClass; token: {aClass module name. aClass name}
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
forMetaclass: aMetaclass
	^(self forClass: aMetaclass instanceClass) linker: #asMetaclass
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
forModule: aModule
	^self new linker: #asModule; token: aModule name
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
forSymbol: aSymbol
	^self new linker: #asSymbol; token: aSymbol
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
nilToken
	^self new linker: #nilToken
! !

!SymbolicReference class methodsFor: 'knownObjects' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
symbolTable
	^self new linker: #symbolTable
! !

!SymbolicReference class methodsFor: 'unassigned' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
linker: anObject token: anotherObject
	^self new linker: anObject; token: anotherObject
! !

!TargetOSPlatform methodsFor: 'testing' stamp: 'KenD 24/Feb/2021, 9:36:38 pm (UTC)'!
isUnix64

	^true! !

!TargetOSPlatform methodsFor: 'testing' stamp: 'KenD 24/Feb/2021, 9:36:26 pm (UTC)'!
isWin64

	^false! !

!TargetOSPlatform class methodsFor: 'class initialization' stamp: 'KenD 24/Feb/2021, 9:24:04 pm (UTC)'!
initialize
	"Nota Bene: x86:64"
	CPU := #Intel.
	OS := #Linux.
	WordSizeInBits := 64.! !

!TargetOSPlatform class methodsFor: 'accessing' stamp: 'KenD 24/Feb/2021, 9:27:13 pm (UTC)'!
targetCPU

	^CPU! !

!TargetOSPlatform class methodsFor: 'accessing' stamp: 'KenD 24/Feb/2021, 9:27:45 pm (UTC)'!
targetOS

	^OS ! !

!TargetOSPlatform class methodsFor: 'accessing' stamp: 'KenD 24/Feb/2021, 9:32:24 pm (UTC)'!
targetWordSizeInBits

	^WordSizeInBits ! !

!TargetOSPlatform class methodsFor: 'instance creation' stamp: 'KenD 18/Jun/2021, 7:28:07 pm (UTC)'!
current

	^self new initialize.! !

!PoolDictionary methodsFor: 'testing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
isConstant
	^constant
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
at: key
	^super at: key asString reduced
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
at: key ifAbsent: aBlock
	^super at: key asString reduced ifAbsent: aBlock
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
at: key ifPresent: aBlock
	^super at: key asString reduced ifPresent: aBlock
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
at: key put: value
	^super at: key asString put: value
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
beConstant: aBoolean
	constant := aBoolean
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
beConstantPool
	constant := true
! !

!PoolDictionary methodsFor: 'removing' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
removeKey: key ifAbsent: aBlock
	super removeKey: key asString reduced ifAbsent: aBlock.
	^key
! !

!PoolDictionary methodsFor: 'adding' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
add: anAssociation
	anAssociation key isString
		ifFalse: [self error: 'Pools are keyed with Strings'].
	^super add: anAssociation
! !

!PoolDictionary methodsFor: 'inquiries' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
includesKey: key
	^super includesKey: key asString reduced
! !

!PoolDictionary methodsFor: 'initialization' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
initialize: anInteger
	super initialize: anInteger.
	constant := false
! !

!PoolDictionary class methodsFor: 'instance creation' stamp: 'KenD 30/Jan/2023, 5:10:46 pm (UTC)'!
newConstantPool
	^self new beConstantPool
! !

!NotFound methodsFor: 'accessing' stamp: 'KenD 2/Mar/2024, 9:37:02 pm (UTC)'!
defaultDescription
	| string |
	string := [object printString] on: Error do: [:ex | ex description].
	^'Key ' , string , ' is missing'
! !

!NotFound methodsFor: 'accessing' stamp: 'KenD 2/Mar/2024, 9:36:35 pm (UTC)'!
object: anObject
	object := anObject
! !

!NotFound class methodsFor: 'signalling' stamp: 'KenD 2/Mar/2024, 9:36:13 pm (UTC)'!
signalFor: anObject
	^self new object: anObject; signal
! !

!ProtoObject methodsFor: '*BeeCompatibility' stamp: 'KenD 4/Mar/2024, 7:06:12 pm (UTC)'!
!!= other
	
	^(self = other) not! !

!ProtoObject methodsFor: '*BeeCompatibility' stamp: 'KenD 30/Jun/2026, 3:33:12 pm (UTC)'!
!!== anObject
	^self == anObject ifTrue: [false] ifFalse: [true]! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Apr/2022, 9:24:21 pm (UTC)'!
_instancesAreArrayed

	^ self isVariable ! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Apr/2022, 9:23:46 pm (UTC)'!
_instancesHavePointers

	^ self isPointers ! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
asSymbolicReference
	self DENY: self isInstanceBehavior.
	^SymbolicReference forBehavior: self
! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 18/May/2022, 9:58:51 pm (UTC)'!
instanceBehavior
	self flag: #PossiblyBogus. "Probably bogus"
	^ self methodDict ! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 31/Jan/2023, 4:48:16 pm (UTC)'!
methodNamed: selector 
	"Answer the compiled method associated with the argument, selector (a 
	Symbol), a message selector in the receiver's method dictionary. If the 
	selector is not in the dictionary, create an error notification."

	^self compiledMethodAt: selector 
! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 31/Jan/2023, 4:50:45 pm (UTC)'!
removeLocalMethod: selector 
	"Assuming that the argument, selector (a Symbol), is a message selector 
	in my method dictionary, remove it and its method."

	self basicRemoveSelector: selector ! !

!Behavior methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
shouldBeStoredIn: anObjectClosure
	^anObjectClosure scope includes: class
! !

!ClassDescription methodsFor: '*BeeCompatibility' stamp: 'KenD 15/Apr/2022, 6:56:44 pm (UTC)'!
instanceSide

	^ self theNonMetaClass ! !

!Class methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
asSymbolicReference
	^SymbolicReference forClass: self
! !

!Class methodsFor: '*BeeCompatibility' stamp: 'KenD 16/Nov/2023, 5:45:50 pm (UTC)'!
classSide

	^ self class! !

!Class methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
shouldBeStoredIn: anObjectClosure
	^anObjectClosure scope includes: self
! !

!Metaclass methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
asSymbolicReference
	^SymbolicReference forMetaclass: self
! !

!Metaclass methodsFor: '*BeeCompatibility' stamp: 'KenD 16/Nov/2023, 5:46:37 pm (UTC)'!
classSide

	^ self
! !

!Metaclass methodsFor: '*BeeCompatibility' stamp: 'KenD 22/Apr/2022, 11:14:43 pm (UTC)'!
isMetaclass

	^ self isMeta ! !

!Metaclass methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
shouldBeStoredIn: anObjectClosure
	^anObjectClosure scope includes: class
! !

!Collection methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 8:35:07 pm (UTC)'!
conform: evaluable
	self
		detect: [:x | | fx |
			fx := evaluable value: x.
			fx not]
		ifNone: [^true].
	^false! !

!Collection methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:38 pm (UTC)'!
includesIdentical: anObject
	self do: [:each | each == anObject ifTrue: [^true]].
	^false
! !

!Collection methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Nov/2023, 8:19:05 pm (UTC)'!
reject: rejectBlock thenDo: doBlock 	
"Utility method to improve readability.	Do not create the intermediate collection."	

	self do: [ :each |		(rejectBlock value: each)			ifFalse: [ doBlock value: each ] ].! !

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 18/May/2022, 9:00:52 pm (UTC)'!
ifAbsentAdd: anObject 
	"Ensure anObject is part of the receiver. 
	 Answer whether its membership was newly acquired."
	| isCurrentMember |
	isCurrentMember := self includes: anObject.
	isCurrentMember 	ifFalse: [ self add: anObject ].
	^ isCurrentMember! !

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 18/Nov/2023, 9:38:31 pm (UTC)'!
reject: rejectBlock thenDo: aBlock	
"Refer to the comment in Collection>>#reject:thenDo:"		
"(Array streamContents: [:stream | #(1 2 3 4) 
	reject: [:each | each = 3 ] 
	thenDo: [:each | stream nextPut: each + 10]])
  >>> #(11 12 14)"
	|  each |		
	1 to: self size do: [ :index |		
		(rejectBlock value: (each := self at: index))			ifFalse: [ aBlock value: each ]].! !

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 5/May/2022, 6:51:37 pm (UTC)'!
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

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 9:30:24 pm (UTC)'!
withoutDuplicates
	"Answer a copy of the receiver that preserves order but eliminates any duplicates."
	| seen |
	seen := Set new.
	^self select: [:each| seen ifAbsentAdd: each] ! !

!OrderedCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Mar/2024, 6:57:41 pm (UTC)'!
addIfNotPresent: anObject

	self detect: [ :elt | elt = anObject ] ifNone: [ self addLast: anObject ].! !

!OrderedCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 30/Sep/2022, 10:23:08 pm (UTC)'!
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

!OrderedCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 30/Sep/2022, 10:12:27 pm (UTC)'!
withIndexDo: aBlock 
	| i |
	i := 1.
	self do: [:each | 
		aBlock value: each value: i.
		i := i + 1]! !

!Array methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Apr/2022, 9:44:01 pm (UTC)'!
& otherArray
	| combinedArray offset |
	combinedArray := Array new: (self size + otherArray size).
	1 to: self size do: [ :index | combinedArray at: index put: (self at: index) ].
	offset := self size.
	1 to: otherArray size do: [ :index | combinedArray at: index + offset put: (otherArray at: index) ].
	^ combinedArray! !

!Array methodsFor: '*BeeCompatibility' stamp: 'KenD 22/Apr/2022, 11:12:51 pm (UTC)'!
collect: aBlock in: aCollection

	1 to: self size do:
		[:index | aCollection add: (aBlock value: (self at: index))].
	^ aCollection! !

!CompiledMethod methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Apr/2022, 10:02:12 pm (UTC)'!
classBinding

	^ self methodClass! !

!CompiledMethod methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
sexpressions
	| decoder |
	decoder := TreecodeDecoder new
		           stream: treecodes readStream;
		           method: self.
	^decoder decodeMethod
! !

!CompiledMethod methodsFor: '*BeeCompatibility' stamp: 'KenD 22/Apr/2022, 9:44:37 pm (UTC)'!
source
	"Answer source for method, including the signature"
	^ self getSource ! !

!CharacterSequence methodsFor: '*BeeCompatibility' stamp: 'KenD 22/Nov/2023, 8:14:33 pm (UTC)'!
includesSubstring: subString

	^ self is: subString substringAt: 0! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 14/Nov/2023, 8:51:13 pm (UTC)'!
!!= aString
	
	^(self = aString) not! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 11:53:01 pm (UTC)'!
arity 

	^self numArgs! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/May/2022, 3:05:47 pm (UTC)'!
asFile

	^ self asFileEntry ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Feb/2024, 11:26:59 pm (UTC)'!
asInteger 
	"From Squeak 5.3" 	
	^self asIntegerSigned: true
! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Feb/2024, 11:27:15 pm (UTC)'!
asIntegerSigned: signed
	"From Squeak 5.3 "
	"Return the first decimal integer I can find or nil."
	| index character size result negative |
	index := 0.
	size := self size.
	"Find the first character between $0 and $9."
	[ (index := index + 1) > size or: [ (self at: index) isDigit ] ] whileFalse.
	index > size ifTrue: [ ^nil ].
	negative := signed and: [ index > 1 and: [ (self at: index - 1) == $- ] ].
	"Parse the number."
	size - index > 15 ifTrue: [
		negative ifTrue: [ index := index - 1 ].
		^Integer readFrom: (
			ReadStream
				on: self
				from: index
				to: size) ].
	result := (self at: index) digitValue.
	[ (index := index + 1) <= size
		and: [ (character := self at: index) isDigit ] ]  whileTrue: [
		result := result * 10 + character digitValue ].
	negative ifTrue: [ ^result negated ].
	^result! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 11:53:12 pm (UTC)'!
existingSymbol 

	^Symbol findInterned: self! !

!String methodsFor: '*BeeCompatibility' stamp: 'Install-PowerLang 25/Apr/2021, 2:43:45 pm (UTC)'!
includesString: subString

	^(self findString: subString) ~= 0! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 11:53:45 pm (UTC)'!
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

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 11:54:02 pm (UTC)'!
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

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 7:07:32 pm (UTC)'!
reduced

	self flag: #UnknownSemantics.
	^self! !

!String methodsFor: '*BeeCompatibility' stamp: 'Install-PowerLang 15/Sep/2022, 8:34:08 pm (UTC)'!
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

!String methodsFor: '*BeeCompatibility' stamp: 'Install-PowerLang 30/May/2021, 9:25:33 pm (UTC)'!
trimBlanks

	^self withBlanksTrimmed! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/May/2022, 2:41:44 pm (UTC)'!
trimTail: suffixString

	^ self withoutSuffix: suffixString ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Feb/2024, 11:27:30 pm (UTC)'!
withCRs
	"Return a copy of the receiver in which backslash (\) characters have been replaced with carriage returns."

	^ self collect: [ :c | c = $\ ifTrue: [ Character cr ] ifFalse: [ c ]].! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/May/2022, 3:03:40 pm (UTC)'!
withExtension: newSuffix

	^ self append: '.' , newSuffix! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/May/2022, 3:03:50 pm (UTC)'!
withFullExtension: newSuffix

	^ self append: '.' ,  newSuffix! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 17/May/2024, 10:02:56 pm (UTC)'!
withoutLineSeparators
	"Convert separators into spaces"
	
	^self withLineEndings: ' '! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 21/Apr/2022, 7:34:22 pm (UTC)'!
withoutSeparators
	
	^self reject: [ :aCharacter | aCharacter isSeparator ]! !

!String class methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Feb/2024, 11:28:10 pm (UTC)'!
cr
	^self crString! !

!String class methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Feb/2024, 11:28:18 pm (UTC)'!
crlf
	^self crlfString! !

!String class methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Feb/2024, 11:28:24 pm (UTC)'!
lf
	^self lfString! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 14/Nov/2023, 8:51:30 pm (UTC)'!
!!= aString
	
	^(self = aString) not! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 10/Nov/2022, 7:29:03 pm (UTC)'!
arity 

	^self numArgs! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 15/Nov/2022, 5:38:39 pm (UTC)'!
existingSymbol 

	^Symbol findInterned: self! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 22/Feb/2023, 5:31:20 am (UTC)'!
includesString: subString
	self flag: #FixMe.
	^(self asByteString findString: subString asByteString) ~= 0! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 7:07:13 pm (UTC)'!
reduced
	
	self flag: #UnknownSemantics.
	^ self! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 15/Nov/2022, 3:06:33 pm (UTC)'!
trimBlanks

	^self withBlanksTrimmed! !

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 17/May/2024, 10:03:16 pm (UTC)'!
withoutLineSeparators
	"Convert separators into spaces"
	
	^self withLineEndings: ' '! !

!Set methodsFor: '*BeeCompatibility' stamp: 'KenD 18/May/2022, 8:53:27 pm (UTC)'!
ifAbsentAdd: anObject 
	"Ensure anObject is part of the receiver.  Answer whether its membership was newly acquired."
	| isCurrentMember |
	isCurrentMember := self includes: anObject.
	isCurrentMember 	ifFalse: [ self add: anObject ].
	^ isCurrentMember! !

!Dictionary methodsFor: '*BeeCompatibility' stamp: 'KenD 18/May/2022, 8:47:13 pm (UTC)'!
at: key put: newValue ifPresent: transducerBlock
	"If key->value is present, use transducerBlock to take the value and mutate it,
	 otherwise just add key->newValue."
	self at: key ifPresent: transducerBlock ifAbsent: [ self at: key put: newValue ]
! !

!Dictionary methodsFor: '*BeeCompatibility' stamp: 'KenD 18/May/2022, 10:06:58 pm (UTC)'!
select: aBlock in: aCollection 
	"Evaluate aBlock with each of my values as the argument.  
	 Collect into  aCollection, only those associations 
	  for which aBlock evaluates to true."

	self associationsDo: 
		[:each | 
		(aBlock value: each value) ifTrue: [ aCollection add: each ]].
	^aCollection! !

!OrderedDictionary methodsFor: '*BeeCompatibility' stamp: 'KenD 30/Sep/2022, 10:13:20 pm (UTC)'!
withIndexDo: aBlock 
	| i |
	i := 1.
	self do: [:each | 
		aBlock value: each value: i.
		i := i + 1]! !

!PositionableStream methodsFor: '*BeeCompatibility' stamp: 'KenD 30/Apr/2022, 12:12:08 am (UTC)'!
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

!PositionableStream methodsFor: '*BeeCompatibility' stamp: 'KenD 20/Apr/2022, 9:23:38 pm (UTC)'!
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

!PositionableStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:32:45 pm (UTC)'!
sizeToEnd

	^  readLimit - position! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:14:52 pm (UTC)'!
alignTo: boundary
	| n |
	n := boundary - (self position \\ boundary) \\ boundary.
	self skip: n
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:14:57 pm (UTC)'!
atBeginning
	^self position = 0
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:15:03 pm (UTC)'!
back
	self skip: -1
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:15:08 pm (UTC)'!
backToAny: aCollection
	"
	'Smalltalk' readStream position: 'Smallta' size; backToAny: 'ml'
	"
	[self position = 0] whileFalse: [| token |
		token := self prev.
		(aCollection includes: token) ifTrue: [^self]]
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:15:12 pm (UTC)'!
backToOpen: open
	"
	'--|things||some|-}blah' readStream next: '--|things||some' size; backToOpen: $|; yourself
	"
	| start |
	start := self position.
	[self position > 0] whileTrue: [
		self prev = open ifTrue: [
			self position = 0 ifTrue: [^self].
			self prev = open ifFalse: [^self next; yourself]]].
	self position: start
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:15:18 pm (UTC)'!
backToOpen: close with: open
	"
	'-{things{some}-}blah' readStream position: '-{things{some}-}' size - 1; backToOpen: ${ with: $}
	"
	| start tokens count |
	open = close ifTrue: [^self backToOpen: close].
	start := self position.
	tokens := {open. close}.
	count := -1.
	[self position = 0 or: [count = 0]] whileFalse: [| token |
		self backToAny: tokens.
		token := self peek.
		token = open ifTrue: [count := count + 1].
		token = close ifTrue: [count := count - 1]].
	count = 0 ifFalse: [self position: start]
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:15:23 pm (UTC)'!
basicNextChunk
	| token bulk |
	token := self isBinary ifTrue: [$!! asInteger] ifFalse: [$!!].
	bulk := self upTo: token.
	[self atEnd orNot: [self peekFor: token]] whileFalse: [
		bulk := bulk copyWith: token.
		bulk := bulk , (self upTo: token)].
	^bulk
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:16:15 pm (UTC)'!
copyFrom: start to: stop
	| pos result |
	pos := self position.
	self position: start - 1.
	result := self next: stop - start + 1.
	self position: pos.
	^result
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:16:22 pm (UTC)'!
countBlanks
	| count tab space |
	count := 0.
	tab := Character tab.
	space := $ .
	[self atEnd] whileFalse: [| char |
		char := self next.
		char = space ifTrue: [count := count + 1] ifFalse: [
			char = tab ifTrue: [count := count + 4] ifFalse: [
				self skip: -1.
				^count]]].
	^count
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:16:31 pm (UTC)'!
getBytesFor: aByteArray
	self readInto: aByteArray from: 1 to: aByteArray sizeInBytes
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:16:37 pm (UTC)'!
getInteger
	| byte |
	byte := self nextByte.
	^128 <= byte ifTrue: [self getInteger * 128 + byte - 128] ifFalse: [byte]
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:16:44 pm (UTC)'!
isBinary
	^false
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:16:49 pm (UTC)'!
isEmpty
	^self size = 0
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:17:09 pm (UTC)'!
nextByte
	^self next asInteger
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:17:23 pm (UTC)'!
nextFloat
	| float |
	float := Float new.
	self getBytesFor: float.
	^float
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:17:30 pm (UTC)'!
nextInteger
	^Integer readFrom: self
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:17:56 pm (UTC)'!
nextLong
	| bytes |
	bytes := ByteArray new: 4.
	self getBytesFor: bytes.
	^bytes longAtOffset: 0
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:18:02 pm (UTC)'!
nextNoFail: anInteger
	| n |
	n := anInteger min: self size - self position.
	^self next: n
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:18:08 pm (UTC)'!
nextString
	| size |
	size := self nextULong.
	^(self next: size) asString
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:18:14 pm (UTC)'!
nextSubstring
	| start |
	[
		self atEnd ifTrue: [^''].
		self next isAlphaNumericOrUnderscore] whileFalse.
	start := self position.
	[self atEnd not and: [self peek isAlphaNumericOrUnderscore]]
		whileTrue: [self next].
	^self copyFrom: start to: self position
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:18:20 pm (UTC)'!
nextSubstringOrNumber
	| c numeric token writer |
	[
		self atEnd ifTrue: [^''].
		c := self next.
		c isAlphanumeric] whileFalse.
	numeric := c isDigit.
	writer := self newCollector writeStream.
	writer nextPut: c.
	[
		self atEnd not and: [
			c := self next.
			numeric ifTrue: [c isDigit] ifFalse: [c isAlphanumeric]]]
		whileTrue: [writer nextPut: c].
	token := writer contents.
	(numeric and: [c isLetter]) ifTrue: [self skip: -1].
	^token first isDigit ifTrue: [token asInteger] ifFalse: [token]
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:18:33 pm (UTC)'!
nextULong
	| a0 a1 a2 a3 |
	a0 := self nextByte.
	a1 := self nextByte bitShift: 8.
	a2 := self nextByte bitShift: 16.
	a3 := self nextByte bitShift: 24.
	^a3 + a2 + a1 + a0
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:18:38 pm (UTC)'!
nextUShort
	| a0 a1 |
	a0 := self nextByte.
	a1 := self nextByte bitShift: 8.
	^a1 + a0
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:19:01 pm (UTC)'!
nextWhile: aBlock
	| write |
	write := self newCollector writeStream.
	[self atEnd not and: [aBlock evaluateWith: self peek]]
		whileTrue: [write nextPut: self next].
	^write contents
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:19:06 pm (UTC)'!
notEmpty
	^self isEmpty not
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:14:02 pm (UTC)'!
peek: n
	| pos safe data |
	pos := self position.
	safe := n min: self sizeToEnd.
	data := self next: safe.
	self position: pos.
	^data! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:14:10 pm (UTC)'!
peekFor: token
	^self peek = token ifTrue: [self skip]; yourself
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:14:15 pm (UTC)'!
peekForAll: aCollection
	| n |
	n := aCollection size.
	^((self peek: n) equalsTo: aCollection)
		ifTrue: [self skip: n];
		yourself
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 29/Feb/2024, 4:38:50 pm (UTC)'!
prev
	^self position > 0
		ifTrue: [self position: self position - 1; peek]
		ifFalse: [self error: 'read beyond start of stream']
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:14:27 pm (UTC)'!
readInto: aByteArray from: start to: stop
	| data |
	data := self next: stop - start + 1.
	aByteArray replaceBytesFrom: start to: stop with: data startingAt: 1
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 29/Feb/2024, 4:38:50 pm (UTC)'!
skipWhitespace
	[self atEnd orNot: [self peek isBlank]] whileFalse: [self next]
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:29:26 pm (UTC)'!
upToToken: token
	| write c |
	write := WriteStream new.
	[
		self atEnd not and: [
			c := self next.
			c ~= token]]
		whileTrue: [write nextPut: c].
	^write contents
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 10:20:23 pm (UTC)'!
utf8Trailing: byte
	(byte bitAnd: 2r11100000) = 2r11000000 ifTrue: [^1].
	(byte bitAnd: 2r11110000) = 2r11100000 ifTrue: [^2].
	(byte bitAnd: 2r11111000) = 2r11110000 ifTrue: [^3].
	^nil
! !

!WriteStream methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Mar/2024, 2:32:57 pm (UTC)'!
<< aString

	self nextPutAll: aString! !

!WriteStream methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:14:42 pm (UTC)'!
timeStamp
	"Append the current time to the receiver as a String."
	self nextChunkPut:	"double string quotes and !!s"
		    (String streamContents: [:s | Smalltalk writeSystemTimeStamp: s]) printString;
		newLine! !

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 30/Nov/2014, 12:29:00 am (UTC)'!
cull: firstArg
	"Activate the receiver, with one or zero arguments."
	
	numArgs >= 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 30/Nov/2014, 12:29:00 am (UTC)'!
cull: firstArg cull: secondArg
	"Activate the receiver, with two or less arguments."
	
	numArgs >= 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 30/Nov/2014, 12:29:00 am (UTC)'!
cull: firstArg cull: secondArg cull: thirdArg
	"Activate the receiver, with three or less arguments."
	
	numArgs >= 2 ifTrue: [ 
		numArgs >= 3 ifTrue: [ ^self value: firstArg value: secondArg value: thirdArg ].
		^self value: firstArg value: secondArg ].
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 30/Nov/2014, 12:29:00 am (UTC)'!
cull: firstArg cull: secondArg cull: thirdArg cull: fourthArg
	"Activate the receiver, with four or less arguments."
	
	numArgs >= 3 ifTrue: [
		numArgs >= 4 ifTrue: [
			^self value: firstArg value: secondArg value: thirdArg value: fourthArg ].
		^self value: firstArg value: secondArg value: thirdArg ].
	numArgs = 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!Boolean methodsFor: '*BeeCompatibility' stamp: 'KenD 8/Jun/2021, 2:04:59 pm (UTC)'!
andNot: aBlock

	self subclassResponsibility ! !

!Boolean methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Oct/2022, 3:15:58 pm (UTC)'!
asBit

	self subclassResponsibility ! !

!Boolean methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 7:40:34 pm (UTC)'!
isBoolean 

	^ true! !

!Boolean methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
shouldBeStoredIn: anObjectClosure
	^anObjectClosure module == Kernel
! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 7:39:02 pm (UTC)'!
and: block1 andNot: block2 

	^self! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 8/Jun/2021, 2:05:27 pm (UTC)'!
andNot: aBlock

	^ self! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Oct/2022, 3:16:20 pm (UTC)'!
asBit

	^ 0! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Apr/2022, 6:00:52 pm (UTC)'!
asParameter 
	"Answer machine value for falsity"
	^ 0! !

!False methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
asSymbolicReference
	^SymbolicReference new linker: #false
! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 7:37:43 pm (UTC)'!
and: block1 andNot: block2 

	^block1 value andNot: [block2 value]! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Jun/2021, 7:37:54 pm (UTC)'!
andNot: aBlock 

	^aBlock value not
! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Oct/2022, 3:16:37 pm (UTC)'!
asBit

	^ 1! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Apr/2022, 5:59:03 pm (UTC)'!
asParameter 
	"Answer machine value for truth"
	^ 1! !

!True methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
asSymbolicReference
	^SymbolicReference new linker: #true
! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Mar/2024, 6:50:30 pm (UTC)'!
asCharacter

	^ Character codePoint: self! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 9:06:27 pm (UTC)'!
bitShiftRight: anInteger

	^self bitShift: 0 - anInteger! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 9:05:17 pm (UTC)'!
bitsAt: aStretch
	"
	(2r001101010 bitField: (3 thru: 6)) bin = '1010'
	(-16r40000000 bitField: (29 thru: 31)) bin = '100'
	"
	| shifted mask |
	shifted := self bitShiftRight: aStretch start - 1.
	mask := 1 bitShift: aStretch length.
	^shifted bitAnd: mask - 1! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 8:54:59 pm (UTC)'!
bitsAt: aStretch put: anInteger
	"
	((2r001101100 bitsAt: (3 thru: 6) put: 2r1101) bitField: (3 thru: 6)) bin = '1101'
	((2r100 bitsAt: (29 thru: 31) put: 2r101) bitField: (29 thru: 31)) bin = '101'
	((2r100 bitsAt: (29 thru: 31) put: 2r101) bitField: (1 thru: 3)) bin = '100'
	"
	| shifted max |
	shifted := anInteger bitShift: aStretch start - 1.
	max := 1 bitShift: aStretch length.
	anInteger < max ifFalse: [self error: 'invalid argument'].
	^(self bitsClear: aStretch) bitOr: shifted! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 8:56:10 pm (UTC)'!
bitsClear: aStretch
	"
	(2r111100110 bitsClear: (3 thru: 6)) = 2r111000010
	"
	| mask |
	mask := (1 bitShift: aStretch end) - (1 bitShift: aStretch start - 1).
	^self bitAnd: mask bitInvert! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 9:08:24 pm (UTC)'!
isOnBit: n

	^(self bitAnd: n) = n! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 31/Jan/2025, 10:46:36 pm (UTC)'!
isSmallInteger

	^ false! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 9:08:54 pm (UTC)'!
linearFeedbackShiftRandom: key
	"
	LFSR implementation (avoids 0 by definition).
	More keys at: https://users.ece.cmu.edu/~koopman/lfsr/index.html
	"

	| shifted |
	shifted := self bitShift: -1.
	^ (self bitAnd: 1) = 0
		ifTrue: [ shifted ]
		ifFalse: [ shifted bitXor: key ]! !

!SmallInteger methodsFor: '*BeeCompatibility' stamp: 'KenD 30/Sep/2022, 10:33:32 pm (UTC)'!
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

!SmallInteger methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Sep/2022, 8:49:02 pm (UTC)'!
thru: largerNumber

	^ Stretch from: self thru: largerNumber ! !

!UndefinedObject methodsFor: '*BeeCompatibility' stamp: 'KenD 19/Apr/2022, 6:02:35 pm (UTC)'!
asParameter 
	"Answer machine value for 'no value'"
	^ 0! !

!UndefinedObject methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
asSymbolicReference
	^SymbolicReference new linker: #nil
! !

!UndefinedObject methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
shouldBeStoredIn: anObjectClosure
	^anObjectClosure module == Kernel
! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 30/Sep/2022, 8:00:20 pm (UTC)'!
!!= aCodePointOrCharacter

	^(self = aCodePointOrCharacter) not! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 7:00:20 pm (UTC)'!
asInteger

	^ self codePoint! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
asSymbolicReference
	^SymbolicReference forCharacter: self
! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 16/Feb/2021, 7:39:58 pm (UTC)'!
isASCIILetter

	^'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' includes: self! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Mar/2024, 6:59:33 pm (UTC)'!
isBlank
	| value |
	value := self codePoint.
	value <= 32 ifTrue: [^true].
	value = 160 ifTrue: [^true].
	value < 16r2000 ifTrue: [^false].
	value < 16r200C ifTrue: [^true].
	value = 16r202F ifTrue: [^true].
	value = 16r205F ifTrue: [^true].
	value = 16r3000 ifTrue: [^true].
	^false
! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 15/Feb/2021, 1:46:33 am (UTC)'!
isHexDigit

	^'0123456789abcdefABCDEF' includes: self! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 28/Jun/2026, 8:27:39 pm (UTC)'!
shouldBeStoredIn: anObjectClosure
	^anObjectClosure module == Kernel
! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 31/May/2021, 3:03:14 pm (UTC)'!
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

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 2/Mar/2024, 2:25:21 pm (UTC)'!
value: anInteger
	"Answer the Character whose value is anInteger."

	^ self codePoint: anInteger! !

!DirectoryEntry methodsFor: '*BeeCompatibility' stamp: 'KenD 6/May/2022, 2:59:19 pm (UTC)'!
\ pathString
	
	^ self // pathString! !

!DirectoryEntry methodsFor: '*BeeCompatibility' stamp: 'KenD 12/Feb/2023, 5:38:02 pm (UTC)'!
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

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Oct/2022, 10:27:25 pm (UTC)'!
asArray 

	^self classPool asArray! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Oct/2022, 10:27:35 pm (UTC)'!
at: aString 
	| var |
	var :=  self classPool
		associationAt: aString asSymbol
		ifAbsent: [ self error: 'no such pool var' ].
	^var value! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Oct/2022, 10:27:42 pm (UTC)'!
at: aString ifAbsent: aBlock 
	| var |
	var := self classPool associationAt: aString asSymbol ifAbsent: [^aBlock value].
	^ var value! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Oct/2022, 10:27:49 pm (UTC)'!
at: aString put: anObject 

	^self classPool
		at: aString 
		put: anObject! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Oct/2022, 10:27:56 pm (UTC)'!
detect: aBlock ifNone: anotherBlock 

	^self classPool detect: aBlock  ifNone: [ ^ anotherBlock value ]! !

!SharedPool class methodsFor: '*BeeCompatibility' stamp: 'KenD 1/Oct/2022, 10:28:01 pm (UTC)'!
do: aBlock 

	^self classPool do: aBlock! !
TargetOSPlatform initialize!
