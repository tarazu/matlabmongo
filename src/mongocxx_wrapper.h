#include <bsoncxx/json.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/uri.hpp>

#include <string>


class test
{
  public:
    test(std::string uri)
     : _connection(mongocxx::uri{"mongodb://" + uri}){};

    void write_json(std::string json, std::string database, std::string collection)
    {
        bsoncxx::document::value bson = bsoncxx::from_json(json);
        auto mongo = _connection[database][collection];
        mongo.insert_one(bson.view());
    }

  private:
    mongocxx::client _connection;
};




