class Numeros {
  // Método para generar números comprendidos entre dos valores
  String mostrarNumerosEntre(int num1, int num2) {
    // Determinar el rango (en caso de que los números estén en desorden)
    int menor = num1 < num2 ? num1 : num2;
    int mayor = num1 > num2 ? num1 : num2;

    // Generar la lista de números
    List<int> numeros = [for (int i = menor + 1; i < mayor; i++) i];

    // Retornar el resultado como texto

    return numeros.isEmpty
        ? 'No hay números entre $num1 y $num2.'
        : 'Números entre $num1 y $num2:\n [${numeros.join(", ")}]';
  }
}
