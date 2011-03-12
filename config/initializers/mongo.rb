if ENV['MONGOHQ_URL']
    MongoMapper.config = {RAILS_ENV => {'uri' => ENV['MONGOHQ_URL']}}
    MongoMapper.connect(RAILS_ENV)
else
    MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
    MongoMapper.database = "#vlgshortner-#{Rails.env}"
end

