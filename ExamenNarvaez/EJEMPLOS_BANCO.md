# Ejemplos de Uso - Banco "Bandido de Peluche"

## Ejemplo 1: Cliente Al Día

### Datos de Entrada:
- **Saldo Anterior**: $1,000.00
- **Compras**: $500.00
- **Pago Anterior**: $300.00

### Cálculos:
1. **Saldo Actual** = $1,000 + $500 - $300 = **$1,200.00**
2. **Pago Mínimo (15%)** = $1,200 × 0.15 = **$180.00**
3. **Pago Total sin Intereses (85%)** = $1,200 × 0.85 = **$1,020.00**
4. **Estado**: AL DÍA ✓
5. **Interés**: $0.00 (no aplica)
6. **Multa**: $0.00 (no aplica)

### Resultado:
- El cliente pagó $300, que es mayor al pago mínimo anterior ($150)
- No se generan intereses ni multas
- El banco no obtiene ganancias de este cliente

---

## Ejemplo 2: Cliente Moroso

### Datos de Entrada:
- **Saldo Anterior**: $2,000.00
- **Compras**: $800.00
- **Pago Anterior**: $100.00 (Insuficiente)

### Cálculos Iniciales:
1. **Saldo Actual Base** = $2,000 + $800 - $100 = $2,700.00
2. **Pago Mínimo Requerido Anterior** = $2,000 × 0.15 = $300.00
3. **Pago Realizado** = $100.00 < $300.00 → **MOROSO** ⚠️

### Penalizaciones:
4. **Interés (12%)** = $2,700 × 0.12 = **$324.00**
5. **Multa** = **$200.00**
6. **Saldo Actual Ajustado** = $2,700 + $324 + $200 = **$3,224.00**

### Cálculos Finales:
7. **Pago Mínimo (15%)** = $3,224 × 0.15 = **$483.60**
8. **Pago Total sin Intereses (85%)** = $3,224 × 0.85 = **$2,740.40**

### Resultado:
- **Estado**: MOROSO ❌
- **Ganancia del Banco**: $324 + $200 = **$524.00**

---

## Ejemplo 3: Múltiples Clientes

### Cliente 1 (Al Día):
- Saldo Anterior: $1,500
- Compras: $300
- Pago Anterior: $400
- **Ganancia Banco**: $0.00

### Cliente 2 (Moroso):
- Saldo Anterior: $3,000
- Compras: $1,000
- Pago Anterior: $200
- **Ganancia Banco**: $680.00

### Cliente 3 (Al Día):
- Saldo Anterior: $500
- Compras: $200
- Pago Anterior: $100
- **Ganancia Banco**: $0.00

### Cliente 4 (Moroso):
- Saldo Anterior: $2,500
- Compras: $500
- Pago Anterior: $150
- **Ganancia Banco**: $560.00

### Resumen General:
- **Total Clientes**: 4
- **Clientes Morosos**: 2
- **Clientes Al Día**: 2
- **Total Ganancias del Banco**: $1,240.00

---

## Validaciones Implementadas

### ✓ Valores Positivos
```
❌ Entrada: -100
✓ Mensaje: "El valor debe ser positivo"
```

### ✓ Valores Numéricos
```
❌ Entrada: "abc"
✓ Mensaje: "Ingrese un número válido"
```

### ✓ Campos Requeridos
```
❌ Entrada: (vacío)
✓ Mensaje: "El campo monto es requerido"
```

---

## Flujo de Navegación

```
MenuPage
    ↓ (selecciona "Banco Bandido de Peluche")
BancoClientePage
    ↓ (ingresa datos y presiona "Calcular Cliente")
    → Se agrega cliente al controlador
    → Se limpia el formulario
    → Muestra mensaje de confirmación
    ↓ (repite N veces)
    ↓ (presiona "Ver Resultados")
BancoResultadosPage (recibe ClienteController como parámetro)
    → Muestra resumen general
    → Lista todos los clientes con sus cálculos
    → Muestra total de ganancias del banco
    ↓ (presiona "Agregar más clientes")
    ← Regresa a BancoClientePage
```

---

## Características de la Interfaz

### 🎨 Colores por Estado
- **Cliente Al Día**: Borde verde ✓
- **Cliente Moroso**: Borde rojo ⚠️
- **Chip de Estado**: Verde (AL DÍA) / Rojo (MOROSO)

### 📊 Indicadores Visuales
- **Total Clientes**: Icono de personas (azul)
- **Morosos**: Icono de advertencia (rojo)
- **Al Día**: Icono de check (verde)
- **Ganancias**: Fondo verde con icono de dinero

### 📝 Organización de Información
Cada tarjeta de cliente muestra:
1. **Datos Iniciales**: Saldo anterior, compras, pago anterior
2. **Cálculos**: Saldo actual, pago mínimo, pago total
3. **Penalizaciones** (solo morosos): Interés, multa, ganancia del banco

---

## Notas Técnicas

### Estado del Controlador
El `ClienteController` mantiene:
- Lista de todos los clientes agregados
- Total acumulado de intereses
- Cantidad de clientes registrados

### Paso de Parámetros entre Rutas
```dart
// En BancoClientePage
Navigator.pushNamed(
  context,
  '/banco-resultados',
  arguments: _controller,
);

// En BancoResultadosPage
final controller = ModalRoute.of(context)!
    .settings.arguments as ClienteController;
```

### Actualización de UI
El controlador usa `ChangeNotifier` y `notifyListeners()` para actualizar la interfaz automáticamente cuando se agregan clientes.
