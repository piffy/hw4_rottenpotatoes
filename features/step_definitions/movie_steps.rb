# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
    
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    
    Movie.create!(movie)
  end
  #assert false, "Unimplmemented"

end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had
  Movie.where(:title => arg1,:director => arg2 ).size.should > 0
end

