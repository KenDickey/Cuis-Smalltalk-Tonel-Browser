'From Cuis 6.0 [latest update: #5141] on 7 May 2022 at 4:07:22 pm'!
'Description STON implements serialization and materialization using the Smalltalk Object Notation format.

Ported from:
  https://github.com/svenvc/ston

Copyright (C) 2012 Sven Van Caekenberghe.
	See (MIT) license in LICENSES directory.
'!
!provides: 'ExchangeFormat-STON' 1 36!
!requires: 'Cuis-Base' 60 5096 nil!
!requires: 'Identities-UUID' 1 9 nil!
!requires: 'SqueakCompatibility' 1 33 nil!
!requires: 'CSS3-NamedColors' 1 1 nil!
SystemOrganization addCategory: 'ExchangeFormat-STON'!


!classDefinition: #STONTestAssociation category: 'ExchangeFormat-STON'!
Association subclass: #STONTestAssociation
	instanceVariableNames: 'timestamp'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONTestAssociation class' category: 'ExchangeFormat-STON'!
STONTestAssociation class
	instanceVariableNames: ''!

!classDefinition: #NotFound category: 'ExchangeFormat-STON'!
Error subclass: #NotFound
	instanceVariableNames: 'object'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'NotFound class' category: 'ExchangeFormat-STON'!
NotFound class
	instanceVariableNames: ''!

!classDefinition: #STONReaderError category: 'ExchangeFormat-STON'!
Error subclass: #STONReaderError
	instanceVariableNames: 'streamPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONReaderError class' category: 'ExchangeFormat-STON'!
STONReaderError class
	instanceVariableNames: ''!

!classDefinition: #STONWriterError category: 'ExchangeFormat-STON'!
Error subclass: #STONWriterError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONWriterError class' category: 'ExchangeFormat-STON'!
STONWriterError class
	instanceVariableNames: ''!

!classDefinition: #STONFileReference category: 'ExchangeFormat-STON'!
FileEntry subclass: #STONFileReference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONFileReference class' category: 'ExchangeFormat-STON'!
STONFileReference class
	instanceVariableNames: ''!

!classDefinition: #STONWriteReadTest category: 'ExchangeFormat-STON'!
TestCase subclass: #STONWriteReadTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONWriteReadTest class' category: 'ExchangeFormat-STON'!
STONWriteReadTest class
	instanceVariableNames: ''!

!classDefinition: #STONWriteAsciiOnlyReadTest category: 'ExchangeFormat-STON'!
STONWriteReadTest subclass: #STONWriteAsciiOnlyReadTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONWriteAsciiOnlyReadTest class' category: 'ExchangeFormat-STON'!
STONWriteAsciiOnlyReadTest class
	instanceVariableNames: ''!

!classDefinition: #STONWritePrettyPrinterReadTest category: 'ExchangeFormat-STON'!
STONWriteReadTest subclass: #STONWritePrettyPrinterReadTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONWritePrettyPrinterReadTest class' category: 'ExchangeFormat-STON'!
STONWritePrettyPrinterReadTest class
	instanceVariableNames: ''!

!classDefinition: #STONWriteReadCommentsTest category: 'ExchangeFormat-STON'!
STONWriteReadTest subclass: #STONWriteReadCommentsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONWriteReadCommentsTest class' category: 'ExchangeFormat-STON'!
STONWriteReadCommentsTest class
	instanceVariableNames: ''!

!classDefinition: #STONWriterTest category: 'ExchangeFormat-STON'!
TestCase subclass: #STONWriterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONWriterTest class' category: 'ExchangeFormat-STON'!
STONWriterTest class
	instanceVariableNames: ''!

!classDefinition: #STON category: 'ExchangeFormat-STON'!
Object subclass: #STON
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STON class' category: 'ExchangeFormat-STON'!
STON class
	instanceVariableNames: ''!

!classDefinition: #STONAlternativeRepresentationTestObject category: 'ExchangeFormat-STON'!
Object subclass: #STONAlternativeRepresentationTestObject
	instanceVariableNames: 'id time gridReference'
	classVariableNames: 'KnownObjects'
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONAlternativeRepresentationTestObject class' category: 'ExchangeFormat-STON'!
STONAlternativeRepresentationTestObject class
	instanceVariableNames: ''!

!classDefinition: #STONCStyleCommentsSkipStream category: 'ExchangeFormat-STON'!
Object subclass: #STONCStyleCommentsSkipStream
	instanceVariableNames: 'stream peekedCharacter delimiter escape'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONCStyleCommentsSkipStream class' category: 'ExchangeFormat-STON'!
STONCStyleCommentsSkipStream class
	instanceVariableNames: ''!

!classDefinition: #STONJSON category: 'ExchangeFormat-STON'!
Object subclass: #STONJSON
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONJSON class' category: 'ExchangeFormat-STON'!
STONJSON class
	instanceVariableNames: ''!

!classDefinition: #STONReader category: 'ExchangeFormat-STON'!
Object subclass: #STONReader
	instanceVariableNames: 'readStream objects classes unresolvedReferences stringStream acceptUnknownClasses newLine convertNewLines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONReader class' category: 'ExchangeFormat-STON'!
STONReader class
	instanceVariableNames: ''!

!classDefinition: #STONReference category: 'ExchangeFormat-STON'!
Object subclass: #STONReference
	instanceVariableNames: 'index'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONReference class' category: 'ExchangeFormat-STON'!
STONReference class
	instanceVariableNames: ''!

!classDefinition: #STONStreamWriter category: 'ExchangeFormat-STON'!
Object subclass: #STONStreamWriter
	instanceVariableNames: 'writer first'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONStreamWriter class' category: 'ExchangeFormat-STON'!
STONStreamWriter class
	instanceVariableNames: ''!

!classDefinition: #STONListWriter category: 'ExchangeFormat-STON'!
STONStreamWriter subclass: #STONListWriter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONListWriter class' category: 'ExchangeFormat-STON'!
STONListWriter class
	instanceVariableNames: ''!

!classDefinition: #STONShortListWriter category: 'ExchangeFormat-STON'!
STONListWriter subclass: #STONShortListWriter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONShortListWriter class' category: 'ExchangeFormat-STON'!
STONShortListWriter class
	instanceVariableNames: ''!

!classDefinition: #STONMapWriter category: 'ExchangeFormat-STON'!
STONStreamWriter subclass: #STONMapWriter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONMapWriter class' category: 'ExchangeFormat-STON'!
STONMapWriter class
	instanceVariableNames: ''!

!classDefinition: #STONTestUser category: 'ExchangeFormat-STON'!
STONStreamWriter subclass: #STONTestUser
	instanceVariableNames: 'username password enabled'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONTestUser class' category: 'ExchangeFormat-STON'!
STONTestUser class
	instanceVariableNames: ''!

!classDefinition: #STONTestUser2 category: 'ExchangeFormat-STON'!
STONTestUser subclass: #STONTestUser2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONTestUser2 class' category: 'ExchangeFormat-STON'!
STONTestUser2 class
	instanceVariableNames: ''!

!classDefinition: #STONTestUser3 category: 'ExchangeFormat-STON'!
STONTestUser subclass: #STONTestUser3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONTestUser3 class' category: 'ExchangeFormat-STON'!
STONTestUser3 class
	instanceVariableNames: ''!

!classDefinition: #STONTestDomainObject category: 'ExchangeFormat-STON'!
Object subclass: #STONTestDomainObject
	instanceVariableNames: 'created modified integer float description color tags bytes boolean'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONTestDomainObject class' category: 'ExchangeFormat-STON'!
STONTestDomainObject class
	instanceVariableNames: ''!

!classDefinition: #STONTestKnownObject category: 'ExchangeFormat-STON'!
Object subclass: #STONTestKnownObject
	instanceVariableNames: 'id description'
	classVariableNames: 'KnownObjects'
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONTestKnownObject class' category: 'ExchangeFormat-STON'!
STONTestKnownObject class
	instanceVariableNames: ''!

!classDefinition: #STONWriter category: 'ExchangeFormat-STON'!
Object subclass: #STONWriter
	instanceVariableNames: 'writeStream prettyPrint stonCharacters newLine asciiOnly jsonMode keepNewLines referencePolicy level objects'
	classVariableNames: 'STONCharacters STONSimpleSymbolCharacters'
	poolDictionaries: ''
	category: 'ExchangeFormat-STON'!
!classDefinition: 'STONWriter class' category: 'ExchangeFormat-STON'!
STONWriter class
	instanceVariableNames: ''!


!STONTestAssociation methodsFor: 'accessing'!
! !

!STONTestAssociation methodsFor: 'accessing'!
! !

!STONTestAssociation methodsFor: 'accessing'!
! !

!STONTestAssociation methodsFor: 'accessing'!
! !

!NotFound methodsFor: 'accessing' stamp: 'KenD 5/7/2022 13:22:44'!
object

	^ object! !

!NotFound methodsFor: 'initialization' stamp: 'KenD 5/7/2022 13:22:10'!
object: unfoundObject

	object := unfoundObject.
	self signal: 'Not found '! !

!NotFound methodsFor: 'initialization' stamp: 'KenD 5/7/2022 13:19:21'!
signalFor: unfoundObject

	object : unfoundObject.
	self signal: 'Not found '! !

!NotFound class methodsFor: 'instance creation' stamp: 'KenD 5/7/2022 13:16:08'!
signalFor: unfoundObject

	^ self new object: unfoundObject ! !

!STONReaderError methodsFor: 'accessing'!
! !

!STONReaderError methodsFor: 'accessing'!
! !

!STONReaderError methodsFor: 'accessing'!
! !

!STONReaderError class methodsFor: 'instance creation'!
! !

!STONFileReference class methodsFor: 'accessing'!
! !

!STONFileReference class methodsFor: 'instance creation'!
! !

!STONWriteReadTest methodsFor: 'options'!
! !

!STONWriteReadTest methodsFor: 'private'!
! !

!STONWriteReadTest methodsFor: 'private'!
! !

!STONWriteReadTest methodsFor: 'private'!
! !

!STONWriteReadTest methodsFor: 'private'!
! !

!STONWriteReadTest methodsFor: 'private'!
! !

!STONWriteReadTest methodsFor: 'private'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteReadTest methodsFor: 'testing'!
! !

!STONWriteAsciiOnlyReadTest methodsFor: 'private'!
! !

!STONWriteAsciiOnlyReadTest methodsFor: 'private'!
! !

!STONWritePrettyPrinterReadTest methodsFor: 'private'!
! !

!STONWritePrettyPrinterReadTest methodsFor: 'private'!
! !

!STONWriteReadCommentsTest methodsFor: 'options'!
! !

!STONWriteReadCommentsTest methodsFor: 'private'!
! !

!STONWriteReadCommentsTest methodsFor: 'private'!
! !

!STONWriterTest methodsFor: 'private'!
! !

!STONWriterTest methodsFor: 'private'!
! !

!STONWriterTest methodsFor: 'private'!
! !

!STONWriterTest methodsFor: 'private'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STONWriterTest methodsFor: 'testing'!
! !

!STON class methodsFor: 'accessing'!
! !

!STON class methodsFor: 'accessing'!
! !

!STON class methodsFor: 'accessing'!
! !

!STON class methodsFor: 'accessing'!
! !

!STON class methodsFor: 'accessing'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'convenience'!
! !

!STON class methodsFor: 'instance creation'!
! !

!STON class methodsFor: 'instance creation'!
! !

!STON class methodsFor: 'instance creation'!
! !

!STON class methodsFor: 'instance creation'!
! !

!STON class methodsFor: 'instance creation'!
! !

!STON class methodsFor: 'instance creation'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'ston persistence'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject methodsFor: 'accessing'!
! !

!STONAlternativeRepresentationTestObject class methodsFor: 'as yet unclassified'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'accessing'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'accessing'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'accessing'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'initialization'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'private'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'private'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'private'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'private'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'private'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'private'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'private'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'reading'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'testing'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'testing'!
! !

!STONCStyleCommentsSkipStream methodsFor: 'other'!
! !

!STONCStyleCommentsSkipStream class methodsFor: 'instance creation'!
! !

!STONJSON class methodsFor: 'convenience'!
! !

!STONJSON class methodsFor: 'convenience'!
! !

!STONJSON class methodsFor: 'convenience'!
! !

!STONJSON class methodsFor: 'convenience'!
! !

!STONJSON class methodsFor: 'convenience'!
! !

!STONJSON class methodsFor: 'convenience'!
! !

!STONReader methodsFor: 'error handling'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'initialize-release'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'parsing-internal'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'private'!
! !

!STONReader methodsFor: 'reading'!
! !

!STONReader methodsFor: 'testing'!
! !

!STONReader class methodsFor: 'instance creation'!
! !

!STONReference methodsFor: 'printing'!
! !

!STONReference methodsFor: 'accessing'!
! !

!STONReference methodsFor: 'accessing'!
! !

!STONReference methodsFor: 'testing'!
! !

!STONReference methodsFor: 'comparing'!
! !

!STONReference methodsFor: 'comparing'!
! !

!STONReference class methodsFor: 'instance creation'!
! !

!STONStreamWriter methodsFor: 'initialization'!
! !

!STONStreamWriter methodsFor: 'initialization'!
! !

!STONStreamWriter class methodsFor: 'instance creation'!
! !

!STONListWriter methodsFor: 'accessing'!
! !

!STONShortListWriter methodsFor: 'accessing'!
! !

!STONMapWriter methodsFor: 'accessing'!
! !

!STONTestUser methodsFor: 'accessing'!
! !

!STONTestUser methodsFor: 'accessing'!
! !

!STONTestUser methodsFor: 'accessing'!
! !

!STONTestUser methodsFor: 'accessing'!
! !

!STONTestUser methodsFor: 'accessing'!
! !

!STONTestUser methodsFor: 'accessing'!
! !

!STONTestUser methodsFor: 'comparing'!
! !

!STONTestUser methodsFor: 'comparing'!
! !

!STONTestUser methodsFor: 'initialize-release'!
! !

!STONTestUser class methodsFor: 'ston-core'!
! !

!STONTestUser class methodsFor: 'instance creation'!
! !

!STONTestUser2 methodsFor: 'ston-core'!
! !

!STONTestUser2 methodsFor: 'ston-core'!
! !

!STONTestUser2 class methodsFor: 'ston-core'!
! !

!STONTestUser3 methodsFor: 'ston-core'!
! !

!STONTestUser3 class methodsFor: 'ston-core'!
! !

!STONTestUser3 class methodsFor: 'ston-core'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'accessing'!
! !

!STONTestDomainObject methodsFor: 'comparing'!
! !

!STONTestDomainObject methodsFor: 'comparing'!
! !

!STONTestDomainObject methodsFor: 'initialization'!
! !

!STONTestDomainObject class methodsFor: 'ston-core'!
! !

!STONTestDomainObject class methodsFor: 'instance creation'!
! !

!STONTestKnownObject methodsFor: 'printing'!
! !

!STONTestKnownObject methodsFor: 'ston-core'!
! !

!STONTestKnownObject methodsFor: 'accessing'!
! !

!STONTestKnownObject methodsFor: 'accessing'!
! !

!STONTestKnownObject methodsFor: 'accessing'!
! !

!STONTestKnownObject methodsFor: 'accessing'!
! !

!STONTestKnownObject methodsFor: 'comparing'!
! !

!STONTestKnownObject methodsFor: 'comparing'!
! !

!STONTestKnownObject methodsFor: 'initialization'!
! !

!STONTestKnownObject class methodsFor: 'accessing'!
! !

!STONTestKnownObject class methodsFor: 'accessing'!
! !

!STONTestKnownObject class methodsFor: 'accessing'!
! !

!STONTestKnownObject class methodsFor: 'instance creation'!
! !

!STONTestKnownObject class methodsFor: 'ston-core'!
! !

!STONWriter methodsFor: 'accessing'!
! !

!STONWriter methodsFor: 'error handling'!
! !

!STONWriter methodsFor: 'other'!
! !

!STONWriter methodsFor: 'other'!
! !

!STONWriter methodsFor: 'other'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'initialization'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'private'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter methodsFor: 'writing'!
! !

!STONWriter class methodsFor: 'class initialization'!
! !

!STONWriter class methodsFor: 'class initialization'!
! !

!STONWriter class methodsFor: 'class initialization'!
! !

!STONWriter class methodsFor: 'instance creation'!
! !

!STONWriter class methodsFor: 'private'!
! !

!ProtoObject methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object methodsFor: '*ExchangeFormat-STON'!
! !

!Object class methodsFor: '*ExchangeFormat-STON'!
! !

!Object class methodsFor: '*ExchangeFormat-STON'!
! !

!Object class methodsFor: '*ExchangeFormat-STON'!
! !

!Boolean methodsFor: '*ExchangeFormat-STON'!
! !

!Boolean methodsFor: '*ExchangeFormat-STON'!
! !

!Color methodsFor: '*ExchangeFormat-STON'!
! !

!Color methodsFor: '*ExchangeFormat-STON'!
! !

!Color methodsFor: '*ExchangeFormat-STON'!
! !

!Color methodsFor: '*ExchangeFormat-STON'!
! !

!Color class methodsFor: '*ExchangeFormat-STON'!
! !

!Color class methodsFor: '*ExchangeFormat-STON'!
! !

!UndefinedObject methodsFor: '*ExchangeFormat-STON'!
! !

!UndefinedObject methodsFor: '*ExchangeFormat-STON'!
! !

!Behavior class methodsFor: '*ExchangeFormat-STON'!
! !

!ClassDescription methodsFor: '*ExchangeFormat-STON'!
! !

!ClassDescription methodsFor: '*ExchangeFormat-STON'!
! !

!Class methodsFor: '*ExchangeFormat-STON'!
! !

!Class class methodsFor: '*ExchangeFormat-STON'!
! !

!Metaclass methodsFor: '*ExchangeFormat-STON'!
! !

!Metaclass methodsFor: '*ExchangeFormat-STON'!
! !

!Metaclass class methodsFor: '*ExchangeFormat-STON'!
! !

!Magnitude methodsFor: '*ExchangeFormat-STON'!
! !

!Number methodsFor: '*ExchangeFormat-STON'!
! !

!Number methodsFor: '*ExchangeFormat-STON'!
! !

!Number methodsFor: '*ExchangeFormat-STON'!
! !

!Float methodsFor: '*ExchangeFormat-STON'!
! !

!Fraction methodsFor: '*ExchangeFormat-STON'!
! !

!Integer methodsFor: '*ExchangeFormat-STON'!
! !

!DateAndTime methodsFor: '*ExchangeFormat-STON'!
! !

!DateAndTime methodsFor: '*ExchangeFormat-STON'!
! !

!DateAndTime methodsFor: '*ExchangeFormat-STON'!
! !

!DateAndTime class methodsFor: '*ExchangeFormat-STON'!
! !

!Time methodsFor: '*ExchangeFormat-STON'!
! !

!Time methodsFor: '*ExchangeFormat-STON'!
! !

!Time class methodsFor: '*ExchangeFormat-STON'!
! !

!Association methodsFor: '*ExchangeFormat-STON'!
! !

!Character methodsFor: '*ExchangeFormat-STON'!
! !

!Character class methodsFor: '*ExchangeFormat-STON'!
! !

!Date methodsFor: '*ExchangeFormat-STON'!
! !

!Date methodsFor: '*ExchangeFormat-STON'!
! !

!Date class methodsFor: '*ExchangeFormat-STON'!
! !

!Collection methodsFor: '*ExchangeFormat-STON'!
! !

!Collection class methodsFor: '*ExchangeFormat-STON'!
! !

!SequenceableCollection methodsFor: '*ExchangeFormat-STON'!
! !

!SequenceableCollection methodsFor: '*ExchangeFormat-STON'!
! !

!SequenceableCollection methodsFor: '*ExchangeFormat-STON'!
! !

!SequenceableCollection class methodsFor: '*ExchangeFormat-STON'!
! !

!String methodsFor: '*ExchangeFormat-STON'!
! !

!String methodsFor: '*ExchangeFormat-STON'!
! !

!String methodsFor: '*ExchangeFormat-STON'!
! !

!String methodsFor: '*ExchangeFormat-STON'!
! !

!Symbol methodsFor: '*ExchangeFormat-STON'!
! !

!ByteArray methodsFor: '*ExchangeFormat-STON'!
! !

!ByteArray methodsFor: '*ExchangeFormat-STON'!
! !

!ByteArray methodsFor: '*ExchangeFormat-STON'!
! !

!ByteArray class methodsFor: '*ExchangeFormat-STON'!
! !

!Interval methodsFor: '*ExchangeFormat-STON'!
! !

!Interval methodsFor: '*ExchangeFormat-STON'!
! !

!Interval class methodsFor: '*ExchangeFormat-STON'!
! !

!OrderedCollection methodsFor: '*ExchangeFormat-STON'!
! !

!SortedCollection methodsFor: '*ExchangeFormat-STON'!
! !

!SortedCollection methodsFor: '*ExchangeFormat-STON'!
! !

!SortedCollection class methodsFor: '*ExchangeFormat-STON'!
! !

!RunArray methodsFor: '*ExchangeFormat-STON'!
! !

!RunArray methodsFor: '*ExchangeFormat-STON'!
! !

!RunArray class methodsFor: '*ExchangeFormat-STON'!
! !

!Text methodsFor: '*ExchangeFormat-STON'!
! !

!Text methodsFor: '*ExchangeFormat-STON'!
! !

!Text class methodsFor: '*ExchangeFormat-STON'!
! !

!Bag methodsFor: '*ExchangeFormat-STON'!
! !

!Bag class methodsFor: '*ExchangeFormat-STON'!
! !

!Set methodsFor: '*ExchangeFormat-STON'!
! !

!Dictionary methodsFor: '*ExchangeFormat-STON'!
! !

!Dictionary methodsFor: '*ExchangeFormat-STON'!
! !

!Dictionary class methodsFor: '*ExchangeFormat-STON'!
! !

!OrderedDictionary methodsFor: '*ExchangeFormat-STON'!
! !

!OrderedDictionary class methodsFor: '*ExchangeFormat-STON'!
! !

!WriteStream methodsFor: '*ExchangeFormat-STON'!
! !

!FileSystemEntry methodsFor: '*ExchangeFormat-STON'!
! !

!FileSystemEntry methodsFor: '*ExchangeFormat-STON'!
! !

!FileSystemEntry methodsFor: '*ExchangeFormat-STON'!
! !

!FileSystemEntry methodsFor: '*ExchangeFormat-STON'!
! !

!Point methodsFor: '*ExchangeFormat-STON'!
! !

!Point methodsFor: '*ExchangeFormat-STON'!
! !

!Point methodsFor: '*ExchangeFormat-STON'!
! !
STONWriter initialize!
