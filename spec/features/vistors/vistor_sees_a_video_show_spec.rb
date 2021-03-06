# frozen_string_literal: true

require 'rails_helper'

describe 'visitor sees a video show' do
  it 'vistor clicks on a tutorial title from the home page' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)

    visit '/'

    click_on tutorial.title

    expect(page).to have_current_path(tutorial_path(tutorial), ignore_query: true)
    expect(page).to have_content(video.title)
    expect(page).to have_content(tutorial.title)
  end
end
