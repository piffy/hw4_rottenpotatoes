require 'spec_helper'

describe MoviesController do
  
  describe 'I should test that all the ratings exist' do
  it 'should have all the ratings ' do
  Movie.all_ratings
     end
  end
  
  describe 'Test basic acces' do
  it 'should get basic access' do
    get :index
    get :index, {:sort => :title}, {:ratings => Movie.all_ratings}
    get :index, {:sort => :release_date}
    get :new
    post :create
    get :show, {:id => '1'}
    get :destroy, {:id => '1'}
    #Movie.create!([:id=>1,:title => "A Strange Movie",:rating => 'R', :director => "Me"])
    #get :edit, {:id => '1'}
    #get :update, {:id => '1'}
    #Movie.destroy(1)
    end
  end

  describe 'find movies similar to the given one: (happy path)' do
    
    #Movie.create!([:id=>2,:title => "A Doubly Strange Movie",:rating => 'R', :director => "Me"])
    
    it 'should show a list of movies similar to the given one' do
          #movie = FactoryGirl.build(:movie, :id => '1', :director => "Scott")
          Movie.create!([:id=>1,:title => "A Strange Movie",:rating => 'R', :director => "Me"])
          get :edit, {:id => '1'} #Ugly!
          get :update, {:id => '1'} #Ugly!
          get :find_similar, {:id => '1'}
          Movie.destroy(1)
    end
  end
  
  describe 'find movies similar to the given one: (sad path)' do
    
    #Movie.create!([:id=>2,:title => "A Doubly Strange Movie",:rating => 'R', :director => "Me"])
    
    it 'should return to the home page' do
          #movie = FactoryGirl.build(:movie, :id => '1', :director => "Scott")
          Movie.create!([:id=>1,:title => "A Strange Movie",:rating => 'R'])
          get :find_similar, {:id => '1'}
          Movie.destroy(1)
    end
  end
  
end
