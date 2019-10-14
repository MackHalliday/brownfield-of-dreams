require 'rails_helper'

describe 'visitor sees a video show' do

  it 'vistor clicks on a tutorial title from the home page' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)

    visit '/'

    click_on tutorial.title

    click_link 'Bookmark'

    expect(current_path).to eq(tutorial_path(tutorial))
    expect(page).to have_content("User must login to bookmark videos.")
  end
end
