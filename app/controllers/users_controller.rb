TrueIdentity::App.controllers  :users do

  post '/' do
    req = json_request
    UserAccount.transaction do
      user = UserAccount.where(:adhar_uuid => req[:adhar_uuid]).first
      if user.nil?
        user = UserAccount.create(:name => req[:name], :adhar_uuid => req[:adhar_uuid])
      end
      ThirdPartyAccount.create(:user_id => user.id, :service => req[:service], :token => req[:token])
    end
  end

  get '/:uuid' do
    u = UserAccount.find_by_adhar_uuid(params[:uuid])
    accounts = ThirdPartyAccount.where(:user_id => u.id)
    {
        :user => {
            :name => u.name,
            :uuid => u.adhar_uuid,
            :services =>  accounts.map do |a|
              {  :service => a.service, :verified => 'Y', :verified_at => a.created_at }
            end
        }
    }.to_json
  end

end
