'From Cuis 6.0 [latest update: #5114] on 29 April 2022 at 1:20:41 pm'!
'Description '!
!provides: 'ExchangeFormat-TonelBrowser' 1 3!
!requires: 'ExchangeFormat-Tonel-Lite' 1 18 nil!
SystemOrganization addCategory: 'ExchangeFormat-TonelBrowser'!


!classDefinition: #TonelCodeBrowser category: 'ExchangeFormat-TonelBrowser'!
Browser subclass: #TonelCodeBrowser
	instanceVariableNames: 'tonelReader'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-TonelBrowser'!
!classDefinition: 'TonelCodeBrowser class' category: 'ExchangeFormat-TonelBrowser'!
TonelCodeBrowser class
	instanceVariableNames: ''!

!classDefinition: #TonelCodeBrowserWindow category: 'ExchangeFormat-TonelBrowser'!
CodeFileBrowserWindow subclass: #TonelCodeBrowserWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ExchangeFormat-TonelBrowser'!
!classDefinition: 'TonelCodeBrowserWindow class' category: 'ExchangeFormat-TonelBrowser'!
TonelCodeBrowserWindow class
	instanceVariableNames: ''!


!TonelCodeBrowser commentStamp: '<historical>' prior: 0!
I represent a Smalltalk Code Browser on a Tonel format source code file.

Note docs in TonelReader class!

!TonelCodeBrowserWindow commentStamp: '<historical>' prior: 0!
I present a Smalltalk Code Browser for the Tonel source code exchange format.!

!TonelCodeBrowser methodsFor: 'accessing' stamp: 'KenD 4/28/2022 10:55:24'!
selectedClass
	"Answer a symbol"
	
	^ tonelReader classInfo at: #name! !

!TonelCodeBrowser methodsFor: 'initialization' stamp: 'KenD 4/29/2022 07:38:55'!
browseCodeFileEntry: aFileEntry

	tonelReader := TonelReader on: aFileEntry readStream.
	tonelReader read. "Note: TonelReader class comment"
	! !

!TonelCodeBrowser methodsFor: 'initialization' stamp: 'KenD 4/27/2022 16:04:03'!
defaultBrowserTitle
	^ 'Tonel File Browser'! !

!TonelCodeBrowser class methodsFor: 'instance creation' stamp: 'KenD 4/26/2022 14:31:26'!
browseCodeFile: aFileNameString

	^ self new browseCodeSource: aFileNameString asFileEntry! !

!TonelCodeBrowser class methodsFor: 'instance creation' stamp: 'KenD 4/26/2022 14:30:43'!
browseCodeFileEntry: aFileEntry

	^ self new browseCodeSource: aFileEntry! !
