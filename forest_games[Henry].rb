require 'date' #Class....require to set the date of today, when calling the Time.now Methods.

VERSION = ("HENRY 0.0000001")

#*******************METHODS DEFINE**************

#*********To allow user to Read..**********************
def wait_for_user
  say "Press [ENTER] to continue.\n", nil
  gets
end


#***********************************Allowed Users**********************************************
def allow_user_array
  allow_user_names = ["ed", "sean","gabe","juha", "johanna","mario","mat","daniel", "adrien", "mikel","diego",
                    "matt","rita","madelene", "jose","katherine","giancarlo","bianca","john", "leif",
                    "pablo","arielle","carolina","henry","david","joseph","guelmis","alberto",
                    "miguel","paola","stefanie","timothy","west","wilfredo","matthew"]
end


#*********************Method to check ALLOWED USERS***********************************
def check_of_who_can_play(names, user_names = nil)
  saying_sleep_spacebetween_and_waitforuser(
  '''    
                _______  _        _______  _______  _______  _______   
      |\     /|(  ____ \( \      (  ____ \(  ___  )(       )(  ____ \  
      | )   ( || (    \/| (      | (    \/| (   ) || () () || (    \/  
      | | _ | || (__    | |      | |      | |   | || || || || (__      
      | |( )| ||  __)   | |      | |      | |   | || |(_)| ||  __)     
      | || || || (      | |      | |      | |   | || |   | || (        
      | () () || (____/\| (____/\| (____/\| (___) || )   ( || (____/\  
      (_______)(_______/(_______/(_______/(_______)|/     \|(_______/  
                                                                         ''',3,spaces_between(5),nil)

    saying_sleep_spacebetween_and_waitforuser('''
           ____  ____  ____  __     _  _   __  ____  ____ 
          (  _ \(  __)(_  _)/ _\   ( \/ ) /  \(    \(  __)
           ) _ ( ) _)   )( /    \  / \/ \(  O )) D ( ) _) 
          (____/(____) (__)\_/\_/  \_)(_/ \__/(____/(____)''',
  0,4,true)
  until (names.include? user_names)
    say "This a Beta Mode. Only allowed user can play. or Type (q)uit to quit game.", "So, type your first name?: "
    print "> "
    user_names = gets.chomp.downcase
      if user_names["daniel"] 
        puts "Enter your last name!: "
        daniel = gets.chomp.downcase
          until ["brito","linas","fusaro","munoz","q"].include? daniel
            say "Wrong!.....Please, make sure you type last name correct..or Type (q)uit to quit!", "Since, you are not allow to play this game...."
            daniel = gets.chomp.downcase
          end
          case daniel
            when "brito"
            saying_sleep_spacebetween_and_waitforuser("Hey, Daniel Brito, you have access!",2,2,true)
            when "furasco"
            saying_sleep_spacebetween_and_waitforuser("Hey, Daniel Fusaro, you have access!",2,2,true)
            when "linas"
            saying_sleep_spacebetween_and_waitforuser("Hey, Daniel Linas, you have acces!",2,2,true)
            when "munoz"
            saying_sleep_spacebetween_and_waitforuser("Hey, Daniel Munoz, you have access!",2,2,true)
            when "q"
            spaces_between(5)
            say "Sorry, but game still under development.",'''
                         ____  _  _  ____    _   
                        (  _ \( \/ )(  __)  / \  
                         ) _ ( )  /  ) _)   \_/  
                        (____/(__/  (____)  (_)  
            '''
            sleep(3)
            wait_for_user()
            exit  
          end
          let_start_this_adventure
          break
        end
        if names.include? user_names
          spaces_between(3)
          puts "'#{user_names.capitalize}' you have  gain full access!"
          wait_for_user()
          let_start_this_adventure
          break
        end
        if ["q"].include? user_names
        spaces_between(5)
        say "Game, still under development......",'''
                     ____  _  _  ____    _   
                    (  _ \( \/ )(  __)  / \  
                     ) _ ( )  /  ) _)   \_/  
                    (____/(__/  (____)  (_)  
        '''
        sleep(3)
        wait_for_user()
        exit  
      end
   end
end

#*********Say Something...*********************
def say(statement, statement2 = nil)
  puts statement
  if statement2 == nil
    nil
  else
    puts statement2
  end
end

#*********#Saying, Sleep, Space Between, Waiting for user **********************
def saying_sleep_spacebetween_and_waitforuser(saying, sleep, spaces, wait_for_the_user)   
  say(saying,nil)   
  sleep(sleep)
  spaces_between(spaces)
  wait_for_user if wait_for_the_user == true
end

#*********Creating '--'**********************
def dash_seperated(number_of_dash)
  number_of_dash.times { print "-"}
end

#*********#Create spaces between content/**********************
def spaces_between(number_of_spaces)
  number_of_spaces.times do
    say " ",nil
  end
end

#*********#Dsiplaying the User and Bear Life..**********************
def saying_user_and_bear_lifes(name, player_life, bear_life)
  say "#{name.upcase} here is your life: #{player_life}", "THis is the BEAR life: #{bear_life}"
  saying_sleep_spacebetween_and_waitforuser(nil,0,2,true)
end

#************Method for Bear Hitting that generate a number from (1 to 8)******************
def bear_hitting 
  rand(8) + 1
end

#*************Method Player Hitting that generate a number from (1 to 10)******************
def player_hitting 
  rand(10) + 1
end

#*************Method The Bear Turns******************
def bear_turn(player_life, name)
    say "*************BEAR TURN*************", "Player life before BEAR hitting: #{player_life}"
    damage_point_player = bear_hitting
    player_life = player_life - damage_point_player
    say "The BEAR hit you! #{damage_point_player}", "Player life after BEAR hitting: #{player_life}"
    2.times { sleep(2); print "."}
    spaces_between(1)
    return player_life
end

#*************Method The Player Turns******************
def player_turn(bear_life, name)
  say "*************PLAYER TURN*************", "BEAR life before #{name} hitting: #{bear_life}"
  damage_point_bear = player_hitting
  bear_life = bear_life - damage_point_bear
  say "You hit the BEAR #{damage_point_bear}", "BEAR life after #{name} hitting: #{bear_life}"
  2.times { sleep(2); print "."}
  spaces_between(1)
  return bear_life
end

#*************Print Welcome Message******************
def print_welcome_my_name

  say '''        
                 ____  __  ____  ____  ____  ____ 
                (  __)/  \(  _ \(  __)/ ___)(_  _)
                 ) _)(  O ))   / ) _) \___ \  )(  
                (__)  \__/(__\_)(____)(____/ (__) ''',nil
  sleep(1)
  say '''                  
        __   ____  _  _  ____  __ _  ____  _  _  ____  ____ 
       / _\ (    \/ )( \(  __)(  ( \(_  _)/ )( \(  _ \(  __)
      /    \ ) D (\ \/ / ) _) /    /  )(  ) \/ ( )   / ) _) 
      \_/\_/(____/ \__/ (____)\_)__) (__) \____/(__\_)(____)      ''',nil
  sleep(1)
  say '''     
         ____  ____  ____  __       ___   __   _  _  ____ 
        (  _ \(  __)(  _ \(  )     / __) / _\ ( \/ )(  __)
         )   / ) _)  ) __// (_/\  ( (_ \/    \/ \/ \ ) _) 
        (__\_)(____)(__)  \____/   \___/\_/\_/\_)(_/(____)  ''',nil
  sleep(1)
  say '''       
             _  _  _  _  __ _   ___  __  ____  ____       
            / )( \( \/ )(  ( \ / __)/  \(    \(  __)      
            \ /\ / )  / /    /( (__(  O )) D ( ) _)       
            (_/\_)(__/  \_)__) \___)\__/(____/(____)      

  ''',nil

  # saying_sleep_spacebetween_and_waitforuser(nil,1,2,nil)
  dash_seperated(50)
  message = "\n\t\t\tHenry Arbolaez\n" + 
            "\nVersion:  #{VERSION}\n" +
            "\nDate: #{Time.now.to_date}"
  say(message,nil)
  dash_seperated(50)
end

#************METHODS DEFINE (FINISHED)************

#*************Star the Game METHOD******************
def let_start_this_adventure 
  spaces_between(5) #Create space on the top
  say(print_welcome_my_name,nil)
  saying_sleep_spacebetween_and_waitforuser(nil,0,3,true)

  spaces_between(60)

  saying_sleep_spacebetween_and_waitforuser("""
  Welcome to this Adventure in the Forest!
  Rules are simple:
  First enter your name first to keep you on record.
  Then just follow the options provided inside the ()

  This adventure is in a forest, you will try  
  get out alive because you are going to faces challenges. 
  """,2,0,true)

#*************Ask for the Name of the user******************
  say "What is your name: ",nil 

  name = gets.chomp.downcase         #name =~
  until (name.length > 1) && (name =~ /([a-z])\w+/)
    say "Seriously!","What is your name: "
    print "> "
    name = gets.chomp.capitalize
  end
  name = name.capitalize

  saying_sleep_spacebetween_and_waitforuser(nil,1,60,nil)
  saying_sleep_spacebetween_and_waitforuser("#{name} you are walking through the forest kind lost.",2,2,nil)  
  saying_sleep_spacebetween_and_waitforuser("It's dark, and a 'BEAR' is approaching really quickly,",2,2,nil)
  saying_sleep_spacebetween_and_waitforuser("and you start to freak out and don't know what to do!",2,2,nil)
  saying_sleep_spacebetween_and_waitforuser("But, good news! You see a house, really close.",2,2,nil)

#*********ASK User For Choices on the Game*********************
  play_option_game = true

  while 
    play_option_game 
    say """
    #{name} be wise on your answer.. 
    Select one of the option! 
    (s)tay to face the 'BEAR', 
    (r)un through the forest, 
    go to the (h)ouse or (q)uit. 
    Type the letter inside the (). 
    """,nil
    print "> " 
    user_choice = gets.chomp.downcase
    break if ["s", "h", "r", "q"].include? user_choice
    # break if user_choice == "s" || user_choice == "h" || user_choice == "r" || user_choice == "q"
  end

  spaces_between(60)

#*********Define Variables for Player and Bear life********************

  bear_life = 25
  player_life = 20

#*********Starting to check what the user Input..**********************
  case user_choice

    when "s"
      say "#{name}!! You're really brave.",nil
      4.times { sleep(1); print "."}
      spaces_between(2)
#*********Loop to verify that the user want to fight..**********************
      user_choice_to_fight = "".downcase

      # user_choice_to_fight == "y" || user_choice_to_fight == "h" || user_choice_to_fight == "n" || user_choice_to_fight == "q"
      until ["y", "h", "n", "q"].include? user_choice_to_fight
        say "#{name} are sure you want to stay to FIGHT? (y or n)",nil
        user_choice_to_fight = gets.chomp.downcase
      end

#********Verifying is player is sure to fight..**********************   
        if (user_choice_to_fight == "y")
          3.times {sleep(1); print ".."}

          spaces_between(2)
          saying_user_and_bear_lifes(name, player_life, bear_life)

#*********Checking if Player or Bear life is less than 0  to run the loop of fighting..**********************
          until player_life <= 0 || bear_life <= 0
              
              # new_player_life = bear_turn(player_life, name)  # won't work because the until loop, will start from the beginning.
              player_life = bear_turn(player_life, name) ## Calling method bear_turn
              if  player_life <= 0
                say "The BEAR won! He hit you really hard #{name}!", "You are dead #{name}.."
                wait_for_user()
                break # break is inside this if statement
              end #end the if statement

              bear_life = player_turn(bear_life, name) ## Calling method player_turn
              if bear_life <= 0
                say "You won! You are very strong #{name}", "Now run and stay safe in the HOUSE."
                wait_for_user()
                break # break is inside this if statement
              end
          end #end the until loop of comparing if player or bear life is <= 0
        end #end the if statement, of if the user select "y" to fight...

#***************Evaluate user_choice_to_fight is 'n' this if will execute..****************
           if (user_choice_to_fight == "n")
            say "\n#{name} R U N N N N"
            4.times {print ".."; sleep(2)}
            spaces_between(1)

            saying_sleep_spacebetween_and_waitforuser("Ohh no! #{name}, you are super slow!!!",3,1,nil)
            saying_sleep_spacebetween_and_waitforuser("The 'BEAR' catch you!!",3,1,nil)
            
            say "HIT you",nil
            2.times { sleep(2); print "."}
            spaces_between(1)
          
            say "EAT you!",nil
            2.times { sleep(2); print "."}
            spaces_between(1)

            saying_sleep_spacebetween_and_waitforuser("You are done! #{name}",3,1,true)

           end #end for the if user_choice_to_figth is 'n'

#*********Checking if Player case choose 'house'**********************
    when "h"
      saying_sleep_spacebetween_and_waitforuser("Run #{name} to the house!",2,1,nil)
      saying_sleep_spacebetween_and_waitforuser("OHH! 'BEAR' hit you #{name}, keep running to the house...",3,1,nil)
      saying_sleep_spacebetween_and_waitforuser("Great agility #{name}",2,1,nil)
      saying_sleep_spacebetween_and_waitforuser("#{name} you are very close, keep going.",2,1,nil)
      saying_sleep_spacebetween_and_waitforuser("Yay! You made it to the house, Ufff!!.. That was close #{name}.",4,1,nil)
      saying_sleep_spacebetween_and_waitforuser("You are safe now!",3.times {say "--"; sleep(2)},2,true)

#*********Checking if Player case choose 'run'**********************
    when "r"
      saying_sleep_spacebetween_and_waitforuser("#{name} Run faster, the BEAR is right after you...",4,2,nil)
      saying_sleep_spacebetween_and_waitforuser("You definitely need to train your speed",4,2,nil)
      saying_sleep_spacebetween_and_waitforuser("#{name} throw that rock to the BEAR.",4,2,nil)
      bear_life_to_check = (bear_life - (rand(16) + 1))
      saying_sleep_spacebetween_and_waitforuser("BEAR life: #{bear_life_to_check}, #{name} that was a great hit for distraction, keep running..",5,2,nil)
      if bear_life_to_check > 10
        saying_sleep_spacebetween_and_waitforuser "#{name}, BEAR caught you! you are dead! Alive....",1,2,true
      else
        saying_sleep_spacebetween_and_waitforuser("Great #{name}! You made it through, this time!", 4,2,true)
      end
#*********Checking if Player choose case 'quit'**********************
    when "q"
      saying_sleep_spacebetween_and_waitforuser("Have a good day #{name}!",2,0,nil)
  end#end the case

  saying_sleep_spacebetween_and_waitforuser(nil,4,60,nil)

#*********Decalring a variable to check if to play again..**********************
  lets_try_again = ""
  say "#{name} Great you saw the Game...",nil
#*********Looping until user type 'y' or 'n' to run again or quit..**********************
    until ["y", "n"].include? lets_try_again
      say "Want to play again? (y or n)",nil
      lets_try_again = gets.chomp.downcase
      if lets_try_again == "y"
        let_start_this_adventure()
        5.times { sleep(3); print "."} #do 5 ..... in sleep mode...
      elsif lets_try_again == "n"
        break #break if lets_try_again is 'n'
      end  # end the if statement of 'y'
    end #end the until lets_try_again loop

   spaces_between(40)

  say '''
                     ______  __ __    ___        ___  ____   ___        __  __ 
                    |      ||  |  |  /  _]      /  _]|    \ |   \      |  ||  |
                    |      ||  |  | /  [_      /  [_ |  _  ||    \     |  ||  |
                    |_|  |_||  _  ||    _]    |    _]|  |  ||  D  |    |__||__|
                      |  |  |  |  ||   [_     |   [_ |  |  ||     |     __  __ 
                      |  |  |  |  ||     |    |     ||  |  ||     |    |  ||  |
                      |__|  |__|__||_____|    |_____||__|__||_____|    |__||__|
                                                                               
  ''',nil
    spaces_between(15)
    # say `clear` # >> to clear the Terminal screen.. 
    2.times { sleep(2); say "--",nil}
    print "Adios, #{name}!\n"; sleep(2)
    2.times { sleep(2); say "--",nil}
end

# #*********Start the Game..**********************
check_of_who_can_play(allow_user_array)


