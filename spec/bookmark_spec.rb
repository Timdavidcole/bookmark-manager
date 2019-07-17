require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do

      Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'destroy all software')
      Bookmark.create(url: 'http://www.google.com', title: 'google')


      # Add the test data
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to include('http://www.makersacademy.com')
      expect(bookmarks[1].url).to include('http://www.destroyallsoftware.com')
      expect(bookmarks[2].url).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'test bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'test bookmark'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
#     end
#   end
# end
