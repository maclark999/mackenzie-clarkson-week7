require 'rails_helper'

describe 'User can CRUD courses' do
  User.create(:user_name => 'person', :password => 'password', :about => 'ugh')
  before :each do visit '/signin'
    fill_in :user_name, :with => 'person'
    fill_in :password, :with => 'password'
    click_on 'Log In'
    click_on 'See Courses'
  end
  scenario 'User can add new course' do
    click_on 'Add Course'

    expect(page).to have_content('New Course')
    fill_in 'course[title]', :with => 'testcourse'
    click_on 'Create Course'

    expect(page).to have_content ('testcourse')
  end

  scenario 'User can see course show page' do
    click_on 'Add Course'
    fill_in 'course[title]', :with => 'testcourse'
    click_on 'Create Course'

    expect(page).to have_content ('testcourse')
  end

  scenario 'User can edit course' do
    click_on 'Add Course'
    fill_in 'course[title]', :with => 'testcourse'
    click_on 'Create Course'

    click_on 'Edit'

    fill_in 'course[title]', :with => 'test'
    click_on 'Update Course'

    expect(page).to have_content ('test')
  end

  scenario 'User can delete course' do
    click_on 'Add Course'
    fill_in 'course[title]', :with => 'testcourse'
    click_on 'Create Course'

    click_on 'Delete'

    expect(page).to have_no_content ('testcourse')
  end

end
