RUBY MASTERMIND.

  0.- WHY DID I MAKE THIS?
    Because you probably are right now like i were just a couple of hours ago so i'll give all the info you need of this project

  1.- ALGORITHM USED AND EXPLANATION:
    Swaszek Algorithm:
      I selected it for being computationally fast and work like this:
      
        1. Create a list of 1296 items as all psoible options ("why? because you have 6 option per ball and 4 balls. so the total amount of combinations 
            would end up being 6^4 = 1296").
        2. Start as "1122"
        3. Get feedback.
        4. Delete ALL OPTIONS that would not give the same feedback if the "CURRENT GUESS" were the original code (DO NOT COMPARE IT WITH THE ORIGINAL 
            CODE, rather something like this if the code were "1221" and you guess "1122"(wich would give 2white 2red) remove all the code wich compared 
            to "1122" do not give 2 whites and to reds) 
        5. Pick the first element of the list and use it as the new guess
        6. Repeat from 3
  
  2.- HOW DID I MAKE THE GUI?
    Gosu. This is a link to their docs : "https://www.rubydoc.info/gems/gosu/Gosu" <--------

  3.- WICH DESING DID YOU USED?
    This arquitecture:
       " 
         Menu:
          Human: Play and return to menu
          Robot: Play and return to menu
                                          "
    And the files
       "
         ./Main/
          This hold the launcher and the game engine.
          ./Lib/
           This hold the libraries and the logic Framework
           ./Assets/
            This hold the Images and other things.

  4.- ADVICE
      You should read the documentations in arrays. there you will find the tools that you will need, and plan ahead the project before jumping on it.

  5.- HONORS
      I want to dedicate this project to my dog and my chair for supporting me emotionally and literally while i was doing this.


With all of this said i wish you...

_________________________________________________________________________________________________________________________________________________________


  GGGGGGGGGG      OOOOOOOO        OOOOOOOO      DDDDDD                LL            UU        UU        CCCCCCCC    KK      KK
GG              OO        OO    OO        OO    DD    DD              LL            UU        UU      CC            KK    KK
GG              OO        OO    OO        OO    DD      DD            LL            UU        UU    CC              KK  KK
GG              OO        OO    OO        OO    DD      DD            LL            UU        UU    CC              KKKK
GG  GGGGGGGGGG  OO        OO    OO        OO    DD      DD            LL            UU        UU    CC              KK  KK
GG          GG  OO        OO    OO        OO    DD      DD            LL            UU        UU    CC              KK    KK
GG          GG  OO        OO    OO        OO    DD    DD              LL            UU        UU      CC            KK      KK
  GGGGGGGGGG      OOOOOOOO        OOOOOOOO      DDDDDD                LLLLLLLLLLL     UUUUUUUU          CCCCCCCC    KK      KK

_________________________________________________________________________________________________________________________________________________________

:D
