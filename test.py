from cassandra.auth import PlainTextAuthProvider
from cassandra.cluster import Cluster

from settings import CASSANDRA_KEY_SPACE

credentials = {'username': 'cassandra', 'password': 'cassandra'}

ap = PlainTextAuthProvider(username='cassandra', password='cassandra')

cluster = Cluster(
    contact_points=['localhost'],
    port=9042,
    auth_provider=ap,
)

