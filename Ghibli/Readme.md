
# Proyecto App Ghibli SDP 26

## 🗓️ Día 1 | 24.11.2025
#### **Objetivos:**
* Familiarizarse con la documentación de la API
* Entender los datos proporcionados por la API
* Crear una colección en Postman con los endpoints
* Probar cada endpoint

### 1. Visita la Documentación
- Ir a: https://ghibliapi.vercel.app/
- Haz una lectura de la página principal para entender cómo funciona la API

### 2. Familiarizate con la Documentación
- Cuántos endpoints tiene la API?
- Qué recursos se pueden obtener? (películas, personajes, etc.)
- Es posible buscar o filtrar información específica?
- Se necesita autenticación (API key)? (NO)
- En qué formato devuelve los datos?

### 3. Configuración en Postman
- Crea una nueva colección en Postman con los endpoints de la API.
- Prueba cada endpoint

### 4. Preparación para Swift
- Identifica las propiedades que vas a necesitar en Swift para el endpoint **Films**
- En el caso de este proyecto, vamos a especificar el uso de las siguientes propiedades:
  - id
  - title
  - original_title
  - image
  - movie_banner
  - description
  - director
  - producer
  - release_date
  - running_time
  - rt_score
  - people

- Antes de empezar a crear el modelo, recuerda que **vamos a seguir el patrón DTO vs Model**.
Un poco de teoria para refrescar conceptos.

##### **DTO (Data Transfer Object):**

  - Es la copia exacta del JSON que viene de la API
  - Usa los nombres exactos de las propiedades del JSON (aunque sean feos o en snake_case)
  - Su única responsabilidad: decodificar/codificar el JSON

##### Model
  - Es lo que usa tu app internamente
  - Tiene nombres de propiedades limpios y claros (en camelCase)
  - Puede tener propiedades computadas o lógica adicional
  - Puede omitir propiedades que no necesitas
  - Puede transformar tipos de datos (ej: String → Date)


### Cosas a tener en cuenta
(En el DTO)
- Usa `CodingKeys` para mapear de **snake_case** a -> **camelCase**
- Conforma a `Codable` para decodificar el JSON
- Crea una `extension` con una variable calculada `toFilm` que tiene que devolver, en este caso, `Film`.

(En el Model)
- Limpio para usar en la app
- Conforma a `Identifiable` para poder montar listas con SwiftUI sin id .self
