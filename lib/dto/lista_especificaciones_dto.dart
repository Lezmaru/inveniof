class ListaEspecificacionesdto {
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

  ListaEspecificacionesdto({
    required this.serie,
    required this.marca,
    required this.estado,
    required this.eq,
    required this.dimensionAlto,
    required this.dimensionAncho,
    required this.ram,
    required this.procesador,
    required this.memoria,
    required this.color,
  });

  ListaEspecificacionesdto.fromJson(Map<String, dynamic> json)
      : serie = json['serie'] ?? "No posee",
        marca = json['marca'] ?? "No posee",
        estado = json['estado'] ?? "No posee",
        eq = json['eq'] ?? 0,
        dimensionAlto = json['dimension_alto'] ?? 0,
        dimensionAncho = json['dimension_ancho'] ?? 0,
        ram = json['ram'] ?? "No posee",
        procesador = json['procesador'] ?? "No posee",
        memoria = json['memoria'] ?? "No posee",
        color = json['color'] ?? "No posee";

  Map<String, dynamic> toJson() => {
        'serie': serie,
        'marca': marca,
        'estado': estado,
        'eq': eq,
        'dimension_alto': dimensionAlto,
        'dimension_ancho': dimensionAncho,
        'ram': ram,
        'procesador': procesador,
        'memoria': memoria,
        'color': color,
      };
}
