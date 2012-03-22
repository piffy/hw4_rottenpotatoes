require 'spec_helper'

describe MoviesController do
  describe 'find movies similar to the given one: (happy path)' do
    Movie.create!([:id=>1,:title => "A Strange Movie",:rating => 'R', :director => "Me"])
    Movie.create!([:id=>2,:title => "A Doubly Strange Movie",:rating => 'R', :director => "Me"])
    it 'should call the model method that finds the movies' do
      movie=Movie.find_similar(1)
    end
    it 'should show a list of movies similar to the given one' do
          get :find_similar, {:id => '1'}
    end
  end
end
