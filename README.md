# 🎵 Vibra Music App

## 📋 Tabla de Contenidos
- ✨ Características
- 🛠️ Tecnologías Utilizadas
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

https://github.com/user-attachments/assets/7d788e2b-b13f-4be9-b8cb-722741f0e800

- **Buscador de canción:**  
https://github.com/user-attachments/assets/07a060ec-e13c-4fbc-aafb-425b924b01de

- **Detalle de canción:**  
  Información ampliada de la canción seleccionada.
https://github.com/user-attachments/assets/f4cf91eb-35d9-4e1e-b56a-9d409f79bebd

https://github.com/user-attachments/assets/1e200890-a2cd-4434-b9ed-689181ec8aa4




