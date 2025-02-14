# spec/system/library_flows_spec.rb
describe 'admin functions' do
    let(:admin) { create(:user, admin: true) }
  
    before do
      sign_in admin
      visit books_path
    end
  
    it 'allows admin to add new books' do
      click_link 'Add New Book'
      
      # Add debugging if field isn't found
      puts page.html if page.has_no_field?('book[isbn]')
      
      fill_in 'Title', with: 'New Book'
      fill_in 'Author', with: 'New Author'
      fill_in 'book[isbn]', with: '0987654321'  # Use the exact field name
      
      click_button 'Add Book'
      expect(page).to have_content('Book was successfully created')
    end
  end