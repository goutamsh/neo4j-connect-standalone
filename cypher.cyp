CREATE (sam:User{name:'Sam', age: 10})
CREATE (jon:User{name:'Jon', age: 20})
CREATE (dan:User{name:'Dan', age: 30})
CREATE (tim:User{name:'Tim', age: 40})
CREATE (mat:User{name:'Mat', age: 50})

CREATE (glasgow:City{name:'Glasgow', code:'GLA'})
CREATE (bangalore:City{name:'Bangalore', code:'BLR'})
CREATE (edinburgh:City{name:'Edinburgh', code:'EDN'})
CREATE (london:City{name:'London', code:'Lon'})

CREATE (sam)-[:LIVES_IN{since:'01/01/2000'}]->(glasgow)
CREATE (jon)-[:LIVES_IN{since:'01/01/2001'}]->(bangalore)
CREATE (dan)-[:LIVES_IN{since:'01/01/2002'}]->(edinburgh)
CREATE (tim)-[:LIVES_IN{since:'01/01/2001'}]->(london)
CREATE (mat)-[l:LIVES_IN{since:'01/01/2001'}]->(glasgow)



