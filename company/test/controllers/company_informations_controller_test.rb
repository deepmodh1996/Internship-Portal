require 'test_helper'

class CompanyInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_information = company_informations(:one)
  end

  test "should get index" do
    get company_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_company_information_url
    assert_response :success
  end

  test "should create company_information" do
    assert_difference('CompanyInformation.count') do
      post company_informations_url, params: { company_information: { address_line1: @company_information.address_line1, address_line2: @company_information.address_line2, cell_number: @company_information.cell_number, city: @company_information.city, contact_number: @company_information.contact_number, contact_person: @company_information.contact_person, country: @company_information.country, designation: @company_information.designation, email: @company_information.email, name: @company_information.name, pin: @company_information.pin, type: @company_information.type, url: @company_information.url } }
    end

    assert_redirected_to company_information_url(CompanyInformation.last)
  end

  test "should show company_information" do
    get company_information_url(@company_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_information_url(@company_information)
    assert_response :success
  end

  test "should update company_information" do
    patch company_information_url(@company_information), params: { company_information: { address_line1: @company_information.address_line1, address_line2: @company_information.address_line2, cell_number: @company_information.cell_number, city: @company_information.city, contact_number: @company_information.contact_number, contact_person: @company_information.contact_person, country: @company_information.country, designation: @company_information.designation, email: @company_information.email, name: @company_information.name, pin: @company_information.pin, type: @company_information.type, url: @company_information.url } }
    assert_redirected_to company_information_url(@company_information)
  end

  test "should destroy company_information" do
    assert_difference('CompanyInformation.count', -1) do
      delete company_information_url(@company_information)
    end

    assert_redirected_to company_informations_url
  end
end
