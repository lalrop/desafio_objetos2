# Ejercicio 7
class Punto
  attr_accessor :x, :y
  #creando getter y setter para x e y

  def initialize( position_x, position_y )
    @x = position_x
    @y = position_y
  end

end

position_x = []
12.times{position_x.push(rand(10))}
# generando valores aleatorios para las posiciones
position_y = []
12.times{position_y.push(rand(10))}

i = 0
punto = []
while i< 10 do
  i += 1
  punto = punto.push(Punto.new(position_x.sample,position_y.sample))
end
# generando un array con los 10 puntos de clase Punto

puts punto

# Ejercicio 8
class MyPet
  def initialize name
    @name = name
    @sleep = false
    @satisfied = 10 #  Esta lleno
    @fullIntestine = 0 # No necesita ir
    puts @name + '  nace  '
  end

  def walk
    puts 'Haces caminar a ' + @name + '.'
    @satisfied -= 2
    @fullIntestine  += 2
    timeLapse
  end

  def bathroom
    puts "#{@name} está en el baño..."
    @fullIntestine = 0
    timeLapse
  end

  def feed
    puts "#{@name} está comiendo!"
    @satisfied = 10
    timeLapse
  end

  def sleep
    puts "#{@name} está durmiendo zZz!"
    @sleep = true
    @satisfied -= 2
    @fullIntestine += 2
    timeLapse
  end

  def hungry?
    @satisfied <= 2
  end

  def needToGo?
    @fullIntestine == 10
  end

  def timeLapse
    if @satisfied > 0
      #  Mueve el alimento del vientre al intestino.
      @satisfied      = @satisfied      - 1
      @fullIntestine  = @fullIntestine  + 1
    else  #  Nuestro dragon esta hambriento!
      if @sleep
        @sleep = false
        puts '¡Se despierta de repente!'
      end
      puts '¡' + @name + ' esta hambriento!  En su desesperacion, ¡Murio de Hambre!'
      exit  #  Sale del programa.
    end


    if @fullIntestine  > 10
      @fullIntestine  = 0
      puts '¡Uy!  ' + @name + ' tuvo un accidente...'
    end

    if hungry?
      if @sleep
        @sleep = false
        puts '¡Se despierta de repente!'
      end
      puts 'El estomago de ' + @name + 'retumba...'
    end

    if needToGo?
      if @sleep
        @sleep = false
        puts 'Se despierta de repente!'
      end
      puts @name + ' hace la danza del baño...'
    end
  end
end

def menu
  puts '--MENU--'
  puts '1. Alimentar mascota'
  puts '2. Hacer dormir mascota'
  puts '3. Hacer caminar a la mascota'
  puts '4. Que la mascota vaya al baño'

  menu = gets.chomp.to_i
end

mascota = MyPet.new('Rocky')

continuar = true
while continuar
  case menu
  when 1
    puts '* Alimentando a la mascota *'
    mascota.feed
  when 2
    puts '* Haciendo dormir a la mascota *'
    mascota.sleep
  when 3
    puts '* Haciendo caminar a la mascota *'
    mascota.walk
  when 4
    puts '* La mascota va al baño *'
    mascota.bathroom
  else
    puts 'Opción no es válida... Intente nuevamente'
  end
end
