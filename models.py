from cassandra.cqlengine.models import Model
from cassandra.cqlengine.columns import *

from settings import CASSANDRA_KEY_SPACE, CONNECTION_NAME


class SongByName(Model):
    __table_name__ = 'SongByName'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    song_name = Text(primary_key=True)
    artist = Text()
    album = Text()
    genre = Text()
    year = Integer()


class SongsPlayedByUser(Model):
    __table_name__ = 'SongsPlayedByUser'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    song_name = Text()
    user_name = Text(primary_key=True)
    genre = Text()
    date_played = Date(primary_key=True, clustering_order='DESC')


class SearchPlayListByName(Model):
    __table_name__ = 'SearchPlayListByName'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    name = Text(primary_key=True)
    description = Text()
    genre = Text()
    creator = Text()
    songs = List(Text())


class PlayListFollower(Model):
    __table_name__ = 'PlayListFollower'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    playlist_name = Text(primary_key=True)
    follower_name = Text(primary_key=True)


class UserFollower(Model):
    __table_name__ = 'UserFollower'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    user_name = Text(primary_key=True)
    follower_name = Text(primary_key=True)


class SongInPlayList(Model):
    __table_name__ = 'SongInPlayList'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    playlist_name = Text(primary_key=True)
    song_name = Text(primary_key=True)
    artist_name = Text(primary_key=True)
    year = Integer(primary_key=True)
    genre = Text()


class PlaylistPopularityPrefixed(Model):
    __table_name__ = 'PlaylistPopularityPrefixed'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    prefix = Integer(primary_key=True)
    playlist_name = Text(primary_key=True, clustering_order='ASC')
    played = Integer(primary_key=True, clustering_order='DESC')


class UserDecreasingPopularityPrefix(Model):
    __table_name__ = 'UserDecreasingPopularityPrefix'
    __keyspace__ = CASSANDRA_KEY_SPACE
    __connection__ = CONNECTION_NAME

    prefix = Integer(primary_key=True)
    user_name = Text(primary_key=True, clustering_order='ASC')
    followers = Integer(primary_key=True, clustering_order='DESC')

