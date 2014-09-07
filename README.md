Swift-Command-Line-Helper
=========================

Some helper functions to write command line scripts with Swift.


## Working with the current direcotry

Consult the current direcotry:

	CLH.currentDirectoryPath()
	// /Users/Alex/...

Change the current direcotry:

	CLH.changeToHome() 		// /Users/Alex
	CLH.changeToDesktop() 	// /Users/Alex/Desktop
	 
	let testPath = CLH.currentDirectoryPath() + "/test"
	CLH.changeToDirectory(testPath) // /Users/Alex/Desktop/test
	
## Working with directories

Create a new directory:

	CLH.createDirectoryAtPath(testPath)
	// Created /Users/Alex/Desktop/test
	
List the contents of a directory:

	CLH.contentsOfDirectoryAtPath(testPath)
	// [/Users/Alex/Desktop/test/test1.txt, ...]
	
	for (i, file) in enumerate(CLH.contentsOfDirectoryAtPath(testPath)) {
    	println(file)
	}
	
	
## Working with files

Create an empty file:

	CLH.touchFile("test1.txt")

Rename a file:

	CLH.renameFileWithName("test1.txt", toName: "testOne.txt")
	
	
