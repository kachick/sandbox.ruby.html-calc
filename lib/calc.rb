# coding: us-ascii

require_relative 'calc/version'

class Calc
  class << self
    def run(commands)
      calc = new
      calc.run commands
    end
  end

  def initialize
    @operation = nil
    @numbers_stack = []
    @current = 0
  end

  def run(commands)
    commands.each_char do |char|
      case char
      when /\A\d\z/, '.'
        @numbers_stack.push char
      when '='
        flush
      when '+', '-', '*', '/'
        flush
        @operation = char
      when 'C'
        clear
      when 'AC'
        all_clear
      end
    end
    
    result
  end
  
  def result
    @numbers_stack.empty? ? @current : number
  end
  
  def number
    @numbers_stack.join.to_i
  end  

  def clear
    @operation = nil
    @numbers_stack.clear
  end
  
  def all_clear
    clear
    @current = 0
  end

  def flush
    if @operation
      @current = @current.__send__ @operation, number.to_f
    else
      unless @numbers_stack.empty?
        @current = number
      end
    end
    
    clear
  end
end
