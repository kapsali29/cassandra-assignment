## Start One node
`docker-compose up -d n1`

**Check n1 status**

`docker-compose exec n1 nodetool status`

## Add node

`docker-compose up -d n2`

and run n1 status

`docker-compose exec n1 nodetool status`

The above command could be executed in any node in the cluster

## Help command

`docker-compose exec n1 nodetool help`