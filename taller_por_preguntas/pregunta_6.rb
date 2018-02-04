# Ejercicio 6
class Student
  attr_accessor :name, :nota
  #se ingresa nota, para poder agregar notas o visualizar notas de cada alumno.
    def initialize(name)
  @name = name
  @nota
  #declaracion v instancia
  end

  def nota_aum
    @nota += 1
  end
  #metodo para agregar notas incrementales


end


nombres = %w(Alicia Javier Camila Francisco Pablo Josefina)
notas = [1,2,3,4,5,6,7,8,9,10]
i = 0
alumnos = []

while i<nombres.size do
  i +=1
  alumnos.push(Student.new(nombres[i]))
end

puts alumnos
#array de objetos, donde cada objeto es de clase Student

notas_alumnos = alumnos.map{ |obj| obj.nota=notas.sample  }
puts notas_alumnos
#array de notas de alumnos, a cada objeto se le aplico el metodo getter de nota, el cual recogio un valor al azar del array notas.
puts '/////////aumentando notas de todos los alumnos////////////'
notas_alumnos2 = alumnos.map{|obj| obj.nota= obj.nota_aum}
puts notas_alumnos2
#array que muestra las notas incrementadas de todos los alumnos.
