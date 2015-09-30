 module ForestMethods
  #*******************METHODS DEFINE****************

  #*********Say Something...*********************
  def say(statement, statement2)
    puts statement
    if statement2 == nil
      nil
    else
      puts statement2
    end
  end

  #*********To allow user to Read..**********************
  def wait_for_user
    say "Press [ENTER] to continue.\n", nil
    gets
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

  def starting_the_story_tale(name)

    saying_sleep_spacebetween_and_waitforuser(nil,1,60,nil)
    saying_sleep_spacebetween_and_waitforuser("#{name} you are walking through the forest kind lost.",2,2,nil)  
    saying_sleep_spacebetween_and_waitforuser("It's dark, and a 'BEAR' is approaching really quickly,",2,2,nil)
    saying_sleep_spacebetween_and_waitforuser("and you start to freak out and don't know what to do!",2,2,nil)
    saying_sleep_spacebetween_and_waitforuser("But, good news! You see a house, really close.",2,2,nil)
  end

  #*********#Dsiplaying the User and Bear Life..**********************
  def saying_user_and_bear_lifes(name, player_life, bear_life)
    say "#{name} here is your life: #{player_life}", "THis is the BEAR life: #{bear_life}"
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
      2.times { sleep(1); print "."}
      spaces_between(1)
      return player_life
  end

  #*************Method The Player Turns******************
  def player_turn(bear_life, name)
    say "*************PLAYER TURN*************", "BEAR life before #{name} hitting: #{bear_life}"
    damage_point_bear = player_hitting
    bear_life = bear_life - damage_point_bear
    say "You hit the BEAR #{damage_point_bear}", "BEAR life after #{name} hitting: #{bear_life}"
    2.times { sleep(1); print "."}
    spaces_between(1)
    return bear_life
  end

  #*************When player say YES to fight******************
  def if_user_say_yes_to_fight(name,player_life,bear_life)

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
  end

  #*************When player say NO to fight******************
  def if_user_say_no_to_fight(name)
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
  end

  #*************When case is STAY******************
  def when_case_is_stay(name)
    say "#{name}!! You're really brave.",nil
      4.times { sleep(1); print "."}
      spaces_between(2)
  end

  #*************When case is HOUSE******************
  def when_case_is_house(name)
      saying_sleep_spacebetween_and_waitforuser("Run #{name} to the house!",2,1,nil)
      saying_sleep_spacebetween_and_waitforuser("OHH! 'BEAR' hit you #{name}, keep running to the house...",3,1,nil)
      saying_sleep_spacebetween_and_waitforuser("Great agility #{name}",2,1,nil)
      saying_sleep_spacebetween_and_waitforuser("#{name} you are very close, keep going.",2,1,nil)
      saying_sleep_spacebetween_and_waitforuser("Yay! You made it to the house, Ufff!!.. That was close #{name}.",4,1,nil)
      saying_sleep_spacebetween_and_waitforuser("You are safe now!",(3.times {say "--"; sleep(2)}),2,true)
  end

  #*************When case is RUN******************
  def when_case_is_run(name,bear_life= nil)
    saying_sleep_spacebetween_and_waitforuser("#{name} Run faster, the BEAR is right after you...",4,2,nil)
    saying_sleep_spacebetween_and_waitforuser("You definitely need to train your speed",4,2,nil)
    saying_sleep_spacebetween_and_waitforuser("#{name} throw that rock to the BEAR.",4,2,nil)
    saying_sleep_spacebetween_and_waitforuser(("BEAR life: #{bear_life - (rand(15) + 1)}, #{name} that was a great hit for distraction, keep running.."),5,2,nil)
    saying_sleep_spacebetween_and_waitforuser("Great #{name}! You made it through, this time!", 4,2,true)
  end

  #*************Print Welcome Message******************
  def print_welcome_my_name()

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

    saying_sleep_spacebetween_and_waitforuser(nil,1,2,nil)
    dash_seperated(50)
    message = "\n\t\t\tHenry Arbolaez\n" + 
              "\nVersion:  #{VERSION}\n" +
              "\nDate: #{Time.now.to_date}"
    say(message,nil)
    dash_seperated(50)
  end

  #*************ENG Game message******************
  def end_game_message(name)

    lets_try_again = "" #Declaring a variable to check if to play again..*
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
end