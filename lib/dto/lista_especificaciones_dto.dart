class ListaEspecificacionesdto {
  int id;
  String serie;
  String marca;
  String estado;
  int eq;
  int dimensionAlto;
  int dimensionAncho;
  String ram;
  String procesador;
  String memoria;
  String color;

  ListaEspecificacionesdto(
      {required this.id,
      required this.serie,
      required this.marca,
      required this.estado,
      required this.eq,
      required this.dimensionAlto,
      required this.dimensionAncho,
      required this.ram,
      required this.procesador,
      required this.memoria,
      required this.color});

  factory ListaEspecificacionesdto.fromJson(Map<String, dynamic> json) {
    return ListaEspecificacionesdto(
        id: json['id'],
        serie: json['serie'],
        marca: json['marca'],
        estado: json['estado'],
        eq: json['eq'],
        dimensionAlto: json['dimension_alto'],
        dimensionAncho: json['dimension_ancho'],
        ram: json['ram'],
        procesador: json['procesador'],
        memoria: json['memoria'],
        color: json['color']);
  }
}
