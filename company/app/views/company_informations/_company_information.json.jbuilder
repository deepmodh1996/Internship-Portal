json.extract! company_information, :id, :name, :address_line1, :address_line2, :city, :country, :pin, :url, :contact_person, :designation, :email, :contact_number, :cell_number, :type, :created_at, :updated_at
json.url company_information_url(company_information, format: :json)