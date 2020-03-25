import os

# Cassandra Settings
CASSANDRA_NODE = os.environ.get('CASSANDRA_CONTAINER', 'localhost')
CASSANDRA_PORT = os.environ.get('CASSANDRA_PORT', 9042)
CASSANDRA_KEY_SPACE = os.environ.get('KEYSPACE', 'python_cassandra')
CONNECTION_NAME = os.environ.get('KEYSPACE', 'python_cassandra')
CASSANDRA_USERNAME = os.environ.get('CASANDRA_USERNAME', 'cassandra')
CASSANDRA_PASSWORD = os.environ.get('CASSANDRA_PASSWORD', 'cassandra')
REPLICATION_FACTOR = os.environ.get('REPLICATION_FACTOR', 3)
