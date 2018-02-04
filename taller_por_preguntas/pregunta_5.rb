# Ejercicio 5
class Morseable
  attr_reader :number, :h

  def initialize(number)
  @number = number
  end

  def generate_hash
      @h = {0 => '-----' , 1 => '.----', 2 => '..---', 3 => '...--', 4 => '....-', 5  =>  '.....' ,6  =>  '-....', 7  => '--...', 8  => '---..',9  => '----.'}
      @h[@number]
  end

  def to_morse
    puts generate_hash
  end

end


m = Morseable.new(0)
puts m.to_morse
