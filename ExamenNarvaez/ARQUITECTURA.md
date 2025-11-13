# Documentación Técnica - Arquitectura y Patrones

## 1. Arquitectura MVC (Model-View-Controller)

### Model - ClienteModel
**Ubicación**: `lib/modelo/cliente_model.dart`

**Responsabilidades**:
- Almacenar datos del cliente
- Realizar todos los cálculos de negocio
- Validar la lógica de negocio

**Atributos**:
```dart
// Datos de entrada
final double saldoAnterior;
final double compras;
final double pagoAnterior;

// Datos calculados
double saldoActual;
double pagoMinimo;
double pagoTotal;
double interes;
double multa;
bool esMoroso;
```

**Métodos principales**:
- `calcularSaldoActual()`: Calcula el saldo base
- `calcularPagos()`: Calcula pagos mínimo y total
- `calcularInteres()`: Determina si es moroso y aplica penalizaciones

### Controller - ClienteController
**Ubicación**: `lib/controlador/cliente_controller.dart`

**Responsabilidades**:
- Gestionar la lista de clientes
- Acumular totales (intereses)
- Validar datos de entrada
- Notificar cambios a la UI

**Características**:
- Extiende `ChangeNotifier` para reactividad
- Mantiene estado de la aplicación
- Proporciona métodos de validación

**Métodos principales**:
```dart
void agregarCliente({...})
void limpiarClientes()
String? validarDato(String? valor, String campo)
```

### View - Vistas y Componentes
**Ubicación**: `lib/vistas/`

**Responsabilidades**:
- Renderizar la interfaz de usuario
- Capturar eventos del usuario
- Mostrar datos del modelo

---

## 2. Atomic Design

### Nivel 1: Átomos (Componentes Básicos)

#### CampoTextoNumerico
**Propósito**: Campo de texto especializado para entrada de valores monetarios

**Características**:
- Validación de formato numérico
- Prefijo de moneda ($)
- Filtro de entrada (solo números y punto decimal)
- Validación personalizable

```dart
CampoTextoNumerico(
  label: 'Saldo Anterior',
  hint: 'Ingrese el saldo anterior',
  controller: saldoAnteriorController,
  validator: validator,
  icono: Icons.account_balance_wallet,
)
```

#### BotonPrimario
**Propósito**: Botón estilizado consistente

**Características**:
- Icono configurable
- Texto personalizable
- Modo expandido opcional
- Estilo heredado del tema

#### TextoInfo
**Propósito**: Mostrar pares etiqueta-valor

**Características**:
- Formato consistente
- Modo destacado opcional
- Color personalizable

### Nivel 2: Moléculas (Componentes Compuestos)

#### FormularioCliente
**Propósito**: Agrupa campos de entrada relacionados

**Composición**:
- 3 × `CampoTextoNumerico`
- 1 × `BotonPrimario`
- Espaciado consistente
- Validación de formulario

**Ventajas**:
- Reutilizable
- Lógica de validación centralizada
- Mantenimiento simplificado

#### TarjetaCliente
**Propósito**: Mostrar información completa de un cliente

**Composición**:
- Múltiples `TextoInfo`
- Card con bordes condicionales
- Chip de estado
- Secciones organizadas

**Lógica Condicional**:
- Borde verde/rojo según estado
- Sección de penalizaciones solo para morosos
- Formato de moneda consistente

### Nivel 3: Organismos y Páginas

#### BancoClientePage
**Propósito**: Página completa para entrada de datos

**Composición**:
- AppBar
- Card de encabezado
- Card de instrucciones
- `FormularioCliente`
- Botón de navegación
- ScrollView para adaptabilidad

**Estado Local**:
- Controllers de texto
- FormKey para validación
- Instancia de ClienteController

#### BancoResultadosPage
**Propósito**: Página de visualización de resultados

**Composición**:
- AppBar
- Resumen estadístico
- ListView de `TarjetaCliente`
- FloatingActionButton

**Características**:
- Recibe datos por parámetros de ruta
- Cálculos estadísticos en tiempo real
- Visualización adaptativa

---

## 3. Sistema de Temas

### Reutilización del Tema Base

**Ubicación**: `lib/temas/`

**Componentes reutilizados**:
```dart
GeneralTheme.light // Tema general
ColorApp.primary   // Colores
TipografiaApp.text // Tipografía
```

**Aplicación**:
```dart
MaterialApp(
  theme: GeneralTheme.light,
  // ...
)
```

**Beneficios**:
- Consistencia visual
- Fácil mantenimiento
- Cambios globales centralizados

---

## 4. Navegación con Parámetros

### Definición de Rutas

```dart
routes: {
  '/': (context) => const MenuPage(),
  '/banco-clientes': (context) => const BancoClientePage(),
  '/banco-resultados': (context) => const BancoResultadosPage(),
}
```

### Paso de Parámetros

**Envío**:
```dart
Navigator.pushNamed(
  context,
  '/banco-resultados',
  arguments: _controller, // Objeto completo
);
```

**Recepción**:
```dart
final controller = ModalRoute.of(context)!
    .settings.arguments as ClienteController;
```

**Ventajas**:
- Desacoplamiento entre páginas
- Tipado fuerte
- Estado compartido eficientemente

---

## 5. Gestión de Estado

### Patrón ChangeNotifier

**Implementación**:
```dart
class ClienteController extends ChangeNotifier {
  void agregarCliente(...) {
    // Modificar estado
    _clientes.add(cliente);
    _calcularTotalIntereses();
    
    // Notificar cambios
    notifyListeners();
  }
}
```

**Uso en UI**:
```dart
ListenableBuilder(
  listenable: _controller,
  builder: (context, child) {
    return Text('${_controller.cantidadClientes}');
  },
)
```

**Beneficios**:
- Actualizaciones automáticas de UI
- Patrón simple y efectivo
- No requiere dependencias externas

---

## 6. Validaciones

### Validación en Tiempo Real

**Campo de Texto**:
```dart
validator: (value) => _controller.validarDato(value, 'monto')
```

**Método de Validación**:
```dart
String? validarDato(String? valor, String campo) {
  if (valor == null || valor.isEmpty) {
    return 'El campo $campo es requerido';
  }
  
  final numero = double.tryParse(valor);
  if (numero == null) {
    return 'Ingrese un número válido';
  }
  
  if (numero < 0) {
    return 'El valor debe ser positivo';
  }
  
  return null; // Validación exitosa
}
```

### Validación de Formulario

```dart
if (_formKey.currentState!.validate()) {
  // Procesar datos
}
```

---

## 7. Feedback al Usuario

### SnackBars

**Confirmación**:
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Cliente agregado correctamente'),
    backgroundColor: Colors.green,
  ),
);
```

**Advertencia**:
```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Debe agregar al menos un cliente'),
    backgroundColor: Colors.orange,
  ),
);
```

### Indicadores Visuales

- Colores semánticos (verde = bien, rojo = problema)
- Iconos descriptivos
- Chips de estado
- Bordes destacados

---

## 8. Buenas Prácticas Implementadas

### ✓ Separación de Responsabilidades
- Modelo: Lógica de negocio
- Vista: Presentación
- Controlador: Coordinación

### ✓ Reutilización de Código
- Componentes atómicos reutilizables
- Funciones helper (`_formatoMoneda`)
- Temas compartidos

### ✓ Inmutabilidad donde es apropiado
```dart
final double saldoAnterior; // Datos de entrada inmutables
double saldoActual;         // Datos calculados mutables
```

### ✓ Nombres Descriptivos
- Variables: `saldoAnterior`, `pagoMinimo`
- Métodos: `calcularSaldoActual()`, `agregarCliente()`
- Clases: `ClienteModel`, `FormularioCliente`

### ✓ Validación de Datos
- Entrada del usuario
- Estado de la aplicación
- Navegación

### ✓ Documentación
- Comentarios descriptivos
- README completo
- Ejemplos de uso

---

## 9. Estructura de Archivos

```
lib/
├── controlador/
│   └── cliente_controller.dart       # Estado global
├── modelo/
│   └── cliente_model.dart            # Lógica de negocio
├── vistas/
│   ├── atomos/                       # Componentes básicos
│   │   ├── boton_primario.dart
│   │   ├── campo_texto_numerico.dart
│   │   ├── texto_info.dart
│   │   └── index.dart                # Barrel file
│   ├── moleculas/                    # Componentes compuestos
│   │   ├── formulario_cliente.dart
│   │   ├── tarjeta_cliente.dart
│   │   └── index.dart                # Barrel file
│   └── paginas/                      # Páginas completas
│       ├── banco_cliente_page.dart
│       ├── banco_resultados_page.dart
│       └── menu_page.dart
├── temas/                            # Sistema de temas
│   ├── general_theme.dart
│   ├── color_scheme.dart
│   └── ...
└── main.dart                         # Punto de entrada
```

**Ventajas de esta estructura**:
- Fácil navegación
- Clara separación de capas
- Escalabilidad
- Mantenibilidad

---

## 10. Extensibilidad Futura

### Posibles Mejoras:

1. **Persistencia de Datos**
   - SQLite para almacenar clientes
   - Shared Preferences para configuración

2. **Exportación de Reportes**
   - PDF
   - Excel
   - JSON

3. **Filtros y Búsqueda**
   - Por estado (moroso/al día)
   - Por rango de saldo
   - Por fecha

4. **Gráficas**
   - Distribución de clientes
   - Tendencias de morosidad
   - Ganancias del banco

5. **Autenticación**
   - Login de empleados
   - Roles y permisos

6. **Internacionalización**
   - Múltiples idiomas
   - Formatos de moneda regionales
