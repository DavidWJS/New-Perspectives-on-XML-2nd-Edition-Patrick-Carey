<?php
    //reading the inputs
    $fname = $_GET["fnameTxtBx"];
    $lname = $_GET["lnameTxtBx"];
    $ID = $_GET["idTxtBx"];
    
    //openning txt file for reading
    $file = fopen("students.txt","r");
    
    //reading line by line in the file with
    //fgetcsv() which returns an array containing the
    //fields that it read.
    //the parameters are: fgetcsv(file,length,delimiter)
    //if length = 0 line length is not limited
    //fgetcsv() returns NULL if an invalid file or
    //FALSE if there are other errors including end of file
    //loop through the entire file
    
    //skipping the first line
    $reading = 1;
    
    //boolean variable that represents a match is found
    $foundmatch = false;
    
    while (($row = fgetcsv($file, 0, ",")) != FALSE)
    {
        if ($reading > 1)
        {
            $fnameInFile = $row[0];
            $lnameInFile = $row[1];
            $idInFile = $row[2];
            
            //check for a match (using case insensitive)
            if (strcasecmp($fname,$fnameInFile)==0 and
                strcasecmp($lname,$lnameInFile)==0 and
                strcasecmp($ID,$idInFile)==0)
            {
                $foundmatch = true;
                print "Congratulations ".$fnameInFile." ".
                $lnameInFile . ", you have been registered";
                break;
            }
        }
        else $reading = 2;
    }//end of loop
    
    if ($foundmatch == false) print "Name and ID not found";

?>