># Cuis-Smalltalk-Tonel-Browser
Browser for simple Tonel format Smalltalk source files.

This is very much a work in progress, but
````Smalltalk
Feature require: 'ExchangeFormat-Tonel-Lite'.
````
will allow a File List to browse, via the #code button, 
a Tonel Class source file.  Just answer the prompts.

Tonel format is fairly simple.  It starts with an optional class comment.
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
		'Stooges'
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

Note that Tonel loses information (e.g. time & author stamp).

Also, Tonel files use the same suffix, ".st", as chunk files.  Very bad!

You can fileOut what the TonelReader reads as a Chunk File.
````Smalltalk
writer :=  TonelWriter on: 'TrivialExample.class.st' asFileEntry forceWriteStream.
writer writeClass: TrivialExample category: #'ExchangeFormat-Tonel-Lite'.
reader := TonelReader on: ('TrivialExample.class.st' asFileEntry) readStream.
reader read.
reader fileOut.
reader baseNameForFileOut. "Print this"
````

As a matter of fact, this is how browsing Tonel works!  A Tonel file
is read, then filed out as a chunk file, then the usual code
browser reads it.

Note that this is a fairly complete port of STON,
but a "lite" port of Tonel from the Bee Smalltalk folks --
NOT a port of the mountain of code from Pharo.  
In particular, missing commas or any method not
preceeded by a category will cause an error.

Copyright not assigned is copyright "Cuis",
all other packages carry original copyrights.
See LICENSES directory.
All code here is MIT copyright.
