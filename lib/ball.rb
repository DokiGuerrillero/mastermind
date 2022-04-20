require 'gosu'
class Ball 
  attr_accessor :data
  def initialize (number, position)
    @data = {number: number, position: position , selected: false }
    @img = Gosu::Image.new("./lib/assets/ball.png")
    @color = Gosu::Color::BLACK.dup
  end
  def wrap
    @data[:number] = ((@data[:number] - 1) % 6) + 1 
  end
  def color
    case @data[:number]
    when 1
      #Yellow
      @color.red = 200
      @color.green = 200
      @color.blue = 0
    when 2
      #Green
      @color.red = 50
      @color.green = 256
      @color.blue = 50
    when 3
      #Red
      @color.red = 256
      @color.green = 20
      @color.blue = 50
    when 4
      #Cyan
      @color.red = 0
      @color.green = 256
      @color.blue = 256
    when 5
      #Purple
      @color.red = 256
      @color.green = 0
      @color.blue = 256
    when 6
      #Purple
      @color.red = 100
      @color.green = 100
      @color.blue = 256
    end
  end

  def draw(x,y)
    #Gosu.draw_rect(x, y, 100, 100, @color , z = 0, mode = :default)
    @img.draw(x, y, 0 ,1,1,@color, mode = :default) 
  end
end