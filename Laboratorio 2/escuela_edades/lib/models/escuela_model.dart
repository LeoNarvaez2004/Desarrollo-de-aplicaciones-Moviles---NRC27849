class EscuelaModel {
  final int numeroSalones;
  final List<List<int>> edadesPorSalon; // Lista de listas de edades

  EscuelaModel(this.numeroSalones, this.edadesPorSalon);

  // Calcula el promedio de edades de un salón específico
  double calcularPromedioSalon(int indiceSalon) {
    if (indiceSalon < 0 || indiceSalon >= edadesPorSalon.length) {
      return 0;
    }

    List<int> edades = edadesPorSalon[indiceSalon];
    if (edades.isEmpty) {
      return 0;
    }

    int suma = 0;
    for (int edad in edades) {
      suma += edad;
    }

    return suma / edades.length;
  }

  // Calcula el promedio de edades de todos los salones
  double calcularPromedioEscuela() {
    int sumaTotal = 0;
    int totalEstudiantes = 0;

    for (List<int> salon in edadesPorSalon) {
      for (int edad in salon) {
        sumaTotal += edad;
        totalEstudiantes++;
      }
    }

    if (totalEstudiantes == 0) {
      return 0;
    }

    return sumaTotal / totalEstudiantes;
  }

  // Obtiene el número de estudiantes de un salón
  int obtenerNumeroEstudiantesSalon(int indiceSalon) {
    if (indiceSalon < 0 || indiceSalon >= edadesPorSalon.length) {
      return 0;
    }
    return edadesPorSalon[indiceSalon].length;
  }

  // Obtiene el total de estudiantes de la escuela
  int obtenerTotalEstudiantes() {
    int total = 0;
    for (List<int> salon in edadesPorSalon) {
      total += salon.length;
    }
    return total;
  }

  // Genera una lista con los promedios de cada salón
  List<Map<String, dynamic>> obtenerPromediosPorSalon() {
    List<Map<String, dynamic>> promedios = [];

    for (int i = 0; i < numeroSalones; i++) {
      promedios.add({
        'salon': i + 1,
        'promedio': calcularPromedioSalon(i),
        'estudiantes': obtenerNumeroEstudiantesSalon(i),
      });
    }

    return promedios;
  }
}
