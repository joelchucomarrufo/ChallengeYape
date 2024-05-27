
## 🚀 CHALLENGE YAPE - RECETAS
Se necesita tener una app que muestre una lista de recetas, en la cual se pueda hacer una busqueda sobre la lista, al presionar en la receta esta debe de llevar al detalle y dentro de esta poder ir al mapa donde se vea la ubicación de la receta.

### Requisitos Funcionales:
- Lista y buscador de las recetas (Home Screen)
- Detalles de la receta seleccionada (Detail Screen).
- Mapa geolocalización de origen de la receta (Map Screen).

### Librerias usadas:
- Alamofire: Para el consumo de servicios.
- OpenCombine: Para controlar las tareas asincronas y reactivas de la app.
- MapKit: Para mostrar la ubicación en el mapa.
- SwiftUI:

### Tecnología y arquitectura usada:
- MVVM: Usado para el package de Presentation, es la que mas se adapta a mi opinión, ya que usaremos el viewModel que servira de conexion la el package Core. Este package presentation tendrá la siguiente estructura:
    
    - Presentation
        - Feature: Este alamcenara todas las pantallas de la app, incluyendo los componentes reutilizables.
        - Navigation: Contiene la clase para la navegación interna de la app.


- VIPER: Usado para el package de Core, que esta separa para ser una libreria externa, en mi opinión, el VIPER es el que mejor funciona para las librerias que seran consumidas por apps clientes.

    - Core
        - UseCase: Contiene los casos de uso que servira de conexion con el presentation.
        - Domain: Contiene los modelos que usara la capa presentation (este package podria ser una capa que este fuera de la libreria core, todo depende de que los modelos sean propios o no por cada cliente).
        - Feature: Contiene el Interactor, Probides, Coordinator y Presenter por pantalla a usar.
        - Data: Contiene los request y response que se usaran en el consumo de la api.
        - Manager: Contiene los Manager que es la implementación de la llamada al servicio.
 
