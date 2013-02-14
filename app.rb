require 'sinatra'
require 'wordnet'
require 'json'
require 'pp'
require 'sinatra/jsonp'

index = WordNet::NounIndex.instance

def getWord(word, index)
	lemma = index.find(word)
	lemma.synsets.each { |synset| pp synset.words }
end

# getWord('pants', index)

post '/synonyms' do

	pp request.body 
	
end

get '/test' do

	pp params['test']

	data = ["hello","hi","hallo"]

	JSONP data

end