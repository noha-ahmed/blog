require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:valid_attributes) do
    {
      'id' => '4',
      'author' => 'author',
      'content' => 'hi it is a contenr',
    }
  end

  let(:invalid_attributes) do
    {
      'id' => '5',
      'author' =>  'k',
      'content' => '12aklkl34'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      post = Post.new(valid_attributes)
      # post.user = current_user
      post.save
      get posts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Post.new(valid_attributes)
      # post.user = current_user
      post.save
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      post = Post.new(valid_attributes)
      # post.user = current_user
      post.save
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        expect do
          post posts_url, params: { post: valid_attributes }
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(posts_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Post' do
        expect do
          post posts_url, params: { post: invalid_attributes }
        end.to change(Post, :count).by(0)
      end

      it "renders a successful response (posts page)" do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to redirect_to(posts_url)
      end
    end
  end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       {
  #         'id' => '4',
  #         'author' => 'Test',
  #         'content' => '123451',
  #         # 'user' => current_user
  #       }
  #     end

  #     it 'updates the requested post' do
  #       patch post_url(post), params: { post: new_attributes }
  #       post.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'redirects to the post' do
  #       patch post_url(post), params: { post: new_attributes }
  #       post.reload
  #       expect(response).to redirect_to(post_url(post))
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested post' do
  #     expect do
  #       delete post_url(post)
  #     end.to change(Post, :count).by(-1)
  #   end

  #   it 'redirects to the posts list' do
  #     delete post_url(post)
  #     expect(response).to redirect_to(posts_url)
  #   end
  # end

end
