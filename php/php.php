<?php
    function nickgen() {
        $vowels = "aeiouy";
        $consonants = "bcdfghjklmnpqrstvwxz";
        $nick = "";

        for ($i = 0; $i < (rand(0, 4) + 3); $i++){
            if (rand(0, 1) == 1){                 
                $nick = $nick . $vowels[rand(0, 5)];                   
            } else {                   
                $nick = $nick . $consonants[rand(0, 19)];
            }
    }
        
        for ($i = 0; $i < rand(0,3); $i++) {
            $nick = $nick . strval(rand(0, 9));
        }
        
        return $nick;
        
    }
    
    for ($i = 0; $i < 10; $i++){
        echo (nickgen() . "<br>");
    }
?>