require 'date'
require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  def test_should_return_available_locales
    assert_nothing_raised { @controller.available_locales }
    assert @controller.available_locales.is_a? Array
    assert @controller.available_locales.include?(:cz)
    assert @controller.available_locales.include?(:de)
    assert @controller.available_locales.include?(:en)
  end
  
  def test_should_render_proper_en_us_locale_by_default
    get :index
    assert_equal "Good bye!", assigns(:good_bye)
    assert_select 'p.hello_world', :text => 'Hello World!'
    assert_select 'p.currency',    :text => '$1,024.00'
    # TODO: Implement mocha and +falsify_today+ method
    assert_select 'span.localized_date',    :text => Date.today.strftime("%Y-%m-%d")
  end
  
  def test_should_render_proper_text_in_czech_locale
    get :index, :locale => 'cz'
    assert_equal "Nashledanou!", assigns(:good_bye)
    assert_select 'p.hello_world', :text => 'Dobrý den!'
    assert_select 'p.currency',    :text => '1 024,00 Kč'
    assert_select 'span.localized_date',    :text => Date.today.strftime("%d. %m. %Y")
  end
  
end
