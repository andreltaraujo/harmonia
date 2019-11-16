namespace :dev do
  
  DEFAULT_PASSWORD = 999999

  desc "Cadastra dados básicos para uso em desenvolvimento"
    task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando DB...") { %x(rails db:create) }
      show_spinner("Migrando DB...") { %x(rails db:migrate) } 
      show_spinner("Cadastrando ADMIN padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Gera contrato...") { %x(rails dev:generate_contract) }
      show_spinner("Cadastrando USER padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando outros USERS...") { %x(rails dev:add_others_users) }
      show_spinner("Cadastrando Telefones...") { %x(rails dev:add_phones_users) }
      show_spinner("Cadastrando Perfis...") { %x(rails dev:add_profile_users) }
      show_spinner("Cadastrando Endereço Resid...") { %x(rails dev:add_home_address) }
      show_spinner("Cadastrando Endereço Coml...") { %x(rails dev:add_business_address) }
      show_spinner("Cadastrando Dados Bancários...") { %x(rails dev:add_bank_infos) }
      show_spinner("Cadastrando Dependentes...") { %x(rails dev:add_dependents) }
      show_spinner("Cadstrando representantes...") { %x(rails dev:add_representatives) }
    else
      puts "Você não está no ambiente do desenvolvimento!"
    end
  end
    
  desc "Adiciona o administrador padrão"
    task add_default_admin: :environment do
      Admin.create!(
        email: 'admin@admin.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
        )
    end
  
    desc "Inicia número de contrato"
      task generate_contract: :environment do 
        Contract.create!(
          event: "New Contract",  
          contract_date: Date.today,
          price: "154,00"
        )
      end

  desc "Adiciona o usuário padrão"
    task add_default_user: :environment do
      User.create!(
      email: 'user@user.com',
      first_name: "André",
      last_name: "Araujo",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
      contract: Contract.first
      )
    end

  desc "Adiciona outros usuários"
    task add_others_users: :environment do
      10.times do |i| 
        User.create!(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          password: DEFAULT_PASSWORD,
          password_confirmation: DEFAULT_PASSWORD,
        )
      end
    end

  desc "Cadastra representantes"
    task add_representatives: :environment do
      5.times do |r|
        Representative.create!(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          code: Faker::Number.number(digits: 4), 
          cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
          rg: Faker::IDNumber.brazilian_id(formatted: true)
        )
      end
    end

  desc "Adiciona Perfil aos usuários"
    task add_profile_users: :environment do
      User.all.each do |_users|
        UserProfile.create!(
          birthdate: Faker::Date.birthday,
          cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
          rg: Faker::IDNumber.brazilian_id(formatted: true),
          mar_status: "Solteiro",
          secretary: Faker::Company.industry,
          entity: Faker::Company.name,
          user: _users
        )
      end
    end
  
  desc "Adiciona telefones aos usuários"
    task add_phones_users: :environment do
      User.all.each do |_user|
        Random.rand(1..3).times do |i|
          Phone.create!(
            phone_type: "Residencial",
            phone_number: Faker::PhoneNumber.phone_number,
            user: _user
          )
        end
      end
    end 
  
  desc "Adiciona Endereço Resid aos usuários"
    task add_home_address: :environment do
      User.all.each do |_use|
        HomeAddress.create!(
          street: Faker::Address.street_name,
          number: Faker::Address.building_number,
          district: Faker::Address.community,
          city: Faker::Address.city,
          state: Faker::Address.state,
          cep: Faker::Address.zip_code,
          user: _use
        )
      end
    end

  desc "Adiciona Endereço Coml aos usuários"
    task add_business_address: :environment do
      User.all.each do |_uses|
        BusinessAddress.create!(
          street: Faker::Address.street_name,
          number: Faker::Address.building_number,
          district: Faker::Address.community,
          city: Faker::Address.city,
          state: Faker::Address.state,
          cep: Faker::Address.zip_code,
          user: _uses
        )
      end
    end

  desc "Adiciona Dados Bancários aos usuários"
    task add_bank_infos: :environment do
      User.all.each do |use|
        BankInfo.create!(
          bank_name: Faker::Bank.name,
          bank_number: Faker::Number.number(digits: 3) ,
          agency_number: Faker::Number.number(digits: 5),
          account_number: Faker::Bank.account_number,
          debit_date: Faker::Date.forward(days: 30),
          user: use
        )
      end
    end

  desc "Adiciona Dependentes aos usuários"
    task add_dependents: :environment do
      User.all.each do |uses|
        Random.rand(1..6).times do |i|
          Dependent.create!(
            name: Faker::Name.name_with_middle,
            birthdate: Faker::Date.birthday,
            kinship: Faker::Relationship.familial,
            user: uses
          )
        end
      end
    end

  private
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end