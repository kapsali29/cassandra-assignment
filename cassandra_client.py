from cassandra.auth import PlainTextAuthProvider
from cassandra.cluster import Cluster
from cassandra.cqlengine import management
from cassandra.cqlengine import connection

from models import SongByName, SongsPlayedByUser, SearchPlayListByName, PlayListFollower, UserFollower, SongInPlayList, \
    PlaylistPopularityPrefixed, UserDecreasingPopularityPrefix
from settings import CASSANDRA_NODE, CASSANDRA_PORT, CASSANDRA_USERNAME, CASSANDRA_PASSWORD, CASSANDRA_KEY_SPACE, \
    CONNECTION_NAME, REPLICATION_FACTOR


class CassandraClient(object):
    """This Python object is used to handle Apache Cassandra Instance
    """

    def __init__(self):
        self.client_credentials = PlainTextAuthProvider(
            username=CASSANDRA_USERNAME,
            password=CASSANDRA_PASSWORD
        )

        self.cluster = Cluster(
            contact_points=[CASSANDRA_NODE],
            port=CASSANDRA_PORT,
            auth_provider=self.client_credentials,
        )

        self.session = self.cluster.connect()
        self.connection = connection.register_connection(CONNECTION_NAME, session=self.session)

        management.create_keyspace_simple(
            CASSANDRA_KEY_SPACE,
            connections=[CONNECTION_NAME],
            replication_factor=REPLICATION_FACTOR
        )

    @staticmethod
    def sync_models():
        management.sync_table(SongByName)
        management.sync_table(SongsPlayedByUser)
        management.sync_table(SearchPlayListByName)
        management.sync_table(PlayListFollower)
        management.sync_table(UserFollower)
        management.sync_table(SongInPlayList)
        management.sync_table(PlaylistPopularityPrefixed)
        management.sync_table(UserDecreasingPopularityPrefix)



client = CassandraClient()
client.sync_models()
