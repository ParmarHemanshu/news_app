class SourceModel {
  SourceModel({
    required this.status,
    required this.sources,
  });
  late final String status;
  late final List<Sources> sources;
  
  SourceModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    sources = List.from(json['sources']).map((e)=>Sources.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['sources'] = sources.map((e)=>e.toJson()).toList();
    return _data;
  }

  SourceModel.withError(String errorValue){
    sources = [];
    status = errorValue;
  }
}

class Sources {
  Sources({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String url;
  late final String category;
  late final String language;
  late final String country;
  
  Sources.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['url'] = url;
    _data['category'] = category;
    _data['language'] = language;
    _data['country'] = country;
    return _data;
  }
}