var db = require('../db');


module.exports = {
  messages: {
    get: function (callback) {
      var queryStr = 'select Messages.id, Messages.text, Users.name from Messages \
                      left outer join Users on (Messages.user_id = Users.id) \
                      order by Messages.id desc';
      db.query(queryStr, function(err, result) {
        callback(result);
      })
    }, // a function which produces all the Messages
    post: function (params, callback) {
      var queryStr = "insert into Messages(text, user_id, room_id) \
                      values ( ?, (select id from Users, where name = ? limit 1), (select id from Rooms, where name = ? limit 1))"
      db.query(queryStr, params, function (err, results) {
        callback(results);
      });
    } // a function which can be used to insert a message into the database
  },

  users: {
    // Ditto as above.
    get: function (callback) {
      var queryStr = 'select * from Users';
      db.query(queryStr, function(err, results) {
        callback(results);
      })
    },
    post: function (params, callback) {
      var queryStr = "insert into Users(name) values (?)";
      db.query(queryStr, params, function (err, results) {
        callback(results);
      });
    }
  }
};

