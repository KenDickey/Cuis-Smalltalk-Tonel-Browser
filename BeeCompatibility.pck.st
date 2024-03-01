'From Cuis6.3 [latest update: #6245] on 1 March 2024 at 3:09:07 pm'!
'Description Bee compatibile!!'!
!provides: 'BeeCompatibility' 1 53!
!requires: 'Cuis-Base' 63 6245 nil!
SystemOrganization addCategory: #BeeCompatibility!


!classDefinition: #PSharedPool category: #BeeCompatibility!
SharedPool subclass: #PSharedPool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'PSharedPool class' category: #BeeCompatibility!
PSharedPool class
	instanceVariableNames: ''!

!classDefinition: #Namespace category: #BeeCompatibility!
Dictionary subclass: #Namespace
	instanceVariableNames: 'parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'Namespace class' category: #BeeCompatibility!
Namespace class
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

!classDefinition: #NumberParser category: #BeeCompatibility!
Object subclass: #NumberParser
	instanceVariableNames: 'stream error return'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'NumberParser class' category: #BeeCompatibility!
NumberParser class
	instanceVariableNames: ''!

!classDefinition: #Stretch category: #BeeCompatibility!
Object subclass: #Stretch
	instanceVariableNames: 'start end'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BeeCompatibility'!
!classDefinition: 'Stretch class' category: #BeeCompatibility!
Stretch class
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


!Namespace commentStamp: '<historical>' prior: 0!
Copyright (c) 2022 Javier Pimás. 
    See (MIT) license in root directory.
!

!NumberParser commentStamp: '<historical>' prior: 0!
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

!PSharedPool class methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
asArray
	^self classPool asArray
! !

!PSharedPool class methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
at: aString
	| var |
	var :=  self classPool
		associationAt: aString asSymbol
		ifAbsent: [ self error: 'no such pool var' ].
	^var value
! !

!PSharedPool class methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
at: aString ifAbsent: aBlock
	| var |
	var := self classPool associationAt: aString asSymbol ifAbsent: [^aBlock value].
	^ var value
! !

!PSharedPool class methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
at: aString put: anObject
	^self classPool
		at: aString 
		put: anObject
! !

!PSharedPool class methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
detect: aBlock ifNone: anotherBlock
	^self classPool detect: aBlock  ifNone: [ ^ anotherBlock value ].
	
! !

!PSharedPool class methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
do: aBlock
	^self classPool do: aBlock

! !

!Namespace methodsFor: 'lookup' stamp: 'KenD 2/29/2024 09:38:51'!
_namespaceLookup: aSymbol
	| table |
	table := namespace _basicAt: 2.
	2
		to: table _size
		do: [:j | | assoc |
			assoc := (table _basicAt: j).
			assoc == nil ifFalse: [
				assoc key == aSymbol
					ifTrue: [^table _basicAt: j + 1]]].
	^nil
! !

!Namespace class methodsFor: 'instance creation' stamp: 'KenD 2/29/2024 09:38:51'!
new
	^super new
! !

!PoolDictionary methodsFor: 'testing' stamp: 'KenD 1/30/2023 10:10:46'!
isConstant
	^constant
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
at: key
	^super at: key asString reduced
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
at: key ifAbsent: aBlock
	^super at: key asString reduced ifAbsent: aBlock
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
at: key ifPresent: aBlock
	^super at: key asString reduced ifPresent: aBlock
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
at: key put: value
	^super at: key asString put: value
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
beConstant: aBoolean
	constant := aBoolean
! !

!PoolDictionary methodsFor: 'accessing' stamp: 'KenD 1/30/2023 10:10:46'!
beConstantPool
	constant := true
! !

!PoolDictionary methodsFor: 'removing' stamp: 'KenD 1/30/2023 10:10:46'!
removeKey: key ifAbsent: aBlock
	super removeKey: key asString reduced ifAbsent: aBlock.
	^key
! !

!PoolDictionary methodsFor: 'adding' stamp: 'KenD 1/30/2023 10:10:46'!
add: anAssociation
	anAssociation key isString
		ifFalse: [self error: 'Pools are keyed with Strings'].
	^super add: anAssociation
! !

!PoolDictionary methodsFor: 'inquiries' stamp: 'KenD 1/30/2023 10:10:46'!
includesKey: key
	^super includesKey: key asString reduced
! !

!PoolDictionary methodsFor: 'initialization' stamp: 'KenD 1/30/2023 10:10:46'!
initialize: anInteger
	super initialize: anInteger.
	constant := false
! !

!PoolDictionary class methodsFor: 'instance creation' stamp: 'KenD 1/30/2023 10:10:46'!
newConstantPool
	^self new beConstantPool
! !

!NumberParser methodsFor: 'accessing' stamp: 'KenD 3/1/2024 11:54:08'!
error
	^error
! !

!NumberParser methodsFor: 'accessing' stamp: 'KenD 3/1/2024 11:54:08'!
on: aString
	stream := aString readStream.
	return := nil
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
checkNumberEnd: position
	| char |
	stream atEnd ifTrue: [^self].
	char := stream peek.
	char = $. ifFalse: [^self].
	stream skip: 1.
	stream atEnd
		ifFalse: [stream peek isDigit
			ifTrue: [self error: 'invalid number' at: position]].
	stream skip: -1
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
completeFloat: anInteger
	| tenth |
	tenth := 10 raisedToInteger: self nextExponent.
	^(anInteger * tenth) asFloat
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
completeNumber: anInteger after: aCharacter
	aCharacter = $. ifTrue: [
		^(stream peekFor: $s)
			ifTrue: [self nextScaledFrom: anInteger fractionDigits: 0]
			ifFalse: [self nextFloat: anInteger]].
	(aCharacter = $e or: [aCharacter = $E])
		ifTrue: [^self completeFloat: anInteger].
	aCharacter = $r ifTrue: [^self nextIntegerRadix: anInteger].
	aCharacter = $s ifTrue: [^self nextScaledFrom: anInteger fractionDigits: 0].
	(anInteger = 0 and: [aCharacter = $x or: [aCharacter = $X]])
		ifTrue: [^self nextIntegerRadix: 16].
	stream skip: -1.
	^anInteger
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
completeNumber: anInteger at: start
	| number |
	stream atEnd ifTrue: [^anInteger].
	number := anInteger.
	number := self completeNumber: anInteger after: stream next.
	self checkNumberEnd: start.
	^number
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
digitFromChar: char base: radix
	| c |
	char isDigit ifTrue: [^char digitValue].
	char = $r ifTrue: [^nil].
	char = $x ifTrue: [^nil].
	char = $X ifTrue: [^nil].
	c := char asUppercase.
	(c asInteger between: $A asInteger and: $Z asInteger) ifFalse: [^nil].
	(c !!= $E and: [radix <= c digitValue]) ifTrue: [^nil].
	(c = $E and: [radix = 10]) ifTrue: [^nil].
	^c digitValue
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
endToken
	self error: 'end of stream' at: stream position
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
error: aString at: position
	error := aString -> position.
	return value: nil
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
negativeNumber
	| position |
	stream atEnd ifTrue: [^nil].
	stream peek isDigit ifFalse: [^nil].
	position := stream position.
	^self next key negated -> position
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
next
	| char |
	return isNil ifTrue: [return := [:value | ^value]].
	char := self nextChar.
	char isNil ifTrue: [^self endToken].
	char = $- ifTrue: [^self negativeNumber].
	char = $+ ifTrue: [^self positiveNumber].
	char isDigit ifTrue: [^self nextNumber: char].
	^nil
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
nextChar
	^stream skipWhitespace atEnd ifFalse: [stream next]
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
nextDigit: radix
	| char digit |
	stream atEnd ifTrue: [^nil].
	char := stream next.
	digit := self digitFromChar: char base: radix.
	digit isNil ifTrue: [
		stream skip: -1.
		^nil].
	radix <= digit
		ifTrue: [self error: 'digit greater than radix' at: stream position].
	^digit
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
nextExponent
	| negated exp |
	negated := false.
	(stream peekFor: $+) ifFalse: [negated := stream peekFor: $-].
	exp := self nextIntegerRadix: 10.
	negated ifTrue: [exp := exp negated].
	^exp
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
nextFloat: aNumber
	| base digit e exp |
	digit := self nextDigit: 10.
	digit isNil ifTrue: [
		stream skip: -1.
		^aNumber].
	e := 1.
	base := aNumber * 10 + digit.
	[
		digit := self nextDigit: 10.
		digit isNil]
		whileFalse: [
			base := base * 10 + digit.
			e := e + 1].
	((stream peekFor: $E) or: [stream peekFor: $e]) ifTrue: [
		exp := self nextExponent.
		^(base * (10 raisedToInteger: exp - e)) asFloat].
	(stream peekFor: $s) ifTrue: [^self nextScaledFrom: base fractionDigits: e].
	^(base * (10 raisedToInteger: e negated)) asFloat
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
nextIntegerRadix: radix
	| value valid digit |
	value := 0.
	valid := false.
	[
		digit := self nextDigit: radix.
		digit isNil]
		whileFalse: [
			valid := true.
			value := value * radix + digit].
	valid ifFalse: [self error: 'digit missing' at: stream position + 1].
	^value
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
nextNumber: aCharacter
	| start number digit |
	start := stream position.
	number := aCharacter digitValue.
	[
		digit := self nextDigit: 10.
		digit isNil]
		whileFalse: [number := number * 10 + digit].
	number := self completeNumber: number at: start.
	^number -> (start thru: stream position)
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
nextScaledFrom: aNumber fractionDigits: digits
	| scale denominator sd |
	scale := (stream atEnd not and: [stream peek isDigit])
		ifTrue: [self nextIntegerRadix: 10].
	denominator := 10 raisedToInteger: digits.
	sd := ScaledDecimal
		numerator: aNumber
		denominator: denominator
		scale: scale.
	^sd reduced
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
positiveNumber
	| position |
	stream peek isDigit ifFalse: [^nil].
	position := stream position.
	^self next key -> position
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 3/1/2024 11:54:08'!
reset
	stream reset.
	return := nil
! !

!NumberParser methodsFor: 'services' stamp: 'KenD 3/1/2024 11:54:08'!
nextValue
	^self next ifNil: [0] ifNotNil: [:assoc | assoc key]
! !

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

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 1/30/2023 10:10:45'!
mask
	^(2 raisedTo: end) - (2 raisedTo: start - 1)
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:40:04'!
max 

	^start max: end! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:40:13'!
min 

	^start min: end! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 2/21/2021 13:40:25'!
negated 

	^start negated thru: end negated! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 1/30/2023 10:10:45'!
shift
	^(start - 1) negated
! !

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

!Stretch methodsFor: 'comparing' stamp: 'KenD 2/21/2021 13:37:03'!
= aStretch 

	self class == aStretch class ifFalse: [^false].
	^start = aStretch start and: [end = aStretch end]! !

!Stretch methodsFor: 'comparing' stamp: 'KenD 2/21/2021 13:38:19'!
hash 

	^start hashWith: end! !

!Stretch methodsFor: 'printing' stamp: 'KenD 2/21/2021 13:41:14'!
printOn: aStream 

	aStream
		nextPutAll: start asString;
		nextPutAll: ' thru: ';
		nextPutAll: end asString! !

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

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 14:06:27'!
bitShiftRight: anInteger

	^self bitShift: 0 - anInteger! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 14:05:17'!
bitsAt: aStretch
	"
	(2r001101010 bitField: (3 thru: 6)) bin = '1010'
	(-16r40000000 bitField: (29 thru: 31)) bin = '100'
	"
	| shifted mask |
	shifted := self bitShiftRight: aStretch start - 1.
	mask := 1 bitShift: aStretch length.
	^shifted bitAnd: mask - 1! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 13:54:59'!
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

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 13:56:10'!
bitsClear: aStretch
	"
	(2r111100110 bitsClear: (3 thru: 6)) = 2r111000010
	"
	| mask |
	mask := (1 bitShift: aStretch end) - (1 bitShift: aStretch start - 1).
	^self bitAnd: mask bitInvert! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 14:08:24'!
isOnBit: n

	^(self bitAnd: n) = n! !

!Integer methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 14:08:54'!
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

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 12:00:20'!
asInteger

	^ self codePoint! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 2/16/2021 12:39:58'!
isASCIILetter

	^'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' includes: self! !

!Character methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 11:59:33'!
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

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 11/29/2014 17:29'!
cull: firstArg
	"Activate the receiver, with one or zero arguments."
	
	numArgs >= 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 11/29/2014 17:29'!
cull: firstArg cull: secondArg
	"Activate the receiver, with two or less arguments."
	
	numArgs >= 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 11/29/2014 17:29'!
cull: firstArg cull: secondArg cull: thirdArg
	"Activate the receiver, with three or less arguments."
	
	numArgs >= 2 ifTrue: [ 
		numArgs >= 3 ifTrue: [ ^self value: firstArg value: secondArg value: thirdArg ].
		^self value: firstArg value: secondArg ].
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!BlockClosure methodsFor: '*BeeCompatibility' stamp: 'bp 11/29/2014 17:29'!
cull: firstArg cull: secondArg cull: thirdArg cull: fourthArg
	"Activate the receiver, with four or less arguments."
	
	numArgs >= 3 ifTrue: [
		numArgs >= 4 ifTrue: [
			^self value: firstArg value: secondArg value: thirdArg value: fourthArg ].
		^self value: firstArg value: secondArg value: thirdArg ].
	numArgs = 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value! !

!Collection methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 13:35:07'!
conform: evaluable
	self
		detect: [:x | | fx |
			fx := evaluable value: x.
			fx not]
		ifNone: [^true].
	^false! !

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

!SequenceableCollection methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 14:30:24'!
withoutDuplicates
	"Answer a copy of the receiver that preserves order but eliminates any duplicates."
	| seen |
	seen := Set new.
	^self select: [:each| seen ifAbsentAdd: each] ! !

!CharacterSequence methodsFor: '*BeeCompatibility' stamp: 'KenD 11/22/2023 13:14:33'!
includesSubstring: subString

	^ self is: subString substringAt: 0! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 11/14/2023 13:51:13'!
!!= aString
	
	^(self = aString) not! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 6/2/2021 16:53:01'!
arity 

	^self numArgs! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 08:05:47'!
asFile

	^ self asFileEntry ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/28/2024 16:26:59'!
asInteger 
	"From Squeak 5.3" 	
	^self asIntegerSigned: true
! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/28/2024 16:27:15'!
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

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 12:07:32'!
reduced

	self flag: #UnknownSemantics.
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

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/28/2024 16:27:23'!
subStrings: separators 
	"Answer an array containing the substrings in the receiver separated 
	by the elements of separators."
	| char result sourceStream subString |
	#Collectn.
	"Changed 2000/04/08 For ANSI <readableString> protocol."
	(separators isString or:[separators allSatisfy: [:element | element isCharacter]]) ifFalse:
		[^ self error: 'separators must be Characters.'].
	sourceStream := ReadStream on: self.
	result := OrderedCollection new.
	subString := String new.
	[sourceStream atEnd]
		whileFalse: 
			[char := sourceStream next.
			(separators includes: char)
				ifTrue: [subString notEmpty
						ifTrue: 
							[result add: subString copy.
							subString := String new]]
				ifFalse: [subString := subString , (String with: char)]].
	subString notEmpty ifTrue: [result add: subString copy].
	^ result asArray! !

!String methodsFor: '*BeeCompatibility' stamp: 'Install-PowerLang 5/30/2021 14:25:33'!
trimBlanks

	^self withBlanksTrimmed! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 5/6/2022 07:41:44'!
trimTail: suffixString

	^ self withoutSuffix: suffixString ! !

!String methodsFor: '*BeeCompatibility' stamp: 'KenD 2/28/2024 16:27:30'!
withCRs
	"Return a copy of the receiver in which backslash (\) characters have been replaced with carriage returns."

	^ self collect: [ :c | c = $\ ifTrue: [ Character cr ] ifFalse: [ c ]].! !

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

!String class methodsFor: '*BeeCompatibility' stamp: 'KenD 2/28/2024 16:28:10'!
cr
	^self crString! !

!String class methodsFor: '*BeeCompatibility' stamp: 'KenD 2/28/2024 16:28:18'!
crlf
	^self crlfString! !

!String class methodsFor: '*BeeCompatibility' stamp: 'KenD 2/28/2024 16:28:24'!
lf
	^self lfString! !

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

!UnicodeString methodsFor: '*BeeCompatibility' stamp: 'KenD 3/1/2024 12:07:13'!
reduced
	
	self flag: #UnknownSemantics.
	^ self! !

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

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 2/29/2024 09:38:50'!
prev
	^self position > 0
		ifTrue: [self position: self position - 1; peek]
		ifFalse: [self error: 'read beyond start of stream']
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 2/29/2024 09:38:50'!
prevChunk
	| bulk token index n m bytes chunk |
	token := self isBinary ifTrue: [$!! asInteger] ifFalse: [$!!].
	bulk := self reverseUpTo: token.
	[self atBeginning orNot: [self reversePeekFor: token]]
		whileFalse: [bulk := (self reverseUpTo: token) , '!!' , bulk].
	index := 1.
	n := bulk size.
	[
		index <= n and: [| char |
			char := bulk at: index.
			char asInteger <= 32]]
		whileTrue: [index := index + 1].
	m := n - index + 1.
	m = 0 ifTrue: [^''].
	bytes := ByteArray new: m.
	bytes isEmpty ifTrue: [^''].
	bytes replaceFrom: 1 to: m with: bulk startingAt: index.
	chunk := UTF8 current decode: bytes.
	^chunk copyWithout: Lf
! !

!ReadStream methodsFor: '*BeeCompatibility' stamp: 'KenD 2/29/2024 09:38:50'!
skipWhitespace
	[self atEnd orNot: [self peek isBlank]] whileFalse: [self next]
! !

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
