--Neo4J Queries for Demo

--CREATE operation

CREATE ()

MATCH (n)
RETURN n

CREATE (sam:User {name:'Sam'})
CREATE (glasgow:City{name:'Glasgow'})
CREATE (sam)-[:LIVES_IN{since:'2000'}]->(glasgow)

--MATCH and create Relationship
MATCH (sam:User{name:'Sam'}),(glasgow:City{name:'Glasgow'})
CREATE (sam)-[:LIVES_IN{since:'2000'}]->(glasgow)

--Delete all nodes and relationships
MATCH (u)-[l]->(c)
DELETE u,l,c

MATCH (n)
DELETE n
RETURN n

--Read Operation(fetch)
CREATE (sam:User {name:'Sam'})
CREATE (gla:City{name:'Glasgow'})
CREATE (ted:User {name:'Ted'})
CREATE (edn:City{name:'Edinburgh'})
CREATE (tim:User {name:'Tim'})
CREATE (lon:City{name:'London'})

CREATE (sam)-[:LIVES_IN]->(gla)
CREATE (ted)-[:LIVES_IN]->(edn)
CREATE (tim)-[:LIVES_IN]->(lon)


CREATE (jon:User {name:'Jon'})

MATCH (gla:City{name:'Glasgow'}),(jon:User {name:'Jon'})
CREATE (jon)-[:LIVES_IN]->(gla)

MATCH (u)-[l]->(c)
RETURN u,l,c

MATCH p=()-[]->()
RETURN p

MATCH (u)-[]->(:City{name:'Glasgow'})
RETURN u

--Update Operation (SET)


MATCH (sam:User {name:'Sam'})
RETURN sam


MATCH (sam:User {name:'Sam'})
SET sam.age=10
RETURN sam


MATCH (sam:User {name:'Sam'})
SET sam.age=NULL
RETURN sam

MATCH (sam:User {name:'Sam'})
SET sam:Singer
RETURN sam

CREATE (Nic:User{name:'Nic', age:40, salary:1000})

CREATE (sam:User{name:'Sam', age:40, salary:1000})

MATCH (sam:User {name:'Sam'}), (nic:User{name:'Nic'})
SET sam=nic
RETURN sam,nic

MATCH (nic:User {name:'Nic'})
DELETE nic
RETURN nic

MATCH (sam:User {name:'Sam'})
REMOVE sam:Singer
RETURN sam

MATCH (sam:User {name:'Sam'})
REMOVE sam.salary
RETURN sam


MATCH (sam:User {name:'Sam'})
DELETE sam
RETURN sam

--Merge example

MATCH (blore:City{name:'Bangalore'})
RETURN blore


MERGE (blore:City{name:'Bangalore'})
RETURN blore


MERGE (blore:City{name:'Bangalore', code:'123'})
RETURN blore

--Create Index

CREATE (Nic:User{name:'Nic', age:40, salary:1000})


CREATE INDEX ON :User(name)

DROP INDEX ON :User(name)

--Create Unique constraint

CREATE (Nic:User{name:'Nic', age:40, salary:1000})

CREATE CONSTRAINT ON (u:User)
ASSERT u.name IS UNIQUE 

CREATE (Nic:User{name:'Nic', age:40, salary:1000})


DROP CONSTRAINT ON (u:User)
ASSERT u.name IS UNIQUE

CREATE (Nic:User{name:'Nic', age:40, salary:1000})


--Load data from CSV

LOAD CSV WITH HEADERS FROM
"file:///C:/Goutam/JavaWorkSpace/neo4j-connect-standalone/load_csv_file.csv"
AS line
CREATE (p:Person{id:line.id, name:line.name, age:toInt(line.age)})
RETURN p