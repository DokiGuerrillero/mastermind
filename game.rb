require 'gosu'

require_relative 'lib/player'
require_relative 'lib/feedback'

WIDTH, HEIGHT = 1280 , 720
PADDING = 20


p human = Player.new()

class Game < Gosu::Window
  def initialize 
    super WIDTH, HEIGHT
    @game_status = {menu: true, robot: false, human: false}
    @current_game = nil

    text =  "Welcome to ruby Mastermind. Select the game mode pls :)"
    @text = Gosu::Image.from_text text, 25, width: WIDTH - 10 * PADDING

    @human_img = Gosu::Image.new("./lib/assets/human.png")
    @robot_img = Gosu::Image.new("./lib/assets/robot.png")


    @p1a = false
    @p1b = false
    @p2a = false
    @p2b = false
    @p3a = false
    @p3b = false
    @p4a = false
    @p4b = false
    @send_but = false

    self.fullscreen=(false)
    self.borderless=(true)
  end

  def human_start
    @current_game = Human.new
  end

  def robot_start
    @current_game = Computer.new
  end

  def update
    @mouse_x = self.mouse_x
    @mouse_y = self.mouse_y
    
    if @game_status[:menu] == true
      if Gosu.distance(@mouse_x, @mouse_y, (WIDTH/1.5) + 130, (HEIGHT/3)+100) < 100
        text = "ROBOT"
        @text = Gosu::Image.from_text text, 25 ,width: WIDTH 
        if Gosu.button_down?(Gosu::MS_LEFT)
          @game_status[:menu] = false
          @game_status[:robot] = true
          robot_start
        end
      end
      
      if Gosu.distance(@mouse_x, @mouse_y, (WIDTH/7) + 130, (HEIGHT/3)+100) < 100
        text = "HUMAN"
        @text = Gosu::Image.from_text text, 25 ,width: WIDTH 
        if Gosu.button_down?(Gosu::MS_LEFT) 
          @game_status[:menu] = false
          @game_status[:human] = true
          human_start
        end
      end
    end
    if @game_status[:human] == true
      @current_game.update
      if @current_game.turn < 13 && @current_game.feedback[:right] < 4 

        #__________________ MOUSE_INPUT_____________________________________________________________________________________________________________________________________
        #1 ball
        if Gosu.distance(@mouse_x, @mouse_y,50,(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p1a == false
            @p1a = true
            @current_game.balls[0].data[:number] += 1
          end
        else
          @p1a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,50,(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT)   
          if @p1b == false
            @p1b = true
            @current_game.balls[0].data[:number] -= 1
          end
        else
          @p1b = false
        end
        #2 ball
        if Gosu.distance(@mouse_x, @mouse_y,150,(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p2a == false
            @p2a = true
            @current_game.balls[1].data[:number] += 1
          end
        else
          @p2a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,150,(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p2b == false
            @p2b = true
            @current_game.balls[1].data[:number] -= 1
          end
        else
          @p2b = false
        end
        #3 ball
        if Gosu.distance(@mouse_x, @mouse_y,(250),(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p3a == false
            @current_game.balls[2].data[:number] += 1
            @p3a = true
          end
        else
          @p3a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,(250),(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p3b == false
            @current_game.balls[2].data[:number] -= 1
            @p3b = true
          end
        else
          @p3b = false
        end
        #4 ball
        if Gosu.distance(@mouse_x, @mouse_y,(350),(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p4a == false
            @current_game.balls[3].data[:number] += 1
            @p4a = true
          end
        else
          @p4a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,(350),(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p4b == false
            @current_game.balls[3].data[:number] -= 1
            @p4b = true
          end
        else
          @p4b = false
        end

        #Enter
        if ((Gosu.distance(@mouse_x, @mouse_y,450,(HEIGHT/4)+145) < 25) && Gosu.button_down?(Gosu::MS_LEFT)) ||  Gosu.button_down?(Gosu::KB_RETURN)
          if @send_but == false
            @current_game.player_code.clear
            @current_game.balls.each {|ball| @current_game.player_code.push(ball.data[:number])}
            feedback = Feedback.interpreter(@current_game.code,@current_game.player_code)
            @current_game.feedback_assign(feedback[0],feedback[1])
            @current_game.text_act
            @current_game.turn += 1

            @send_but = true
          end
        else
          @send_but = false
        end
      else
        #win
        if @current_game.feedback[:right] == 4 
          @current_game.name_get("Human")
          @current_game.win_screen
          if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) || Gosu.button_down?(Gosu::KB_LEFT_SHIFT)
            @game_status[:human] = false
            @current_game = nil
            text =  "Welcome to ruby Mastermind. Select the game mode pls :)"
            @text = Gosu::Image.from_text text, 25, width: WIDTH - 10 * PADDING
            @game_status[:menu] = true
          end
        #lose
        else
          @current_game.name_get("Human")
          @current_game.lose_screen
          if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) ||Gosu.button_down?(Gosu::KB_LEFT_SHIFT)
            @current_game = nil
            @game_status[:human] = false
            text =  "Welcome to ruby Mastermind. Select the game mode pls :)"
            @text = Gosu::Image.from_text text, 25, width: WIDTH - 10 * PADDING
            @game_status[:menu] = true
          end
        end
      end
    end

    if @game_status[:robot] == true
      @current_game.update
      if @current_game.turn == 0
        #__________________ MOUSE_INPUT_____________________________________________________________________________________________________________________________________
        #1 ball
        if Gosu.distance(@mouse_x, @mouse_y,50,(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p1a == false
            @p1a = true
            @current_game.balls[0].data[:number] += 1
          end
        else
          @p1a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,50,(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT)   
          if @p1b == false
            @p1b = true
            @current_game.balls[0].data[:number] -= 1
          end
        else
          @p1b = false
        end
        #2 ball
        if Gosu.distance(@mouse_x, @mouse_y,150,(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p2a == false
            @p2a = true
            @current_game.balls[1].data[:number] += 1
          end
        else
          @p2a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,150,(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p2b == false
            @p2b = true
            @current_game.balls[1].data[:number] -= 1
          end
        else
          @p2b = false
        end
        #3 ball
        if Gosu.distance(@mouse_x, @mouse_y,(250),(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p3a == false
            @current_game.balls[2].data[:number] += 1
            @p3a = true
          end
        else
          @p3a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,(250),(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p3b == false
            @current_game.balls[2].data[:number] -= 1
            @p3b = true
          end
        else
          @p3b = false
        end
        #4 ball
        if Gosu.distance(@mouse_x, @mouse_y,(350),(HEIGHT/4)+125) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p4a == false
            @current_game.balls[3].data[:number] += 1
            @p4a = true
          end
        else
          @p4a = false
        end

        if Gosu.distance(@mouse_x, @mouse_y,(350),(HEIGHT/4)+175) < 20 && Gosu.button_down?(Gosu::MS_LEFT) 
          if @p4b == false
            @current_game.balls[3].data[:number] -= 1
            @p4b = true
          end
        else
          @p4b = false
        end

        #Enter
        if ((Gosu.distance(@mouse_x, @mouse_y,450,(HEIGHT/4)+145) < 25) && Gosu.button_down?(Gosu::MS_LEFT)) ||  Gosu.button_down?(Gosu::KB_RETURN)
          if @send_but == false
            @current_game.delete_arrows
            @current_game.balls.each {|ball| @current_game.code.push(ball.data[:number])}
            array = []
            1296.times do |i|
              array[i] = sprintf("%04d",i.to_s(6).to_i).split("").map!{|element| element = element.to_i + 1 }
            end
            @current_game.ball_writter
            @current_game.options = array
            feedback = Feedback.interpreter(@current_game.code,@current_game.player_code)
            @current_game.feedback_assign(feedback[0],feedback[1])
            @current_game.computer_filter
            @current_game.computer_selector
            @current_game.ball_writter
            @current_game.text_act
            @current_game.turn += 1

            @send_but = true
          end
        else
          @send_but = false
        end
      elsif @current_game.turn < 13 && @current_game.feedback[0] < 4 
        #Enter
        if ((Gosu.distance(@mouse_x, @mouse_y,450,(HEIGHT/4)+145) < 25) && Gosu.button_down?(Gosu::MS_LEFT)) ||  Gosu.button_down?(Gosu::KB_RETURN)
          if @send_but == false
            feedback = Feedback.interpreter(@current_game.code,@current_game.player_code)
            @current_game.feedback_assign(feedback[0],feedback[1])
            if @current_game.feedback[0] != 4
              @current_game.computer_filter
              @current_game.computer_selector
              @current_game.text_act
            end
            @current_game.ball_writter
            @current_game.turn += 1
            @send_but = true
          end
        else
          @send_but = false
        end
      else
        #win
        if @current_game.feedback[0] == 4 
          @current_game.name_get
          @current_game.win_screen
          if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) || Gosu.button_down?(Gosu::KB_LEFT_SHIFT)
            @game_status[:robot] = false
            @current_game = nil
            text =  "Welcome to ruby Mastermind. Select the game mode pls :)"
            @text = Gosu::Image.from_text text, 25, width: WIDTH - 10 * PADDING
            @game_status[:menu] = true
          end
        #lose
        else
          @current_game.name_get
          @current_game.lose_screen
          if Gosu.button_down?(Gosu::KB_RIGHT_SHIFT) ||Gosu.button_down?(Gosu::KB_LEFT_SHIFT)
            @current_game = nil
            @game_status[:robot] = false
            text =  "Welcome to ruby Mastermind. Select the game mode pls :)"
            @text = Gosu::Image.from_text text, 25, width: WIDTH - 10 * PADDING
            @game_status[:menu] = true
          end
        end
      end
    end
  end
  
  def draw
    if @game_status[:menu] == true
      @text.draw 10, 10
      @human_img.draw_as_quad((WIDTH/7) + 30, HEIGHT/3, 0xffffffff, (WIDTH/7) + 230, HEIGHT/3, 0xffffffff, (WIDTH/7) + 30, (HEIGHT/3)+200, 0xffffffff, (WIDTH/7) + 230, (HEIGHT/3)+200, 0xffffffff, 0) 
      @robot_img.draw_as_quad((WIDTH/1.5) + 30, HEIGHT/3, 0xffffffff, (WIDTH/1.5) + 230, HEIGHT/3, 0xffffffff, (WIDTH/1.5) + 30, (HEIGHT/3)+200, 0xffffffff, (WIDTH/1.5) + 230, (HEIGHT/3)+200, 0xffffffff, 0) 
    end
    if @game_status[:human] == true
      @current_game.draw unless @current_game == nil
    end
    if @game_status[:robot] == true
      @current_game.draw unless @current_game == nil
    end
  end
  
  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end

  def mouse_location
    [@mouse_x , @mouse_y]
  end

end