
VAR baby_blue = false
VAR visited_basement_room_1 = false
VAR visited_basement_room_2 = false
VAR visited_basement_room_3= false
VAR hopeful = false
VAR not_entered_yet = true
-> Intro

== Intro == 
When you moved into your college apartment, there was some furniture left by the previous tenants. 

You decide one day that you want to paint a nightstand left behind. Which color do you choose?
* Pale yellow
* Baby blue
~baby_blue = true
* Black
- {baby_blue: Good choice!} {not baby_blue: That's certainly a choice!} As you are taking the drawer out to get started on your project, a piece of paper flutters out and lands on the floor
* [Pick it up]
The letter reads:
-> Intro.letter

* [Crumple it] ugh how annoying, first they leave their furniture, and they don't even have the decency to clean it out
-> DONE

//Stitch 1
= letter
38.0356° N, 78.5034° W

You're feeling iffy. 
* Flip a coin to decide whether you take this adventure. Heads and you'll embark!
You flip {~ heads...  -> Outside_rotunda |tails...  -> DONE}//Shuffle


== Outside_rotunda == 
{not_entered_yet: The coordinates belong to the UVA rotunda. Do you wish to enter? }
* Yes!
-> Inside_rotunda
* [Erm, I need a second...] You sit on the marble steps with a false sense of wisdom
-> Outside_rotunda
//Fallback 2
* ->
Sitting out there, someone walks by talking about the myth of Jefferson's true burial....
-> DONE

== Inside_rotunda == 
~not_entered_yet = false
You are inside the {&magnificent | ethereal | majestic |iconic} {&Rotunda|tundy}, on the main floor. Do you wish to
+ Journey upstairs 
-> Inside_rotunda.top_floor
+ {not visited_basement_room_3} Basement time! 
-> Inside_rotunda.basement
* Stay on this level 
-> Inside_rotunda.ground_floor
* Go back outside, this is stupid you have schoolwork to do... 
-> Outside_rotunda

//Stitch 2
= ground_floor
    All that's up here is the <i>fake</i> Jefferson... you're here for the real thing (wink wink)
    -> Inside_rotunda

//Stitch 3
= basement
    {not basement_room_1: The basement here always smells damp and the dim lighting on dirty red brick is reminiscent of a pizza restaurants back rooms. You shudder, this is the kind of place you can't stand around in too long.}
    
     {not visited_basement_room_3 and not hopeful: In the central basement room, which do you want to explore:}
     {visited_basement_room_3: It was that room! You notice a secret passage way, venture if you dare!}
    //Conditional choice
    * First basement room
    -> basement_room_1
    * {visited_basement_room_1} Another basement room
    -> basement_room_2
    * {visited_basement_room_2} Maybe what you're looking for is in this room
    -> basement_room_3
    * {visited_basement_room_3} Secret passageway
    ~visited_basement_room_3 = false
    -> Inside_rotunda.secret_passage_entrance
    *{visited_basement_room_3} Maybe there are more rooms to explore first 
    ~visited_basement_room_3 = false
    ~hopeful = true
    -> basement
    //Fallback 1
    *  -> ran_out_of_rooms
//Stitch 4
= basement_room_1
    Nothing interesting found, just some students studying
    *Go back
    ~visited_basement_room_1 = true
    -> Inside_rotunda.basement
    
//Stich 5
= basement_room_2
    Nothing here! 
    *Go back
    ~visited_basement_room_2 = true
    -> Inside_rotunda.basement
//Stitch 6
= basement_room_3
    ~visited_basement_room_3 = true
    -> Inside_rotunda.basement
//Stitch 7
= top_floor
    // Sequence
    {You climb the stairs to the top floor of the Rotunda | Wow, it's a popular touring day you think to yourself as you ascend the stairs | Back again?! Just couldn't stay away could you | Okay your visits to this floor are getting a little too frequent, I think I know what you need -> Inside_rotunda.study_in_rotunda}
    There's not even a <i>fake</i> Jefferson up here, just good views and even better lighting, ugh
    + Go back downstairs
    -> Inside_rotunda
    + [Let's get some work done while we are here] 
    ->Inside_rotunda.study_in_rotunda

//Stitch 8
= study_in_rotunda
    You choose to stay in the best study spot on grounds.
    -> end

//Stitch 9
= secret_passage_entrance
    + {baby_blue} because you painted the hand-me-down nightstand baby blue, you get a very special opportunity. [The code is 035638]
    ++ enter the code
    {not baby_blue: Rethink the paint... -> end}
    -> Code


== Code ==
    You can't seem to remember the code! 
    + Give it your best guess
    -> Code.try_code
    
    //Stitch 10
    = try_code
        //Once Only
        You guess {!053638->try_code | 036538 | 036358| 035638. -> Code.surprise}
        ++ Ugh that's not right, let's try again. -> try_code
    
    //Stitch 11
    = surprise
        It was correct! You find Jefferson's cryoed body! Wooh! -> DONE

== ran_out_of_rooms ==
Uh oh! You ran out of rooms to explore in the basement! 
-> END

== end ==
Maybe one day you will get to fully explore those mysterious coordinates... 
-> END
