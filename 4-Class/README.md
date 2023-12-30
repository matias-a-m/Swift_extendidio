# Organizador de Clases Swift

## Descripción
Este proyecto de iOS utiliza clases en Swift para organizar y estructurar el código de una aplicación. Cada clase tiene un propósito específico para facilitar el desarrollo y mantenimiento del software.

## Estructura del Proyecto

- **Modelos:** Contiene las clases que definen la estructura de los datos.
  - `Producto.swift`: Define la clase Producto para representar información de productos.
  - `Usuario.swift`: Contiene la clase Usuario para manejar datos de usuarios.

- **Controladores:** Almacena los controladores de vista que gestionan la lógica de presentación.
  - `ListaProductosViewController.swift`: Controla la presentación de la lista de productos.
  - `PerfilUsuarioViewController.swift`: Gestiona la interfaz de usuario relacionada con el perfil del usuario.

- **Servicios:** Incluye clases responsables de la lógica de red, persistencia y otros servicios.
  - `APIManager.swift`: Proporciona métodos para interactuar con una API externa.
  - `PersistenciaDatos.swift`: Maneja la persistencia local de datos utilizando Core Data.

- **Vistas Personalizadas:** Contiene clases que definen componentes de interfaz de usuario reutilizables.
  - `BotonRedondeado.swift`: Una vista personalizada que representa un botón con esquinas redondeadas.
  - `BarraNavegacionPersonalizada.swift`: Define una barra de navegación personalizada para la aplicación.
