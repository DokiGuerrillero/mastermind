require 'gosu'
class Arrow
  attr_accessor :data
  def initialize (operation, position)
    @data = {operation: operation, position: position}
    @img = Gosu::Image.new("./lib/assets/arrow.png")
    @color = Gosu::Color::BLACK.dup
    @angle = 0

    @x = 0
    @y = 0
  end
  def data_accs
    @data
  end
  def color
    case @data[:operation]
    when 0
      @color.red = 0
      @color.green = 256
      @color.blue = 0
      @angle = 180
    when 1
      @color.red = 256
      @color.green = 0
      @color.blue = 0
    end
  end

  def draw(x,y)
    @img.draw_rot(x, y, 0, @angle, 0.5, 0.5, 1, 1, @color, mode = :default)
  end
end