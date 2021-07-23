class ApplicationController < ActionController::API

    # Step 1: Encode/Decode Tokens 
    def encode_token(payload)
        # should store secret in env variable. 
        JWT.encode(payload, 'my_s3cr3t')
    end 

end
