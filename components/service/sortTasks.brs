sub init()
	m.top.functionName = "executeTask"
	m.top.ObserveField("numberSetScreenA", "sortAndCopyLastFiveNumbers")
	m.top.ObserveField("numberSetScreenB", "findAndSortEvenNumbers")

 end sub
 
 function executeTask() as void
	? "executeTask"
	
 '	json = get("https://api.jsonbin.io/v3/b/631f5e595c146d63ca98e072")
 '    ? json
 '    if json <> invalid
 '        m.top.response = json
 '    else
 '        ? "Error"
 '4   end if	
    m.top.control = "stop"

 end function

 function StartTask(taskName)

	m.top.control = "run"
 end function

 
 function sortAndCopyLastFiveNumbers()
	? "sortAndCopyLastFiveNumbers"
	' Sort the inputArray in ascending order
	inputArray = m.top.numberSetScreenA
	inputArray.Sort()
 
	' Reverse the inputArray to get descending order
	inputArray.Reverse()
 
	' Copy the last five elements to a new array
	outputArray = []
	startIndex = inputArray.Count() - 5
 
	' Handle cases where the inputArray has fewer than five elements
	if startIndex < 0 then startIndex = 0
 
	for i = startIndex to inputArray.Count() - 1
	    outputArray.Push(inputArray[i])
	end for
 
	m.top.results = outputArray
	m.top.control = "stop"

 end function

function findAndSortEvenNumbers(input)
    evenNumbers = []
	inputArray = input.getData()

	' Find even numbers in the inputArray
    for each number in inputArray
        if number mod 2 = 0 then
            evenNumbers.Push(number)
        end if
    end for

    evenNumbers.Sort()
    evenNumbers.Reverse()
    resultArray = []
    for i = 0 to 4
        if i < evenNumbers.Count() then
            resultArray.Push(evenNumbers[i])
        else
            exit for
        end if
    end for

	m.top.results = resultArray
	m.top.control = "stop"
end function