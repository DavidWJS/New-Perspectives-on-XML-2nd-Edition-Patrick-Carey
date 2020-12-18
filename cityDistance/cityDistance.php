<?php
    //reading the input name
    $cityIn = $_GET["cityTxtBx"];
    
    //storing several names in 2D array
    $cityArray = array();
    
    //let's populate the array
    $cityArray[0][0] = "Dublin";
    $cityArray[0][1] = "3176 miles";
    $cityArray[1][0] = "Paris";
    $cityArray[1][1] = "3625 miles";
    $cityArray[2][0] = "London";
    $cityArray[2][1] = "3459 miles";
    $cityArray[3][0] = "Dhaka";
    $cityArray[3][1] = "6883 miles";
    
    //array size = count the number of elements (records) in the array
    $arraySize = count($cityArray);

    //let's loop through each element of the array and check if there is a match between input name(first and last name)
    //and the element of the array. notice that one index (row) goes from 0 to 3 (4 records) and the other index (column)
    //goes from 0 to 1
    
    //variable that represents a match is found
    $foundmatch = false;
    
    //let's use the for loop
    for($row = 0; $row < $arraySize; $row++) {
        if(strcasecmp($cityArray[$row][0], $cityIn) == 0)
            {
                $foundmatch = true;
                print $cityArray[$row][1];
                break;
            }
    }// end of the loop
    if($foundmatch != true)
        print "No city found";
?>
