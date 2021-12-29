# Admins
FactoryBot.create(:admin, email: 'renato@p4gseguro.com', password: '123123')
FactoryBot.create(:admin, email: 'admin@p4gseguro.com', password: '123123')

# Companies
company1 = FactoryBot.create(:company, name: FFaker::Company.unique.name ,
                                       cnpj: FFaker::IdentificationBR.unique.cnpj,
                                       billing_address: FFaker::Address.unique.street_address,
                                       billing_email: FFaker::Internet.unique.safe_email)
company2 = FactoryBot.create(:company, name: FFaker::Company.unique.name ,
                                       cnpj: FFaker::IdentificationBR.unique.cnpj,
                                       billing_address: FFaker::Address.unique.street_address,
                                       billing_email: FFaker::Internet.unique.safe_email)

# Users
user1 = FactoryBot.create(:user, :owner, email: 'joao@' + company1.name.gsub(/[^0-9a-z ]/i, '').delete(' ').downcase! + '.com',
                                         password: '123123', company: company1)
user2 = FactoryBot.create(:user, :owner, email: 'user@' + company2.name.gsub(/[^0-9a-z ]/i, '').delete(' ').downcase! + '.com',
                                        password: '123123', company: company2)
