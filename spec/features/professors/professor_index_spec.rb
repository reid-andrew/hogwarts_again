require 'rails_helper'

RSpec.describe "PROFESSORS index page - A user", type: :feature do
  before(:each) do
    @prof_1 = Professor.create( name: "Mike",
                                age: "25",
                                specialty: "Rails Development")
    @prof_2 = Professor.create( name: "Meg",
                                age: "25",
                                specialty: "Software")
    @prof_3 = Professor.create( name: "Cory",
                                age: "25",
                                specialty: "SendGrid")

  end

  it "can see a list of prfessors with information" do
    visit "/professors"

    within ("#prof-#{@prof_1.id}") do
      expect(page).to have_content("#{@prof_1.name}")
      expect(page).to have_content("#{@prof_1.age}")
      expect(page).to have_content("#{@prof_1.specialty}")
    end

    within ("#prof-#{@prof_3.id}") do
      expect(page).to have_content("#{@prof_3.name}")
      expect(page).to have_content("#{@prof_3.age}")
      expect(page).to have_content("#{@prof_3.specialty}")
    end
  end
end
