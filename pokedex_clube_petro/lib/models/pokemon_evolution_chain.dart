class PokemonEvolutionChain {
  Chain? chain;

  PokemonEvolutionChain({
    required this.chain,
  });

  PokemonEvolutionChain.fromJson(Map<String, dynamic> json) {
    chain = json['chain'] != null ? new Chain.fromJson(json['chain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chain != null) {
      data['chain'] = this.chain!.toJson();
    }
    return data;
  }
}

class Chain {
  List<EvolvesTo>? evolvesTo;
  Trigger? species;

  Chain({
    required this.evolvesTo,
    required this.species,
  });

  Chain.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo!.add(new EvolvesTo.fromJson(v));
      });
      species = json['species'] != null
          ? new Trigger.fromJson(json['species'])
          : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo!.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }

    return data;
  }
}

class EvolvesTo {
  List<EvolvesTo>? evolvesTo;
  Trigger? species;

  EvolvesTo({
    required this.evolvesTo,
    required this.species,
  });

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo!.add(new EvolvesTo.fromJson(v));
      });
    }
    species =
        json['species'] != null ? new Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo!.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    return data;
  }
}

class Trigger {
  String? name;
  String? url;

  Trigger({
    required this.name,
    required this.url,
  });

  Trigger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
