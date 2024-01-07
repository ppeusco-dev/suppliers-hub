json.extract! supplier, :id, :name, :nit, :contact_person_name, :contact_person_phone, :bank_id, :bank_account_number, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
