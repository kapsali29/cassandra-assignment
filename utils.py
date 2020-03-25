import argparse

from models import SongByName


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
