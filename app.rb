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
	pp 'lemma is nil after nouns' if lemma == nil
	lemma = $adj.find(word) unless lemma
	pp 'lemma is nil after adj' if lemma == nil

	lemma = $verb.find(word) unless lemma
	pp 'lemma is nil after verb' if lemma == nil

	lemma = $adv.find(word) unless lemma
	pp 'lemma is nil after adv' if lemma == nil

	# lemma.synsets.each { |synset| pp synset.words } unless !lemma
	unless !lemma
		synwords = lemma.synsets.map { |synset| synset.words }
		synwords.flatten!
		synonyms = synwords.map {|word| word.gsub('_', ' ') } 
	end

	# synonyms.each { |word| word.gsub!('_', ' ') } unless !lemma
	return synonyms
end

def analyze_text(words) 
	wordset = []
	words.each do |word|
		word_with_synonyms = []
		pp word

		word_with_synonyms.push(word)

		synonyms = get_synonyms(word)
		pp synonyms

		synonyms.each { |synonym| word_with_synonyms.push(synonym) } unless !synonyms
		pp word_with_synonyms

		wordset.push(word_with_synonyms.flatten)

	end

	pp wordset

	return wordset

end

# getWord('pants', index)

get '/synonyms' do
	words = params['text']
	synonyms = analyze_text(words)
	
	JSONP synonyms
end

get '/test' do

	words = params['test']
	analyze_text(words)
	data = ["hello","hi","hallo"]

	JSONP data

end