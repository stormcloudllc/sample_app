require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "My Realm"}

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1',		:text => heading)}
		it { should have_selector('title',	:text => full_title(page_title)) }
	end

	describe "Home page" do
		before { visit root_path }

		let(:heading)		{ 'Beautiful Person' }
		let(:page_title)	{ '' }

		it_should_behave_like "all static pages"
		it { should_not have_selector 'title', :text => '| Home'} 
	#	it { should have_selector('h1', :text => 'Sample App') }

#		it { should have_selector('title', 
#						:text => "RoR Tut Sample App")}
#		it { should_not have_selector('title', :text => '| Home') }
	end
	
	describe "Help page" do
		before { visit help_path }

		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }
		it_should_behave_like "all static pages"
#		it { should have_selector('h1', :text => 'Help') }
#		it { should have_selector('title', 
#                                                :text => "#{base_title} | Help") }
         
	end

	describe "About page" do
		before { visit about_path }

		let(:heading) { 'About' }
		let(:page_title) { 'About' }
		it_should_behave_like "all static pages"

#		it { should have_selector('h1', :text => 'About Us') }
#		it { should have_selector('title', 
#                                                :text => "#{base_title} | About Us") }

	end

	describe "Contact page" do
		before { visit contact_path }

		let(:heading) { 'Contact' }
		let(:page_title) { 'Contact' }
		it_should_behave_like "all static pages"
#		it { should have_selector('h1', :text => 'Contact') }
#		it { should have_selector('title',
#						:text => "#{base_title} | Contact") }
	end


	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector 'title', :text => full_title("About Us")
		click_link "Help"
		page.should have_selector 'title', :text => full_title("Help")
		click_link "Contact"
		page.should have_selector 'title', :text => full_title("Contact")
		click_link "Home"
		click_link "Sign up now!"
		page.should have_selector 'title', :text => full_title("Sign up")
		click_link "sample app"
		page.should_not have_selector 'title', :text => full_title("Home")
	end 
end
