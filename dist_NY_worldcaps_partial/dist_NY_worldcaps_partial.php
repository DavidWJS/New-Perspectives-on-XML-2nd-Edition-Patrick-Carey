<?php
    $countryName = $_GET["countryTxtBx"];
    
    $file = fopen("dist_NY_worldcaps_partial.csv","r");
    
    $reading = 2;
    
    $foundmatch = false;
    
    while (($row = fgetcsv($file, 0, ",")) != FALSE) {
        if ($reading > 2) {
            $countryInFile = $row[0];
            $capitalInFile = $row[1];
            $milesInFile = $row[2];
            $kilometersInFile = $row[3];
            
            if (strcasecmp($countryName,$countryInFile)==0) {
                $foundmatch = true;
                print "Distance from NY to World's capital<br><br>";
                print "Country: ".$countryInFile.", Capital: ".$capitalInFile.", ".$milesInFile."miles, ".$kilometersInFile."kilometers.";
                break;
            }
        }
        else
            $reading++;
    }
    
    if ($foundmatch == false)
        print "Country is not found";

?>