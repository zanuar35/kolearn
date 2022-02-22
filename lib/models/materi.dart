class Materi {
  Materi({
    required this.status,
    required this.data,
  });

  late final String status;
  late final List<Data> data;

  Materi.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    data = List.from(json['data'].map((e) => Data.fromJson(e)).toList());
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) =>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.courseId,
    required this.hangeul,
    required this.bunyiHuruf,
    required this.suaraHuruf,
    required this.gambar,
    required this.descGambar,
    required this.contohKata,
    required this.descKata,
    required this.suaraKata,
  });

  late final int id;
  late final int courseId;
  late final String hangeul;
  late final String bunyiHuruf;
  late final String suaraHuruf;
  late final String gambar;
  late final String descGambar;
  late final String contohKata;
  late final String descKata;
  late final String suaraKata;

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    hangeul = json['hangeul'];
    bunyiHuruf = json['bunyi_huruf'];
    suaraHuruf = json['suara_huruf'];
    gambar = json['gambar'];
    descGambar = json['desc_gambar'];
    contohKata = json['contoh_kata'];
    descKata = json['desc_kata'];
    suaraKata = json['suara_kata'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['id'] = id;
    _data['course_id'] = courseId;
    _data['hangeul'] = hangeul;
    _data['bunyi_huruf'] = bunyiHuruf;
    _data['suara_huruf'] = suaraHuruf;
    _data['gambar'] = gambar;
    _data['desc_gambar'] = descGambar;
    _data['contoh_kata'] = contohKata;
    _data['desc_kata'] = descKata;
    _data['suara_kata'] = suaraKata;
    return _data;
  }

}
