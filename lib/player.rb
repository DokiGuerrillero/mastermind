#This is the parent of human and computer
require 'gosu'
require_relative 'ball.rb'
require_relative 'arrow.rb'
require_relative 'random_number.rb'

class Player 
  def initialize
    @play = []
    @name = ""
    @actual_text = ""
    @final_img = nil
    @end_condition = false
  end

  def end_exec
    @end_condition = true
  end

  def name_get(name_string = "Deus-Ex-Machina")
    @name = name_string
  end

  def lose_screen()
    end_exec
    @actual_text = "#{@name} lost. :c"
    @final_img =  Gosu::Image.from_text(@actual_text,60,{})
  end

  def win_screen()
    end_exec
    @actual_text = "#{@name} won. c:"
    @final_img =  Gosu::Image.from_text(@actual_text,60,{})
  end
end

class Human < Player
  attr_reader :feedback
  attr_accessor :balls 
  attr_accessor :player_code
  attr_accessor :turn
  attr_reader :code
  
  def initialize
    @text = []
    @balls = []
    @arrows = []
    @player_code = []
    @feedback = {right: 0, wrong:0}
    @feed_balls = []
    @code_text = ""
    @turn = 0
    @code = RANDOM.random
    ball_caller

    @mastermind = Gosu::Image.from_text("MASTERMIND", 40, {})
  end

  def feedback_assign (right,wrong)
    @feedback[:right] = right
    @feedback[:wrong] = wrong
  end

  def text_act
    code_text = @player_code
    @code_text = Gosu::Image.from_text("Last play: #{code_text}.  Turn: #{@turn+1} ", 40, {})
  end

  def ball_caller
    (0..3).each do |index|
      @balls.push(Ball.new(1,index))
      (0..1).each do |i|
        @arrows.push(Arrow.new(i,index))
      end
    end
  end

  def update
    @balls.each_with_index do |ball,i|
      ball.color
      ball.wrap
      text = ball.data[:number].to_s
      @text[i] = Gosu::Image.from_text text, 30, {}
    end
    @arrows.each do |arrow|
      arrow.color
    end
  end

  def draw
    if @turn < 13 && @feedback[:right] < 4 
      @feedback[:right].times do |index|
        Gosu.draw_rect(425+(index*30),(HEIGHT/4)+20, 25, 25, Gosu::Color.argb(0xff_ffffff), z = 0, mode = :default)
      end
      @feedback[:wrong].times do |index|
        Gosu.draw_rect(425+(index*30),(HEIGHT/4)+50, 25, 25, Gosu::Color.argb(0xff_ff6666), z = 0, mode = :default)
      end
      if turn != 0
        @code_text.draw(20,400)
      end
      Gosu.draw_rect(425,(HEIGHT/4)+125, 50, 50, Gosu::Color.argb(0xff_9933bb), z = 0, mode = :default)
      @mastermind.draw(20,50)
      @balls.each_with_index do |ball, index|
        @text[index].draw(((index)*(100))+ 44,(HEIGHT/4)-35)
        ball.draw((index)*(100),HEIGHT/4)
        arrows = @arrows.select{|arrow| arrow.data[:position] == index}
        arrows.each do |arrow|
          if arrow.data[:operation] == 0
            arrow.draw(((index)*(100)+50),(HEIGHT/4)+125)
          else
            arrow.draw(((index)*(100)+50),(HEIGHT/4)+175)
          end
        end
      end
    else 
      @final_img.draw(WIDTH/3,HEIGHT/2) unless @final_img == nil
      Gosu::Image.from_text("Press shift to continue",16,{}).draw(WIDTH-150,HEIGHT-20)
    end
  end
end

class Computer < Player
  attr_reader :feedback
  attr_accessor :balls 
  attr_accessor :player_code
  attr_accessor :turn
  attr_accessor :code
  attr_accessor :options
  
  def initialize
    @text = []
    @balls = []
    @arrows = []
    @player_code = [1,1,2,2]
    @options = []
    @feedback = [0, 0]
    @feed_balls = []
    @code_text = ""
    @turn = 0
    @code = []
    ball_caller

    @mastermind = Gosu::Image.from_text("MASTERMIND", 40, {})
  end
  def ball_writter
    @balls.each_with_index do |ball,i|
      ball.data[:number] =  @player_code[i]
    end
  end

  def computer_filter
    @options.select! do |option|
      Feedback.interpreter(@player_code,option) == @feedback
    end
  end

  def computer_selector
    @player_code = @options.shift
  end

  def feedback_assign (right,wrong)
    @feedback[0] = right
    @feedback[1] = wrong
  end

  def text_act
    code_text = @player_code
    @code_text = Gosu::Image.from_text("Last play: #{@player_code}.  Turn: #{@turn+1} ", 40, {})
  end

  def ball_caller
    (0..3).each do |index|
      @balls.push(Ball.new(1,index))
      (0..1).each do |i|
        @arrows.push(Arrow.new(i,index))
      end
    end
  end

  def delete_arrows
    @arrows.clear
  end

  def update
    @balls.each_with_index do |ball,i|
      ball.color
      ball.wrap
      text = ball.data[:number].to_s
      @text[i] = Gosu::Image.from_text text, 30, {}
    end
    @arrows.each do |arrow|
      arrow.color
    end
  end

  def draw
    if @turn < 13 && @feedback[0] < 4 
      @feedback[0].times do |index|
        Gosu.draw_rect(425+(index*30),(HEIGHT/4)+20, 25, 25, Gosu::Color.argb(0xff_ffffff), z = 0, mode = :default)
      end
      @feedback[1].times do |index|
        Gosu.draw_rect(425+(index*30),(HEIGHT/4)+50, 25, 25, Gosu::Color.argb(0xff_ff6666), z = 0, mode = :default)
      end
      if turn != 0
        @code_text.draw(20,400)
      end
      Gosu.draw_rect(425,(HEIGHT/4)+125, 50, 50, Gosu::Color.argb(0xff_9933bb), z = 0, mode = :default)
      @mastermind.draw(20,50)
      @balls.each_with_index do |ball, index|
        @text[index].draw(((index)*(100))+ 44,(HEIGHT/4)-35)
        ball.draw((index)*(100),HEIGHT/4)
        arrows = @arrows.select{|arrow| arrow.data[:position] == index}
        arrows.each do |arrow|
          if arrow.data[:operation] == 0
            arrow.draw(((index)*(100)+50),(HEIGHT/4)+125)
          else
            arrow.draw(((index)*(100)+50),(HEIGHT/4)+175)
          end
        end
      end
    else 
      @final_img.draw(WIDTH/3,HEIGHT/2) unless @final_img == nil
      Gosu::Image.from_text("Press shift to continue",16,{}).draw(WIDTH-150,HEIGHT-20)
    end
  end
end