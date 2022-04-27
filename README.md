# Cuis-Smalltalk-Tonel-Browser
Browser for simple Tonel format Smalltalk source files

THE BROWSER IS NOT YET WRITTEN, but read/write for Tonel is working.

````Smalltalk
Feature require: 'ExchangeFormat-Tonel-Lite'.

writer := TonelWriter on: 'TrivialExample.class.st' asFileEntry forceWriteStream.
writer writeClass: TrivialExample category: #'ExchangeFormat-Tonel-Lite'.
reader := TonelReader on: ('TrivialExample.class.st' asFileEntry) readStream.
reader read.
reader inspect.
````
