
/*
 Para pintar en consola con un color específico usamos los Ansi Colors Codes
 Para más códigos de color puedes buscar info aquí:
 https://www.codegrepper.com/code-examples/java/ansi+colors
*/

class Printable {
   static printMessageOnConsole(String message, String? keyword) {
      print('\x1B[33mDELIVERY- ${ keyword ?? ""} - ${ message }\x1B[0m');
   }
   static printErrorOnConsole(String message, String? keyword) {
      print('\x1B[31mDELIVERY- ${ keyword ?? ""} - ${ message }\x1B[0m');
   }
}