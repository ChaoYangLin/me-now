require 'spec_helper'

describe "SimplePages" do
  
  describe "Home page" do
    it "should have the content 'Web App'" do
      visit '/simple_pages/home'
      expect(page).to have_content('Web App')
    end
    
    it "should have the base title" do
      visit '/simple_pages/home'
      expect(page).to have_title('Me-Now')
    end
      
    it "should not have a custom page title" do
      visit '/simple_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end
  
  
    describe "Help page" do
    it "should have the content 'Help'" do
      visit '/simple_pages/help'
      expect(page).to have_content('Help')
    end
    
    it "should have the title 'Help'" do
      visit '/simple_pages/help'
      expect(page).to have_title('Help')
    end
  end
  
  
    describe "About page" do
    it "should have the content 'About me-now'" do
      visit '/simple_pages/about'
      expect(page).to have_content('About me-now')
    end
    
    it "should have the title 'About me-now'" do
      visit '/simple_pages/about'
      expect(page).to have_title('About me-now')
    end
  end

  
end
