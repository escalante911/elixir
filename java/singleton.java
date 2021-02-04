public class Singleton{

      // Aqui guardamos la unica instancia que va a existir 
      private static Singleton instancia;

      // Datos Propios de la clase
      private string nombre;
      private int edad;

      // Constructor privado
      private Singleton(){
            nombre = "";
            edad = 0;
      }

      public static Singleton ObtenerInstancia(){

            // Verificamos si no existe la instancia 
            if(instancia == null){

            }
      }

      

}