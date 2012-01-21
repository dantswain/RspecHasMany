This code is a minimal (not-)working example of the problem I'm trying to get solved with this stackoverflow question: http://stackoverflow.com/questions/8914121/rspec-testing-has-many-through-and-after-save

The main files of interest are
 * app/models/thing.rb
 * spec/models/thing_spec.rb

You can see the problem if you run (after migrating up the test database)
    
    bundle exec rspec spec/models/thing_spec.rb

If you comment out the has_many :through relationship in things.rb and uncomment the followers method, the tests pass.   If you comment out the reference to followers in the after_save hook in things.rb, the tests pass.