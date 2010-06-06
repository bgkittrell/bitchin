# About Bitchin

Bitchin is a very simple Rails plugin that makes it super easy to add properties to your ActiveRecord Models without those pesky table columns. There are two components...

## Bitchin (Boolean Values)

This is a [bit field](http://en.wikipedia.org/wiki/Bit_field) that uses a single Integer column but allows you to store multiple Boolean values.  Because the only value stored is an Integer and deserialization is only a binary operation, it's very fast.

### Usage

By default Bitchin looks for an Integer column in your model called 'bit_flag'. This is all it takes to get working.

    model User << ActiveRecord::Base
      bitchin :active, :banned, :stupid

Otherwise you can specify the column name yourself.

    model User << ActiveRecord::Base
      bitchin({:column => :settings_flag }, :active, :banned, :stupid)

Accessors are automatically added to your model.

    user.stupid = true
    user.stupid? #=> true
    user.stupid #=> true

### Important Notes

1.  Bitchin should **NOT** be used for fields that need to be queried with SQL.  The value stored in the DB will be a single Integer, not seperate values. 
2.  Fields can **NOT** be re-ordered or removed. Bit flags rely on an internal counter for deserialization. You can however add fields at any time.  

## Hashed (Scalar Values)

ActiveRecords provides built-in hash serialization for text columns, but you don't get snazzy accessors.

### Usage

By default Hashed looks for an Text column in your model called 'hash_field'. This is all it takes to get working.

    model User << ActiveRecord::Base
      hashed :twitter_username, :github_username 

Otherwise you can specify the column name yourself.

    model User << ActiveRecord::Base
      hashed({:column => :settings_hash }, :twitter_username, github_username

Accessors are automatically added to your model.

    user.twitter_username = "bgkittrell"
    user.twitter_username #=> "bgkittrell"

### Important Notes

1.  Hashed should **NOT** be used for fields that need to be queried with SQL.  The value stored in the DB will be a stored as YAML.

## Installation

`./script/plugin install git://github.com/bgkittrell/bitchin.git`

# License

This plugin is under the Do Whatever The Fuck You Want With It License (DWTFYWWIL)

