# require 'sinatra'
require 'wordnet'
require 'json'
require 'pp'

index = WordNet::NounIndex.instance

def getWord(word, index)
	lemma = index.find(word)
	lemma.synsets.each { |synset| pp synset.words }
end

getWord('art', index)
