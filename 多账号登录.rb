 spaceship/client.rb
 

line 174
   def get_team_id(team_id:nil)
      # First, we verify the team actually exists, because otherwise iTC would return the
      # following confusing error message
      #
      #     invalid content provider id
      #
      available_teams = teams.collect do |team|
        {
            team_id: (team["contentProvider"] || {})["contentProviderId"],
            team_name: (team["contentProvider"] || {})["name"]
        }
      end
    
   end  
    
 
 # Get the `itctx` from the new (22nd May 2017) API endpoint "olympus"
    # Update (29th March 2019) olympus migrates to new appstoreconnect API
    def fetch_olympus_session0


      response = request(:get, "https://appstoreconnect.apple.com/olympus/v1/session")
      body = response.body
      if body
        body = JSON.parse(body) if body.kind_of?(String)
        user_map = body["user"]
        if user_map
          self.user_email = user_map["emailAddress"]
        end

        provider = body["provider"]
        if provider
          self.provider = Spaceship::Provider.new(provider_hash: provider)
          return true
        end
      end

      return false
    end
    def fetch_olympus_session
      get_team_id(team_id: "120015883")

      response = request(:get, "https://appstoreconnect.apple.com/olympus/v1/session")
      body = response.body
      if body
        body = JSON.parse(body) if body.kind_of?(String)
        user_map = body["user"]
        if user_map
          self.user_email = user_map["emailAddress"]
        end

        provider = body["provider"]
        if provider
          self.provider = Spaceship::Provider.new(provider_hash: provider)
          return true
        end
      end

      return false
    end
    
    
    
line 526    
    
    
    
          when 403
        raise InvalidUserCredentialsError.new, "Invalid username and password combination. Used '#{user}' as the username."
      when 200
        fetch_olympus_session0
        fetch_olympus_session
        return response
      when 409
