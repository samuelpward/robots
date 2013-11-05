class Robot
  @@grid_x = 4
  @@grid_y = 4
  
  def initialize(x,y,facing)
    if (x.to_i >= 0 && x.to_i <= @@grid_x && y.to_i >= 0 && y.to_i <= @@grid_y && facing =~ /NORTH|SOUTH|EAST|WEST/) then
      @x = x.to_i
      @y = y.to_i
      case facing
        when "NORTH"
          @facing = :north
        when "SOUTH"
          @facing = :south
        when "EAST"
          @facing = :east
        when "WEST"
          @facing = :west
      end
    end
  end
  
  def move
    case @facing
      when :north
        if @y < @@grid_y then @y = @y + 1 end
      when :south
        if @y > 0 then @y = @y - 1 end
      when :east
        if @x < @@grid_x then @x = @x + 1 end
      when :west
        if @x > 0 then @x = @x - 1 end
    end
  end
  

  def left
    case @facing 
      when :north then @facing = :west
      when :south then @facing = :east
      when :east then @facing = :north
      when :west then @facing = :south
    end
  end
  
  def right
    case @facing
      when :north then @facing = :east
      when :south then @facing = :west
      when :east then @facing = :south
      when :west then @facing = :north
    end
  end
  
  def inspect
    "#{@x},#{@y},#{@facing.to_s.upcase}"
  end
end

def run_robots(f)
  robot = nil
  while (line = f.gets)
    if (line =~ /PLACE \d,\d,(NORTH|SOUTH|EAST|WEST)/)
      place_var = line.split(' ')[1].split(',')
      robot = Robot.new(place_var[0],place_var[1],place_var[2])
    else
      if robot
        case line.chomp.split(' ')[0]
          when "MOVE" then robot.move
          when "LEFT" then robot.left
          when "RIGHT" then robot.right
          when "REPORT" then puts robot.inspect
        end
      end  
    end
  end
end

if __FILE__==$0
  run_robots(STDIN)
end