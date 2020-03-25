from cassandra_client import CassandraClient
from utils import create_song_by_name, get_song_by_name, get_parser, create_songs_played_by_user, \
    get_songs_played_by_user

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

    res = get_song_by_name(song_name='rock song')

elif ask == 'songs_played_by_user':
    create_songs_played_by_user(song_name='this_song', user_name='user1', genre='rock', date_played='2017-01-01')
    create_songs_played_by_user(song_name='this_song2', user_name='user2', genre='rock', date_played='2017-01-02')
    create_songs_played_by_user(song_name='this_song3', user_name='user3', genre='hip hop', date_played='2017-01-03')
    create_songs_played_by_user(song_name='this_song34', user_name='user4', genre='hip hop', date_played='2018-01-03')
    create_songs_played_by_user(song_name='this_song43', user_name='user3', genre='hip hop', date_played='2018-02-03')

    res = get_songs_played_by_user(user='user3')

print(res)
