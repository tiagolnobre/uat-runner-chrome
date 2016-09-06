require 'spec_helper'

feature 'Google' do
  scenario 'Visit Google.com' do
    visit 'https://www.google.co.uk/'

    expect(page).to have_content(/google/i)
  end
end
