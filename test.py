from cassandra_client import CassandraClient
from utils import create_song_by_name, get_song_by_name, get_parser, create_songs_played_by_user, \
    get_songs_played_by_user, create_search_playlist_by_name, get_search_playlist_by_name, create_playlist_followers, \
    get_playlist_followers, create_user_followers, get_user_followers, create_song_in_playlist, get_song_in_playlist

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

elif ask == 'search_playlist_by_name':
    create_search_playlist_by_name(name='playlist1', description='This is playlist 1', genre='rock', creator='creator 1', songs=['song1', 'song2', 'song3'])
    create_search_playlist_by_name(name='playlist2', description='This is playlist 2', genre='rock',
                                   creator='creator 2', songs=['song12', 'song22', 'song32'])
    create_search_playlist_by_name(name='playlist3', description='This is playlist 3', genre='rock',
                                   creator='creator 3', songs=['song3', 'song23', 'song33'])

    res = get_search_playlist_by_name(playlist_name='playlist1')

elif ask == 'playlist_followers':
    create_playlist_followers(playlist_name='playlist1', follower_name='follower1')
    create_playlist_followers(playlist_name='playlist1', follower_name='follower2')
    create_playlist_followers(playlist_name='playlist2', follower_name='follower2')
    create_playlist_followers(playlist_name='playlist2', follower_name='follower3')

    res = get_playlist_followers(playlist_name='playlist1')

elif ask == 'user_follower':
    create_user_followers(user_name='user1', follower_name='user2')
    create_user_followers(user_name='user1', follower_name='user3')
    create_user_followers(user_name='user1', follower_name='user4')
    create_user_followers(user_name='user1', follower_name='user5')
    create_user_followers(user_name='user2', follower_name='user3')
    create_user_followers(user_name='user2', follower_name='user7')

    res = get_user_followers(user_name='user2')

elif ask == 'song_in_playlist':
    create_song_in_playlist(playlist_name='playlist1', song_name='song1', artist_name='artist1', year=2000, genre='rock')
    create_song_in_playlist(playlist_name='playlist1', song_name='song2', artist_name='artist2', year=2001,
                            genre='rock')
    create_song_in_playlist(playlist_name='playlist1', song_name='song3', artist_name='artist3', year=2003,
                            genre='rock')
    create_song_in_playlist(playlist_name='playlist2', song_name='song22', artist_name='artist22', year=2010,
                            genre='pop')

    res = get_song_in_playlist(playlist_name='playlist1')

print(res)
