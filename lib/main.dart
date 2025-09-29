import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:carvel_maquinaria_assesment/components/charactercard.dart';
import 'package:carvel_maquinaria_assesment/components/header.dart';
 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

  final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final GraphQLClient client;

  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(client),
      child: CacheProvider(
        child: MaterialApp(
          title: 'Rick & Morty App',
          home: HomeScreen(client: client),
        ),
      ),
    );
  }
}

//Query para obtener la información de los personajes de la serie
const String getCharactersQuery = """
  query {
    characters(page: 1) {
      results {
        id
        name
        image
        status
        species
        gender
        origin {
          name
        }
        location {
          name
        }
      }
    }
  }
""";

class HomeScreen extends StatelessWidget {
  final GraphQLClient client;

  const HomeScreen({super.key, required this.client});

  Future<QueryResult> fetchCharacters() async {
    final options = QueryOptions(document: gql(getCharactersQuery));
    return await client.query(options).timeout(
      const Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Header(),backgroundColor: Colors.black,),
      backgroundColor: const Color.fromARGB(255, 111, 186, 211),
      body: FutureBuilder<QueryResult>(
        future: fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final result = snapshot.data!;
          final characters = result.data?['characters']['results'];

          if (characters == null || characters.isEmpty) {
            return const Center(child: Text('No se encontraron personajes.'));
          }

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return CharacterCard(character:character);
            },
          );
        },
      ),
    );
  }
}
