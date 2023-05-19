import 'package:equatable/equatable.dart';

final _res = List.from(Chat.chats).map((e) => Chat.fromMap(e)).toList();

class Chat extends Equatable {
  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      name: map['name'] as String,
      message: map['message'] as String,
      avatarUrl: map['avatarUrl'] as String,
      isMine: map['isMine'] as bool,
      id: map['id'] as String,
    );
  }
  const Chat({
    required this.id,
    required this.name,
    required this.message,
    required this.avatarUrl,
    this.isMine = false,
  });

  final String name;
  final String message;
  final String avatarUrl;
  final bool isMine;
  final String id;

  @override
  List<Object?> get props => [name, message, avatarUrl, isMine];

  static List<Map> chats = [
    {
      'id': '6467f8d2fc13ae4ace753ae8',
      'name': 'Merv',
      'time': '7/5/2022',
      'avatarUrl':
          'https://robohash.org/deseruntquifugiat.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753ae9',
      'name': 'Cher',
      'time': '3/4/2023',
      'avatarUrl':
          'https://robohash.org/maximedelectusqui.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753aea',
      'name': 'Deb',
      'time': '3/23/2023',
      'avatarUrl':
          'https://robohash.org/expeditadelectusvero.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753aeb',
      'name': 'Deina',
      'time': '10/17/2022',
      'avatarUrl':
          'https://robohash.org/rationereprehenderitin.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753aec',
      'name': 'Dinny',
      'time': '3/13/2023',
      'avatarUrl':
          'https://robohash.org/abipsamaspernatur.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753aed',
      'name': 'Rodolph',
      'time': '1/10/2023',
      'avatarUrl':
          'https://robohash.org/suscipiteumprovident.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753aee',
      'name': 'Lilli',
      'time': '2/10/2023',
      'avatarUrl':
          'https://robohash.org/voluptasnatusnostrum.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753aef',
      'name': 'Lanna',
      'time': '8/26/2022',
      'avatarUrl':
          'https://robohash.org/praesentiumatqueconsectetur.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753af0',
      'name': 'Paxon',
      'time': '8/15/2022',
      'avatarUrl':
          'https://robohash.org/doloremconsequaturea.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753af1',
      'name': 'Alica',
      'time': '3/13/2023',
      'avatarUrl': 'https://robohash.org/utsuntcumque.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753af2',
      'name': 'Emelita',
      'time': '10/19/2022',
      'avatarUrl':
          'https://robohash.org/exercitationemnihilqui.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753af3',
      'name': 'Adorne',
      'time': '7/11/2022',
      'avatarUrl':
          'https://robohash.org/harumsolutatempora.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753af4',
      'name': 'Deeann',
      'time': '2/10/2023',
      'avatarUrl':
          'https://robohash.org/quiaconsequaturaspernatur.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753af5',
      'name': 'Hussein',
      'time': '6/6/2022',
      'avatarUrl':
          'https://robohash.org/providentfugitconsequuntur.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753af6',
      'name': 'Barron',
      'time': '6/3/2022',
      'avatarUrl': 'https://robohash.org/harumautamet.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753af7',
      'name': 'Norri',
      'time': '3/18/2023',
      'avatarUrl': 'https://robohash.org/eteumpariatur.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753af8',
      'name': 'Trixi',
      'time': '3/24/2023',
      'avatarUrl':
          'https://robohash.org/voluptatibuscumqueiure.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753af9',
      'name': 'Olin',
      'time': '9/21/2022',
      'avatarUrl':
          'https://robohash.org/perspiciatisnonipsa.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753afa',
      'name': 'Gayler',
      'time': '7/17/2022',
      'avatarUrl':
          'https://robohash.org/consequaturnumquamquia.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753afb',
      'name': 'Allan',
      'time': '4/6/2023',
      'avatarUrl':
          'https://robohash.org/teneturvoluptatefacere.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753afc',
      'name': 'Mariya',
      'time': '2/25/2023',
      'avatarUrl':
          'https://robohash.org/hicdoloremnemo.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753afd',
      'name': 'Orton',
      'time': '6/18/2022',
      'avatarUrl':
          'https://robohash.org/evenietquidolores.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753afe',
      'name': 'Aylmer',
      'time': '12/9/2022',
      'avatarUrl':
          'https://robohash.org/velconsequaturlaudantium.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753aff',
      'name': 'Adele',
      'time': '4/12/2023',
      'avatarUrl':
          'https://robohash.org/voluptatesexcepturipossimus.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753b00',
      'name': 'Janette',
      'time': '10/9/2022',
      'avatarUrl':
          'https://robohash.org/autdoloresratione.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753b01',
      'name': 'Jojo',
      'time': '12/31/2022',
      'avatarUrl': 'https://robohash.org/magnihicvelit.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753b02',
      'name': 'Yard',
      'time': '12/11/2022',
      'avatarUrl':
          'https://robohash.org/debitisliberosunt.png?size=50x50&set=set1',
      'isMine': false
    },
    {
      'id': '6467f8d2fc13ae4ace753b03',
      'name': 'Bart',
      'time': '1/5/2023',
      'avatarUrl': 'https://robohash.org/autemquiqui.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753b04',
      'name': 'Krysta',
      'time': '8/24/2022',
      'avatarUrl':
          'https://robohash.org/eosaccusamussapiente.png?size=50x50&set=set1',
      'isMine': true
    },
    {
      'id': '6467f8d2fc13ae4ace753b05',
      'name': 'Wanda',
      'time': '9/14/2022',
      'avatarUrl':
          'https://robohash.org/etaccusantiumdolore.png?size=50x50&set=set1',
      'isMine': false
    }
  ];
}
