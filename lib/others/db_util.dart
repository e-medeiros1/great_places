//Classe responsável por acessar o banco de dados
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  //Verificar se o banco está criado antes de inserir os dados
  static Future<sql.Database> database() async {
    //Pega o caminho onde serão armazenados os arquivos do DB
    //Será dentro do dbPath que o banco será inicializado caso não esteja
    final dbPath = await sql.getDatabasesPath();
    //Passa-se o caminho completo do DB
    return sql.openDatabase(
        //Cria um arquivo dentro do diretório dbPath chamando places.db
        path.join(dbPath, 'places.db'),
        //Oncreate será rodado sempre que o db for iniciado pela primeira vez
        //Os parâmetros são: Uma ref para o db e a versão que será utilizada,
        //pois pode haver mais de uma no mesmo banco
        onCreate: (db, version) {
      //Executando DDL(Data definition language)
      return db.execute(
          //Comandos SQL que serão executado apenas na hora da criação do DB
          'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);
  }

  //Insere informações no BD
  static Future<void> insert( String table, Map<String, Object> data) async {
    //Recebe os atributos da função acima
    final db = await DbUtil.database();
    //Passa os parâmetros + resolução de conflitos
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
}
