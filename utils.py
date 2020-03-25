import argparse

from models import SongByName, SongsPlayedByUser, SearchPlayListByName, PlayListFollower


def get_parser():
    """
        >>> parser_object = get_parser()
    """
    arg_parser = argparse.ArgumentParser(
        description="Instructs cassandra client to accept commands")
    arg_parser.add_argument("--ask", help="ask cassandra")
    return arg_parser


def create_song_by_name(**kwargs):
    """
    This function is used to create data for SongByName Table
    Args:
        **kwargs: provided kwargs

    Examples:
        >>> create_song_by_name(song_name='one song', artist='one artist', album='one album', genre='one genre', year=2000)
    """
    SongByName.objects.create(**kwargs)


def get_song_by_name(song_name):
    """
    This function is used to retrieve song by names

    Args:
        song_name: provided song name

    Returns: cassandra record
    """
    song = SongByName.objects.filter(song_name=song_name)
    return song.get().values()


def create_songs_played_by_user(**kwargs):
    """
    This function is used to create data for SongsPlayedByUser Table
    Args:
        **kwargs: provided kwargs

    Examples:
        >>> create_songs_played_by_user(song_name='this song', user_name='this user', genre='rock', date_played='2010-01-09')

    """
    SongsPlayedByUser.objects.create(**kwargs)


def get_songs_played_by_user(user):
    """Return songs played by user"""

    user_songs = SongsPlayedByUser.objects.filter(user_name=user)
    songs = [res.song_name for res in user_songs]
    return songs


def create_search_playlist_by_name(**kwargs):
    """This function is used to fill data the SearchPlayListByName Table"""
    SearchPlayListByName.objects.create(**kwargs)


def get_search_playlist_by_name(playlist_name):
    """This function is used to retrieve a playlist using its name"""
    playlist = SearchPlayListByName.objects.filter(name=playlist_name)
    return playlist.get().values()


def create_playlist_followers(**kwargs):
    """This function is used to fill with Data PlayListFollowers Table"""
    PlayListFollower.objects.create(**kwargs)


def get_playlist_followers(playlist_name):
    """This function is used to retrieve playlist followers"""
    followers = PlayListFollower.objects.filter(playlist_name=playlist_name)
    results = [res.follower_name for res in followers]
    return results


def create_user_followers(**kwargs):
    """This function is used to fill with Data UserFollowers Table"""
