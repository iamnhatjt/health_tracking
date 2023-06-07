enum Flavor { production, development }

class Environment {
  static Flavor environment = Flavor.production;

  static chooseEnviroment(Flavor flavor) {
    Environment.environment = flavor;
  }

  static get isDev => environment == Flavor.development;
}
