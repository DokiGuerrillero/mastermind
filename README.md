<h1>RUBY MASTERMIND.</h1> 

  <h2>0.- WHY DID I MAKE THIS?</h2><br>
    Because you probably are right now like i were just a couple of hours ago so i'll give all the info you need of this project<br>

  <h2>1.- ALGORITHM USED AND EXPLANATION:</h2>
    Swaszek Algorithm:<br>
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
  
  <h2>2.- HOW DID I MAKE THE GUI?</h2>
    Gosu. This is a link to their docs : "https://www.rubydoc.info/gems/gosu/Gosu" <-------- <br>

  <h2>3.- WHICH DESING DID I USE?</h2>
    This arquitecture:<br>
       " <br>
         Menu:<br>
          Human: Play and return to menu<br>
          Robot: Play and return to menu<br>
                                          "<br>
    And the files<br>
       "<br>
         ./Main/<br>
          This hold the launcher and the game engine.<br>
          ./Lib/<br>
           This hold the libraries and the logic Framework<br>
           ./Assets/<br>
            This hold the Images and other things.<br>

  <h2>4.- ADVICE</h2>
      You should read the documentations in arrays. there you will find the tools that you will need, and plan ahead the project before jumping on it.

  <h2>5.- HONORS</h2>
      I want to dedicate this project to my dog and my chair for supporting me emotionally and literally while i was doing this.


<h2>With all of this said i wish you...</h2>

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░████████░░░░░░░░░
░░███████░░░░░░░░░░███▒▒▒▒▒▒▒▒███░░░░░░
░░█▒▒▒▒▒▒█░░░░░░░███▒▒▒▒▒▒▒▒▒▒▒▒███░░░░
░░░█▒▒▒▒▒▒█░░░░██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██░░
░░░░█▒▒▒▒▒█░░░██▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒███░
░░░░░█▒▒▒█░░░█▒▒▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒██
░░░█████████████▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒██
░░░█▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒██
░██▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒██▒▒▒▒▒▒▒▒▒██▒▒▒▒██
██▒▒▒███████████▒▒▒▒▒██▒▒▒▒▒▒▒██▒▒▒▒▒██
█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒███████▒▒▒▒▒▒▒██
██▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██░
░█▒▒▒███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██░░░
░██▒▒▒▒▒▒▒▒▒▒▒███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█░░░░░
░░████████████░░░████████████████░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░▄█████▄░▄███████▄░▄███████▄░██████▄░░
░░██▒▒▒▒█░███▒▒▒███░███▒▒▒███░██▒▒▒██░░
░░██▒▒▒▒▒░██▒▒▒▒▒██░██▒▒▒▒▒██░██▒▒▒██░░
░░██▒▒▒▀█░███▒▒▒███░███▒▒▒███░██▒▒▒██░░
░░▀█████▀░▀███████▀░▀███████▀░██████▀░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░██▒▒▒▒░██▒▒▒██░▄█████░██▒▒▒▒██▀░░░░
░░░░██▒▒▒▒░██▒▒▒██░██▀▒▒▒░██▒▒▒██░░░░░░
░░░░██▒▒▒▒░██▒▒▒██░██▒▒▒▒░█████▀░░░░░░░
░░░░██▒▒▒▒░██▄▒▄██░██▄▒▒▒░██▒▒▒██░░░░░░
░░░░▀█████░▀█████▀░▀█████░██▒▒▒▒██▄░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

:D
