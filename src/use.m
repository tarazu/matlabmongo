addpath('gen/mongomat');

libLoc = '/usr/local/lib/';
path = getenv('PATH');
setenv('PATH', [libLoc ';' path]);

%import clib.mongomat.*

uri = "localhost:27017";
db = "matlab";
collection = "test";

dbclient = clib.mongomat.test(uri)

dbclient.write_json("{'key': 'value'}", db, collection)