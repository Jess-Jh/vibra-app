# 🎵 Vibra Music App

## 📋 Tabla de Contenidos
- ✨ Características
- 🛠️ Tecnologías Utilizadas
- 📁 Estructura del Proyecto
- 🚀 Instalación y Ejecución
- 📸 Pantallas
  - Lista de canciones favoritas
  - Buscador de canciones
  - Detalle de canción

---

## ✨ Características
- **Listado de canciones favoritas**: Obtiene y muestra las canciones favoritas del usuario desde la API de Spotify.
- **Detalles de canciones**: Visualiza información detallada como título, artista, álbum e imagen.
- **Manejo de token**: Detecta expiración del token y redirige automáticamente al login para renovar sesión.
- **Búsqueda**: Permite buscar canciones, artistas y álbumes.
- **Guardar y eliminar favoritos**: Funcionalidad para marcar y desmarcar canciones como favoritas.
- **Gestión de estado con Riverpod**: Proveedores para manejar datos y estados de forma reactiva.
- **Arquitectura limpia**: Separación clara en capas de presentación, dominio y datos.

---

## 🛠️ Tecnologías Utilizadas
- **Flutter**: Framework para apps móviles multiplataforma.
- **Dart**: Lenguaje principal de desarrollo.
- **Riverpod**: Gestión de estado reactiva y escalable.
- **http**: Cliente para llamadas REST a la API de Spotify.
- **Secure Storage**: Almacenamiento seguro para tokens.
- **Freezed** (opcional): Para manejo eficiente de modelos de datos.

---

## 📁 Estructura del Proyecto
La app sigue una arquitectura limpia y buenas prácticas, usando patrones como Dependency Injection y manejo claro de estados.

vibra_music_app/
├── lib/
│ ├── core/ # Helpers, utilidades, almacenamiento seguro, constantes.
│ ├── features/
│ │ ├── auth/ # Login, manejo de token, estado de autenticación
│ │ ├── home/ # Listado y manejo de canciones favoritas
│ │ ├── search/ # Modelos, servicios API, búsqueda
│ │ └── detail/ # Detalle de búsqueda o selección del usuario
│ ├── shared/ # elementos compartidos
│ └── main.dart # Entrada de la app y configuración inicial
└── test/ # Pruebas unitarias y de integración

## 🚀 Instalación y Ejecución

### Clonar el repositorio

```bash
git clone https://github.com/tu_usuario/vibra_music_app.git
cd vibra_music_app

## Instalar dependencias
### Asegúrate de tener Flutter instalado. Luego ejecuta:

flutter pub get

## Generar código (si usas Freezed o build_runner)

flutter pub run build_runner build --delete-conflicting-outputs

## Ejecutar la aplicación
## Para correr en un dispositivo/emulador conectado:

flutter run


## 📸 Pantallas

- **Lista de canciones favoritas:**  
  Muestra las canciones favoritas del usuario y recomendaciones.

![simulator_screenshot_24849E99-7377-47C5-9C41-4A62D021ED3D](https://github.com/user-attachments/assets/c29de9ff-9e2e-437b-944b-4a2db9fcb281)

- **Buscador de canción:**  
![simulator_screenshot_DC042424-3F03-4408-BF3F-807951C7EB3B](https://github.com/user-attachments/assets/575f1526-dca3-46e7-aa31-88cd5d69b7cb)

- **Detalle de canción:**  
  Información ampliada de la canción seleccionada.
![simulator_screenshot_84AFF2BB-D474-4A74-ABD7-94B1B40CC38C](https://github.com/user-attachments/assets/33f0b9a6-a11e-4d5d-b87e-a622ab4f9036)



