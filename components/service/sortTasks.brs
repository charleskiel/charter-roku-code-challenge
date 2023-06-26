' This task node handles sorting of arrays to not block UI thread.


sub init()
	' When each screen instance initates it's specified field, it's function runs and updates the results field
	' which is watched by it's respective screen to handle

	m.top.ObserveField("numberSetScreenA", "sortAndCopyLastFiveNumbers")
	m.top.ObserveField("numberSetScreenB", "findAndSortEvenNumbers")
 end sub

 function sortAndCopyLastFiveNumbers(input)
	outputArray = []
	inputArray = input.getData()
	inputArray.Sort()
	inputArray.Reverse()
 
	startIndex = inputArray.Count() - 5
 
	' ensure it returns all if count is less than 5
	if startIndex < 0 then startIndex = 0
 
	for i = startIndex to inputArray.Count() - 1
	    outputArray.Push(inputArray[i])
	end for
 
	m.top.results = outputArray
	m.top.control = "stop"

 end function

function findAndSortEvenNumbers(input)
	outputArray = []
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

    for i = 0 to 4
        if i < evenNumbers.Count() then ' don't crash if there's less than 5
            outputArray.Push(evenNumbers[i])
        else
            exit for
        end if
    end for

	m.top.results = outputArray
	m.top.control = "stop"
end function