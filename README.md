# carvel_maquinaria_assesment

Crea una aplicación  simple en Flutter que consuma una API y muestre los datos en una interfaz de usuario. La Aplicación debe de cumplir con lo siguiente

1. Pantalla de Inicio
2. Pantalla de detalle 
3. Usdo de una API publica
4. Manejo de estados
5. Navegación
6. Diseño
7. Código limpio 

## Inicio de aplicación 
Para hacer inicio de la aplicación, se debe de hacer uso del comando flutter run. Para hacer esto se debe de colocar en la carpeta donde está alojado el proyecto, abrir una terminal y ejecutar flutter run. En caso de no poder hacerlo, se puede hacer en Visual Studio Code y en la terminal del editor de texto se puede ejecutar el comando.

## Proceso de desarrollo
Para la realización de este proyecto, se utilizó la API pública https://rickandmortyapi.com/ de donde se obtuvo la base de datos de los personajes de la serie para adultos 'Rick and Morty'. Una vez decidida la APi a utilizar se siguio lo siguiente

1. Se creó la página inicial del sistema. Se decidió que para el desarrollo de haría uso de componentes para agilizar el proceso de desarrollo
2. Dentro de la página principal se hace un query para la API. Donde posteriormente se almacenan los atributos de la API
3. Se creó un componente de charactercard. Donde se muestran el nombre y la imagen de los personajes obtenidos del query. Una vez que se de click o se presione sobre las cartas se pasa a la página de detalles
4. Finalmente, dentro de la página de detalles se creó un botón que nos hace regresar a la página principal. Además dentro de esta página se encuentra el componenente de CharacterDetailedCard, en el cual se almacena y se muestra la información del personaje seleccionado
