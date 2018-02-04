# Ejercicio 4

class Dog
  def initialize(hash)
    @perro = hash
  end

  def ladrar
    nombre = @perro.values_at(:nombre).to_s
    puts "#{nombre} esta ladrando!!"
  end
end

propiedades = {nombre: 'Beethoven', raza: 'San Bernardo', color: 'Café'}
perro1 = Dog.new(propiedades)

puts perro1.ladrar
