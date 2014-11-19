require 'rubygems'
require 'sinatra'
require 'rest-client'
require 'json/ext'
require 'mongo'
include Mongo

mongo = Mongo::MongoClient.new
db = mongo['math2']
cola = db['question']
colb = db['answer']
colc = db['question3']
col4 = db['col4']
rcol2 = db['rcol2']
rcol3 = db['rcol3']
rcol4 = db['rcol4']

set :bind, '0.0.0.0'
set :port, 3000


get '/math.erb' do
    @doc = []
    @mchannel = params['subcategory']
    @subject = []
    @math = []
    @reading = []

    if @mchannel == "Math Grade 2"
    @maths = cola.find()
      elsif @mchannel == "Math Grade 3"
    @maths = colc.find()
      elsif @mchannel == "Math Grade 4"
    @maths = col4.find()

    end
  erb :math
end

get '/reading.erb' do
    @maths = cola.find()

    @doc = []
    @rchannel = params['readcategory']
    @doc = []
        if @rchannel == "Reading Grade 2"
    @read = rcol2.find()
      elsif @rchannel == "Reading Grade 3"
    @read = rcol3.find()
      elsif @rchannel == "Reading Grade 4"
    @read = rcol4.find()
    end
  erb :reading
end

get '/' do
  @mathb = colb.find()
  erb :home
end

get '/category' do
    @channel = params['category']
    @subject = []
    @math = []
    @reading = []

    if @channel == "Choose One"
        @subject = []
      elsif @channel == "Math"
        @channel = "Math"
      elsif @channel == "Reading"
        @reading << @subject
    end
  erb :home
end

get '/subcategory' do
    @doc = []
    @mchannel = params['subcategory']
    @subject = []
    @math = []
    @reading = []

    if @mchannel == "Math Grade 2"
    @maths = cola.find()
      elsif @mchannel == "Math Grade 3"
    @maths = colc.find()
      elsif @mchannel == "Math Grade 4"
    @maths = col4.find()

    end
    erb :math
end

get '/readcategory' do
  @rchannel = params['readcategory']
    @doc = []
        if @rchannel == "Reading Grade 2"
    @read = rcol2.find()
      elsif @rchannel == "Reading Grade 3"
    @read = rcol3.find()
      elsif @rchannel == "Reading Grade 4"
    @read = rcol4.find()
end
    erb :reading
end

