require 'sinatra'
require 'wordnet'
require 'json'
require 'pp'
require 'sinatra/jsonp'

$nouns = WordNet::NounIndex.instance
$adj = WordNet::AdjectiveIndex.instance
$verb = WordNet::VerbIndex.instance
$adv = WordNet::AdverbIndex.instance




def get_synonyms(word)

	synonyms = nil
	lemma = $nouns.find(word)
	lemma = $adj.find(word) unless lemma
	lemma = $verb.find(word) unless lemma
	lemma = $adv.find(word) unless lemma
	pp lemma
	# lemma.synsets.each { |synset| pp synset.words } unless !lemma
	synonyms = lemma.synsets.map { |synset| synset.words } unless !lemma
	pp synonyms
	return synonyms
end

def analyze_text(words)
	words.each do |word|
		pp word
		synonyms = get_synonyms(word)
		pp synonyms
		# word['synonyms'] = synonyms unless !synonyms
		# word['synonyms'] unless !synonyms
	end

end

# getWord('pants', index)

post '/synonyms' do

	pp request.body 
	
end

get '/test' do

	words = params['test']
	analyze_text(words)
	data = ["hello","hi","hallo"]

	JSONP data

end