require "application_system_test_case"

class MeetingsTest < ApplicationSystemTestCase
  setup do
    @meeting = meetings(:one)
  end

  test "visiting the index" do
    visit meetings_url
    assert_selector "h1", text: "Meetings"
  end

  test "should create meeting" do
    visit meetings_url
    click_on "New meeting"

    fill_in "Description", with: @meeting.description
    fill_in "Meeting date", with: @meeting.meeting_date
    fill_in "Meeting place", with: @meeting.meeting_place
    fill_in "Meeting time", with: @meeting.meeting_time
    fill_in "Status", with: @meeting.status
    fill_in "Tags", with: @meeting.tags
    fill_in "Title", with: @meeting.title
    fill_in "User", with: @meeting.user_id
    click_on "Create Meeting"

    assert_text "Meeting was successfully created"
    click_on "Back"
  end

  test "should update Meeting" do
    visit meeting_url(@meeting)
    click_on "Edit this meeting", match: :first

    fill_in "Description", with: @meeting.description
    fill_in "Meeting date", with: @meeting.meeting_date
    fill_in "Meeting place", with: @meeting.meeting_place
    fill_in "Meeting time", with: @meeting.meeting_time
    fill_in "Status", with: @meeting.status
    fill_in "Tags", with: @meeting.tags
    fill_in "Title", with: @meeting.title
    fill_in "User", with: @meeting.user_id
    click_on "Update Meeting"

    assert_text "Meeting was successfully updated"
    click_on "Back"
  end

  test "should destroy Meeting" do
    visit meeting_url(@meeting)
    click_on "Destroy this meeting", match: :first

    assert_text "Meeting was successfully destroyed"
  end
end
