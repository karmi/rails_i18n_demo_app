require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, :book => { :author => 'Kafka', :title => 'Metamorphosis', :items => '2' }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, :id => books(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => books(:one).id
    assert_response :success
  end

  test "should update book" do
    put :update, :id => books(:one).id, :book => { :author => 'Kafka', :title => 'Die Verwandlung', :items => '10' }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, :id => books(:one).id
    end

    assert_redirected_to books_path
  end
end
