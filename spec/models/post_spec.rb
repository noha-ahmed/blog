require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    Post.new(author: "Noha", content: "Hi there! this is my first post!")
  }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  
  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without content' do
    subject.content = nil
    expect(subject).to_not be_valid
  endcomment_author_name

end
