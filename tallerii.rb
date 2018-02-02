# # Ejercicio 1
#
# class Anything
#   attr_accessor :a
#   def foo
#   @a = 5
#   end
#
#   def bar
#   @a += 1
#   end
#
# end
# any = Anything.new
# any.foo
# any.bar
# any.a
#
# # Ejercicio 2
#
# class Car
#   attr_accessor :model, :year
#   def initialize(model, year)
#     @model = model
#     @year = year
#   end
#
# end
#
# car = Car.new('Camaro', 2016)
# puts "Mi auto favorito es un #{car.model} del año #{car.year}!"
#
# # Ejercicio 3
#
# class Store
#   attr_reader :name
#   def initialize(name)
#   @name = name
#   end
#
# end
#
# store = Store.new('Tienda 1')
# puts store.name
#
# # Ejercicio 4
#
# class Dog
#   def initialize(hash)
#     @perro = hash
#   end
#
#   def ladrar
#     nombre = @perro.values_at(:nombre).to_s
#     puts "#{nombre} esta ladrando!!"
#   end
# end
#
# propiedades = {nombre: 'Beethoven', raza: 'San Bernardo', color: 'Café'}
# perro1 = Dog.new(propiedades)
#
# puts perro1.ladrar
#
# # Ejercicio 5
# class Morseable
#   attr_reader :number, :h
#
#   def initialize(number)
#   @number = number
#   end
#
#   def generate_hash
#       @h = {0 => '-----' , 1 => '.----', 2 => '..---', 3 => '...--', 4 => '....-', 5  =>  '.....' ,6  =>  '-....', 7  => '--...', 8  => '---..',9  => '----.'}
#       @h[@number]
#   end
#
#   def to_morse
#     puts generate_hash
#   end
#
# end
#
#
# m = Morseable.new(0)
# puts m.to_morse
#
#
# # Ejercicio 6
# class Student
#   attr_accessor :name, :nota
#   #se ingresa nota, para poder agregar notas o visualizar notas de cada alumno.
#     def initialize(name)
#   @name = name
#   @nota
#   #declaracion v instancia
#   end
#
#   def nota_aum
#     @nota += 1
#   end
#   #metodo para agregar notas incrementales
#
#
# end
#
#
# nombres = %w(Alicia Javier Camila Francisco Pablo Josefina)
# notas = [1,2,3,4,5,6,7,8,9,10]
# i = 0
# alumnos = []
#
# while i<nombres.size do
#   i +=1
#   alumnos.push(Student.new(nombres[i]))
# end
#
# puts alumnos
# #array de objetos, donde cada objeto es de clase Student
#
# notas_alumnos = alumnos.map{ |obj| obj.nota=notas.sample  }
# puts notas_alumnos
# #array de notas de alumnos, a cada objeto se le aplico el metodo getter de nota, el cual recogio un valor al azar del array notas.
# puts '/////////aumentando notas de todos los alumnos////////////'
# notas_alumnos2 = alumnos.map{|obj| obj.nota= obj.nota_aum}
# puts notas_alumnos2
# #array que muestra las notas incrementadas de todos los alumnos.

# # Ejercicio 7
# class Punto
#   attr_accessor :x, :y
#   #creando getter y setter para x e y
#
#   def initialize( position_x, position_y )
#     @x = position_x
#     @y = position_y
#   end
#
# end
#
# position_x = []
# 12.times{position_x.push(rand(10))}
# # generando valores aleatorios para las posiciones
# position_y = []
# 12.times{position_y.push(rand(10))}
#
# i = 0
# punto = []
# while i< 10 do
#   i += 1
#   punto = punto.push(Punto.new(position_x.sample,position_y.sample))
# end
# # generando un array con los 10 puntos de clase Punto
#
# puts punto
#
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
