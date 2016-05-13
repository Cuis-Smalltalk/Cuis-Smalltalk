'From Cuis 4.2 of 25 July 2013 [latest update: #2710] on 1 April 2016 at 2:13:03.062542 pm'!
'Description '!
!provides: 'StyledTextInstaller' 1 6!
!requires: 'Morphic-Widgets-Extras' 1 nil nil!
!requires: 'StyledTextNotebook' 1 nil nil!
!requires: 'StyledText' 1 nil nil!
!requires: 'StyledTextWiki' 1 nil nil!
!classDefinition: #StyledTextInstaller category: #StyledTextInstaller!
Object subclass: #StyledTextInstaller
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StyledTextInstaller'!
!classDefinition: 'StyledTextInstaller class' category: #StyledTextInstaller!
StyledTextInstaller class
	instanceVariableNames: ''!


!StyledTextInstaller methodsFor: 'private' stamp: 'bp 12/4/2011 09:14'!
createStyledTextEditorDocumentation
	"self new createStyledTextEditorDocumentation"
	| model styleSet |
	model _ StyledTextModel new.
	SystemWindow
		editFancierStyledText: model
		label: 'Styled Text Editor Documentation'.
	styleSet _ model styleSet.
	styleSet
		createDocumentationParagraphStyleSet;
		createDocumentationCharacterStyleSet! !

!StyledTextInstaller methodsFor: 'private' stamp: 'KenD 12/4/2015 21:03'!
documentsDirectory
	^(self repositoryDirectory) / 'Documents'! !

!StyledTextInstaller methodsFor: 'features' stamp: 'bp 4/21/2012 14:58'!
featuresModelNames
	^#('STE - New Features' 'STE - Done Features' 'Cuis Features')! !

!StyledTextInstaller methodsFor: 'private' stamp: 'KenD 12/4/2015 21:23'!
open: name
	| fileName model |
	fileName _ ((self documentsDirectory) // name) pathName.
	model _ StyledTextModel fromFileNamed: fileName.
	^SystemWindow editFancierStyledText: model label: name! !

!StyledTextInstaller methodsFor: 'public' stamp: 'bp 12/4/2011 10:10'!
openExamples
	"self new openExamples"
	self
		openStyledTextEditorDocumentation;
		openMacbethExample! !

!StyledTextInstaller methodsFor: 'public' stamp: 'jmv 8/9/2014 10:55'!
openMacbethExample
	"self new openMacbethExample"
	| window |
	window _ self open: 'Macbeth Example'.
	window ifNotNil: [window widgetsColor: Color white]! !

!StyledTextInstaller methodsFor: 'public' stamp: 'bp 4/5/2012 23:24'!
openStyledTextEditorDocumentation
	"self new openStyledTextEditorDocumentation"
	self open: 'Styled Text Editor Documentation'! !

!StyledTextInstaller methodsFor: 'features' stamp: 'bp 12/7/2011 02:06'!
openStyledTextEditorFeatures
	"self new openStyledTextEditorFeatures"
	self featuresModelNames do: [:each | self open: each]! !

!StyledTextInstaller methodsFor: 'public' stamp: 'bp 12/4/2011 10:06'!
recreateDocumentationStyleSet
	"self new recreateDocumentationStyleSet"
	| model styleSet |
	model _ self styledTextModelNamed: 'Styled Text Editor Documentation'.
	styleSet _ model styleSet.
	styleSet
		createDocumentationParagraphStyleSet;
		createDocumentationCharacterStyleSet! !

!StyledTextInstaller methodsFor: 'features' stamp: 'bp 12/7/2011 02:08'!
recreateFeaturesStyleSet
	"self new recreateFeaturesStyleSet"
	self featuresModelNames do: [:each |
		| model styleSet |
		model _ self styledTextModelNamed: each.
		styleSet _ model styleSet.
		styleSet
			createFeaturesParagraphStyleSet;
			createFeaturesCharacterStyleSet]! !

!StyledTextInstaller methodsFor: 'private' stamp: 'KenD 12/4/2015 20:56'!
repositoryDirectory
	^(self class package fullFileName asFileEntry parent)! !

!StyledTextInstaller methodsFor: 'private' stamp: 'jmv 4/1/2016 14:01'!
save: name
	| model |
	model _ self styledTextModelNamed: name.
	model saveAs: (self documentsDirectory // name) pathName! !

!StyledTextInstaller methodsFor: 'public' stamp: 'bp 8/10/2013 14:08'!
saveMacbethExample
	"self new saveMacbethExample"
	self save: 'Macbeth Example'! !

!StyledTextInstaller methodsFor: 'public' stamp: 'bp 12/4/2011 09:40'!
saveStyledTextEditorDocumentation
	"self new saveStyledTextEditorDocumentation"
	self save: 'Styled Text Editor Documentation'! !

!StyledTextInstaller methodsFor: 'features' stamp: 'bp 12/7/2011 02:07'!
saveStyledTextEditorFeatures
	"self new saveStyledTextEditorFeatures"
	self featuresModelNames do: [:each | self save: each]! !

!StyledTextInstaller methodsFor: 'private' stamp: 'bp 12/4/2011 09:59'!
styledTextModelNamed: name
	| window |
	window _ SystemWindow allInstances detect: [:each | each label = name].
	^window model! !

!StyledTextInstaller class methodsFor: 'class initialization' stamp: 'jmv 7/17/2013 09:55'!
initialize
	"
	StyledTextInstaller initialize
	"
	STETheme beCurrent.
	self new openExamples! !
StyledTextInstaller initialize!
