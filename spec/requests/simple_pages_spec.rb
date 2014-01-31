require 'spec_helper'

describe "SimplePages" do
  
  describe "Home page" do
    it "should have the content 'Web App'" do
      visit '/simple_pages/home'
      expect(page).to have_content('Web App')
    end
  end
  
    describe "Help page" do
    it "should have the content 'Help'" do
      visit '/simple_pages/help'
      expect(page).to have_content('Help')
    end
  end
  
    describe "About page" do
    it "should have the content 'About me-now'" do
      visit '/simple_pages/about'
      expect(page).to have_content('About me-now')
    end
  end
  
end
