# Cuis-Smalltalk-Tonel-Browser
Browser for simple Tonel format Smalltalk source files

Tonel format is fairly simple.
````
"I am a trivial Class which should never be instantiated.

	""Send $25 for Your Name Here""
	
Time donated to Cuis pays for itself!

writer :=  TonelWriter on: 'TrivialExample.class.st' asFileEntry forceWriteStream.
writer writeClass: TrivialExample category: #'ExchangeFormat-Tonel-Lite'.
reader := TonelReader on: ('TrivialExample.class.st' asFileEntry) readStream.
reader read.
reader inspect.
"

Class {
	#name : #TrivialExample,
	#superclass : #TonelTest,
	#instVars : [
		'larry',
		'joe',
		'curley'
	],
	#classVars : [
		#Stooges
	],
	#category : #ExchangeFormat-Tonel-Lite
}

{
	#category : 'class initialization'
}
TrivialExample class >> initialize [

	Stooges := {}.
	]

{
	#category : 'failing'
}
TrivialExample >> explain: rationale to: entity [

	"No answers to some questions"
	self flag: #RationaleIsBogus.
	entity add: rationale.
]
````


THE BROWSER IS NOT YET WRITTEN, but read/write for Tonel is working.

````Smalltalk
Feature require: 'ExchangeFormat-Tonel-Lite'.

writer := TonelWriter on: 'TrivialExample.class.st' asFileEntry forceWriteStream.
writer writeClass: TrivialExample category: #'ExchangeFormat-Tonel-Lite'.
reader := TonelReader on: ('TrivialExample.class.st' asFileEntry) readStream.
reader read.
reader inspect.
````
