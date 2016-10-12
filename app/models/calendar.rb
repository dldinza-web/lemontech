class Calendar < ApplicationRecord
  def self.load(owner = 'Daniel')
    {
      lunes: [
         {nombre: owner, hora_inicio: '08:00', hora_termino: '09:00'},
         {nombre: owner, hora_inicio: '09:30', hora_termino: '11:00'},
         {nombre: owner, hora_inicio: '15:00', hora_termino: '16:00'},
         {nombre: owner, hora_inicio: '17:00', hora_termino: '19:30'}
      ],
      martes: [
         {nombre: owner, hora_inicio: '08:00', hora_termino: '09:00'},
         {nombre: owner, hora_inicio: '11:30', hora_termino: '12:00'},
         {nombre: owner, hora_inicio: '15:00', hora_termino: '16:00'},
         {nombre: owner, hora_inicio: '17:00', hora_termino: '19:30'}
      ],
      miercoles: [
          {nombre: owner, hora_inicio: '08:00', hora_termino: '09:00'},
          {nombre: owner, hora_inicio: '10:30', hora_termino: '12:00'},
          {nombre: owner, hora_inicio: '15:00', hora_termino: '16:00'},
          {nombre: owner, hora_inicio: '17:00', hora_termino: '19:30'}
      ],
      jueves: [
          {nombre: owner, hora_inicio: '08:00', hora_termino: '09:00'},
          {nombre: owner, hora_inicio: '09:30', hora_termino: '12:00'},
          {nombre: owner, hora_inicio: '15:00', hora_termino: '16:00'},
          {nombre: owner, hora_inicio: '17:00', hora_termino: '19:30'}
      ],
      viernes: [
          {nombre: owner, hora_inicio: '08:00', hora_termino: '09:00'},
          {nombre: owner, hora_inicio: '09:30', hora_termino: '12:00'},
          {nombre: owner, hora_inicio: '15:00', hora_termino: '16:00'},
          {nombre: owner, hora_inicio: '17:00', hora_termino: '19:30'}
      ]
    }
  end
end
