require "./robots.rb"
require "minitest/autorun"
require 'stringio'

module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end


describe Robot do
  before do
    @robot = Robot.new(1,2,"NORTH")
  end

  describe "when asked about position" do
    it "must say" do
      @robot.inspect.must_equal "1,2,NORTH"
    end
  end
  
  describe "when asked to move up" do
    it "must say" do
      @robot.move
      @robot.inspect.must_equal "1,3,NORTH"
    end
  end
  
  describe "when asked to dance" do
    it "must say" do
      @robot.left
      @robot.inspect.must_equal "1,2,WEST"
      @robot.right
      @robot.inspect.must_equal "1,2,NORTH"
    end
  end
  
  describe "when asked to move left" do
    it "must say" do
      @robot.left
      @robot.move
      @robot.inspect.must_equal "0,2,WEST"
    end
  end
  
  describe "when asked to leave the board" do
    it "must stay" do
      @robot.left
      @robot.move
      @robot.move
      @robot.inspect.must_equal "0,2,WEST"
    end
  end
  
  describe "examples" do 
    it "must return" do
      s = capture_stdout do
        run_robots File.new("test.stdin")
      end
      s.string.must_equal "0,1,NORTH\n0,0,WEST\n3,3,NORTH\n"
    end
  end
end

