from cassandra_client import CassandraClient
from utils import create_song_by_name, get_song_by_name, get_parser

client = CassandraClient()
client.sync_models()

args = get_parser().parse_args()
ask = args.ask

if ask == 'song_by_name':
    # Retrieve song by name
    create_song_by_name(song_name='one1 song', artist='one1 artist', album='one1 album', genre='one1 genre', year=2100)
    create_song_by_name(song_name='one2 song', artist='one2 artist', album='one2 album', genre='one2 genre', year=2200)
    create_song_by_name(song_name='song3', artist='one3 artist', album='one3 album', genre='one3 genre', year=2009)
    create_song_by_name(song_name='rock song', artist='rock artist', album='rock album', genre='one1 rock', year=2101)

    get_song_by_name(song_name='rock song')
