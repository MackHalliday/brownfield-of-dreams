require 'rails_helper'

describe "user boomarks" do
  it "can see bookmarked videos on user dashboard", :vcr do

    user = create(:user, github_id: 123, github_token: ENV["GITHUB_API_KEY"])

    tutorial_1 = create(:tutorial, title: "title_1")
      video_2 = create(:video, title: "video_2", position: 2, tutorial_id: tutorial_1.id)
      video_3 = create(:video, title: "video_3", position: 3, tutorial_id: tutorial_1.id)
      video_1 = create(:video, title: "video_1", position: 1, tutorial_id: tutorial_1.id)


    tutorial_2 = create(:tutorial, title: "title_2")
      video_4 = create(:video, title: "video_4", position: 1, tutorial_id: tutorial_2.id)
      video_5 = create(:video, title: "video_5", position: 2, tutorial_id: tutorial_2.id)
      video_6 = create(:video, title: "video_6", position: 3, tutorial_id: tutorial_2.id)

    user_videos_1 = create(:user_video, user_id: user.id, video_id: video_1.id)
    user_videos_2 = create(:user_video, user_id: user.id, video_id: video_2.id)
    user_videos_3 = create(:user_video, user_id: user.id, video_id: video_3.id)
    user_videos_4 = create(:user_video, user_id: user.id, video_id: video_4.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    within ".bookmark" do
      within "#tutorial-#{tutorial_1.id}" do
        expect(page).to have_link(video_1.title)
        expect(page).to have_link(video_2.title)
        expect(page).to have_link(video_3.title)
      end
    end

    within ".bookmark" do
      within "#tutorial-#{tutorial_2.id}" do
        expect(page).to have_link(video_4.title)
        expect(page).to_not have_link(video_5.title)
        expect(page).to_not have_link(video_6.title)
      end
    end

    within ".bookmark" do
      within "#tutorial-#{tutorial_1.id}" do
        click_link(video_1.title)
      end
    end

    expect(page).to have_current_path("/tutorials/#{tutorial_1.id}?video_id=#{video_1.id}")
  end

  it "cannot see bookmarked videos if no videos bookmarked" do

    user = create(:user, github_id: 123, github_token: ENV["GITHUB_API_KEY"])

    tutorial_1 = create(:tutorial, title: "title_1")
      video_1 = create(:video, title: "video_1", position: 1, tutorial_id: tutorial_1.id)
      video_2 = create(:video, title: "video_2", position: 2, tutorial_id: tutorial_1.id)
      video_3 = create(:video, title: "video_3", position: 3, tutorial_id: tutorial_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    within ".bookmark" do
      expect(page).to_not have_link(video_1.title)
      expect(page).to_not have_link(video_2.title)
      expect(page).to_not have_link(video_3.title)
    end

    expect(page).to have_content("Your bookmarked videos will appear here!")
  end
end
